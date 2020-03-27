import { Request, Response } from "express";
import con from "../connection/connection";
/* import { insertResultQuery } from "../querys/insertResult"; */
import { classifyHelper } from "../helpers/classifyHelper";
import { insertResultQuery, updateResultQuery } from "../querys/insertResult"


export default (req: Request, res: Response) => {
    console.log(req.body)
    const result = classifyHelper(req.body)
    const insertQuery = insertResultQuery(req.params.survey_id, result.insert)
    const updateQuery = updateResultQuery(req.params.survey_id, result.update)

    /* let result = {
        id: null,
        answer: [],
        
    };
    const id = req.params.id;
     con.query(insertResultQuery(id), function(err, result, fields){
        if (err){
            throw err;
        } else{
            res.status(200).send(result);
        } 
    }) */


    res.status(200).send(insertQuery +'\n\n'+ updateQuery);
    console.log(req.body);
    
};