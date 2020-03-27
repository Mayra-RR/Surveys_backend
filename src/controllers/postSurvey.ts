import { Request, Response, response } from "express";
import con from "../connection/connection";
/* import { insertResultQuery } from "../querys/insertResult"; */
import { classifyHelper } from "../helpers/classifyHelper";
import { insertResultQuery, updateResultQuery } from "../querys/insertResult"


export default (req: Request, res: Response) => {
    console.log(req.body)
    const classifyData = classifyHelper(req.body)
    const insertQuery = insertResultQuery(req.params.survey_id, classifyData.insert)
    const updateQuery = updateResultQuery(req.params.survey_id, classifyData.update)

    const promises = [];

    con.query(insertQuery + updateQuery, (err, result, fields) => {
        const data = result.filter(v => Array.isArray(v))
        return res.status(200).send(data.flat())
    });

}; 