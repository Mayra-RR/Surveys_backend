import { Request, Response } from "express";
import con from "../connection/connection";

export default (req: Request, res: Response) => {
    console.log(req.params.id);
    
    const id = req.params.id;
    con.query(`SELECT surveys.description, surveys.survey_id, questions.question, questions.type, questions.options, questions.question_id FROM surveys RIGHT JOIN questions ON surveys.survey_id = (questions.survey_id=${id})`, function(err, result, fields){
        if (err){
            throw err;
        } else{
            res.status(200).send(result);
        }
    })
};