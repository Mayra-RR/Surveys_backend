const findSurvey = 
`SELECT surveys.description, surveys.survey_id, questions.question, questions.type, questions.options, questions.question_id 
FROM surveys 
RIGHT JOIN questions 
ON surveys.survey_id = questions.survey_id 
WHERE surveys.survey_id = :id`;

const showSurveyAnswers=
`SELECT * FROM mysurveys.result WHERE group_id = :id`;

export function findSurveyQuery(id:string){
    return findSurvey.replace(':id', id);
}

export function getSurveyAnswers(id:string){
    return showSurveyAnswers.replace(':id', id);
}