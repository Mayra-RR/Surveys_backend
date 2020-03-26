import { Request, Response } from "express";
import con from "../connection/connection";
import { findSurveyQuery } from "../querys/findSurvey";

export default (req: Request, res: Response) => {
    let data = {
        id: null,
        description: null,
        questions: [],
    };
    
    const id = req.params.id;
    con.query(findSurveyQuery(id), function(err, result, fields){
        if (err){
            throw err;
        } else{
            result.forEach( (row, i) => {
                if( i === 0){
                    data.id = row.survey_id; 
                    data.description = row.description;
                } 
                data.questions.push({ 
                    id: row.question_id,
                    question: row.question,
                    type: row.type,
                    options: row.options.split(/\,\s?/)
                })
            })
            res.status(200).send(data);
           /*  console.log(result); */
        }
    })
};