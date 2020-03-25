import { Request, Response } from "express";
import con from "../connection/connection";

export default (req: Request, res: Response) => {
    const option = req.body.params.link
    con.query(`INSERT INTO result(answer) values("${option}");`, function(err, result, fields){
        if (err){
            throw err;
        } else{
            res.status(200).send(result);
        }
    })
};