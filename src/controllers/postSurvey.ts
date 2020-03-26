import { Request, Response } from "express";
import con from "../connection/connection";

export default (req: Request, res: Response) => {
    
    
    let result = {
        
    }

    
  /*   con.query(`INSERT INTO result(answer) values("${option}");`, function(err, result, fields){
        if (err){
            throw err;
        } else{
            res.status(200).send(result);
        } 
    })*/

    res.status(200).send(result);
    console.log(req.body);
    
};