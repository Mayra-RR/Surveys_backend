import { Request, Response } from "express";
import con from "../connection/connection";

export default (req: Request, res: Response) => {
    con.query(`INSERT INTO surveys`, function(err, result, fields){
        if (err){
            throw err;
        } else{
            res.status(200).send(result);
        }
    })
};