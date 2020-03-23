import express, { Router } from "express";
import getSurvey from "../controllers/getSurvey";
import getquestions from "../controllers/questions/getquestions";
/* import postSurvey from "../controllers/postSurvey";
import deleteSurvey from "../controllers/deleteSurvey"; */
const router: Router = express.Router();

router.get('/getSurvey', getSurvey);
router.get('/getquestions', getquestions);
/* router.post('/postSurvey', postSurvey);
router.delete('/delete/:id', deleteSurvey); */

export default router;