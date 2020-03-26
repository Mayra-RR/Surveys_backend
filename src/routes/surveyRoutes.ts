import express, { Router } from "express";
import getSurveys from "../controllers/getSurveys";
/* import getquestions from "../controllers/questions/getquestions"; */
import postSurvey from "../controllers/postSurvey";
/*import deleteSurvey from "../controllers/deleteSurvey"; */
const router: Router = express.Router();

router.get('/getSurveys/:id', getSurveys);
/* router.get('/getquestions', getquestions); */
router.post('/postSurvey', postSurvey);
/*router.delete('/delete/:id', deleteSurvey); */

export default router;