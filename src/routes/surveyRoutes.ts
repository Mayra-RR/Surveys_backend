import express, { Router } from "express";
import getSurveys from "../controllers/getSurveys";
/* import getquestions from "../controllers/questions/getquestions"; */
import postSurvey from "../controllers/postSurvey";
import getSurveyAnswers from "../controllers/getSurveyAnswers"
/*import deleteSurvey from "../controllers/deleteSurvey"; */
const router: Router = express.Router();

router.get('/getSurveys/:id', getSurveys);
/* router.get('/getquestions', getquestions); */
router.post('/postSurvey/:id', postSurvey);
router.get('/getSurveyAnswers/:id', getSurveyAnswers)
/*router.delete('/delete/:id', deleteSurvey); */

export default router;