import { Request, Response } from "express";
import con from "../connection/connection";
import { findSurveyQuery, getSurveyAnswers } from "../querys/findSurvey";
import { promiseQuery } from "../helpers/promiseQuery";

export default (req: Request, res: Response) => {
    const resData = {
        id: null,
        description: null,
        questions: [],
    };
    
    const group_id = req.query.group_id;
    const id = req.params.id;
    const querySurvey = findSurveyQuery(id);
    const queryAnswers = getSurveyAnswers(group_id);
    const promises = [promiseQuery(con, querySurvey), promiseQuery(con,queryAnswers) ]

    console.log(group_id);
    console.log((id));
    
    

    Promise.all(promises)
    .then((data: any[]) => {
        
        const surveyResult = data[0].result;
        const answersResult = data[1].result;
        surveyResult.forEach((row, i) => {
            if( i === 0){
                resData.id = row.survey_id; 
                resData.description = row.description;
            } 
            resData.questions.push({ 
                id: row.question_id,
                question: row.question,
                type: row.type,
                options: row.options.split(/\,\s?/)
            }) 
        });
    
    return {resData, answersResult}; 
    })
    .then((data: any) => {
      
        data.answersResult.forEach((row ) => {
            const i = data.resData.questions.findIndex(question  => question.id === row.question_id);
           console.log(i);
           
            if (i === -1) return ;
            
            data.resData.questions[i].answer = {
                id: row.result_id,
                answer: row.answer,
                question_id: row.question_id,
            };
        })
        return data.resData
    })
    .then(data => res.status(200).send(data))
    .catch(console.log);
    
};