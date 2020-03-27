const insertResult = 
`INSERT INTO result 
    ( question_id, answer, survey_id, group_id ) 
VALUES 
     :values
SELECT group_id FROM result WHERE result_id = LAST_INSERT_ID()`;

const updateResult =
 `UPDATE mysurveys.result 
 SET answer = ":answer"
 WHERE result_id = :id
 SELECT * FROM result;`;

 /* const resultQuery =
 'SELECT * FROM result;'; */

export function insertResultQuery(survey_id: string, data: any[]){
    /* return insertResult.replace(':id', id); */
    const group_id = Date.now()
    const values = data.reduce((acc, current, i ) => {
        const delimiter = ( data.length === i + 1 ) ? ';' : ',';
        acc += `( ${current.question_id}, ${current.answer}, ${survey_id}, "${group_id}" )${delimiter}${'\n'}`
        return acc;
    }, 
    ""
    );
    return insertResult.replace(':values', values)/*  + resultQuery */;
}

export function updateResultQuery(survey_id: string, data: any[] ){
    
    return data.reduce((acc, current) => {

        acc += updateResult.replace(':answer', current.answer).replace(':id', survey_id)+'\n';
        
        return acc ;
    },
    ""
    ) /* + resultQuery */;
};