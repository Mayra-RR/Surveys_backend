import { Request, Response, response } from "express";
import con from "../connection/connection";
import { classifyHelper } from "../helpers/classifyHelper";
import { insertResultQuery/* , updateResultQuery */ } from "../querys/insertResult"


export default (req: Request, res: Response) => {
    console.log(req.body)
    console.log(req.params.id);
    
    const classifyData = classifyHelper(req.body)
    const insertQuery = insertResultQuery(req.params.id, classifyData.insert)
    /* const updateQuery = updateResultQuery(req.params.id, classifyData.update) */

   /*  const promises = []; */

    console.log(insertQuery);
    

    con.query(insertQuery, (err, result = [], fields) => {
        const data = result.filter(v => Array.isArray(v))
        return res.status(200).send(data.flat())
    });

}; 