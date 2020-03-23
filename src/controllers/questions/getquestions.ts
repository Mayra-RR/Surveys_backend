import { Request, Response } from "express";
import con from "../../connection/connection";

export default (req: Request, res: Response) => {
    con.query(`SELECT surveys.description, questions.question, questions.type, questions.options FROM surveys RIGHT JOIN questions ON surveys.survey_id = questions.survey_id;`, function(err, result, fields){
        
        if (err){
            throw err;
        } else{
            
            res.status(200).send(result);
        }

    })

};
