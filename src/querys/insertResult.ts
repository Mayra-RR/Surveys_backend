const insertResult = 
`INSERT INTO result 
    ( question_id, answer, survey_id ) 
VALUES 
     :values`;

const updateResult =
 `UPDATE mysurveys.result 
 SET answer = ":answer"
 WHERE result_id = :id;`;

export function insertResultQuery(survey_id: string, data: any[]){
    /* return insertResult.replace(':id', id); */

    const values = data.reduce((acc, current, i ) => {
        const delimiter = ( data.length === i + 1 ) ? ';' : ',';
        acc += `( ${current.question_id}, "${current.answer}", ${survey_id} )${delimiter}${'\n'}`
        return acc;
    }, 
    ""
    );
    return insertResult.replace(':values', values);
}

export function updateResultQuery(survey_id: string, data: any[] ){
    
    return data.reduce((acc, current) => {

        acc += updateResult.replace(':answer', current.answer).replace(':id', survey_id)+'\n';
        
        return acc;
    },
    ""
    )
}