import express, { Router } from "express";
import getSurvey from "../controllers/getSurvey";
/* import postSurvey from "../controllers/postSurvey";
import deleteSurvey from "../controllers/deleteSurvey"; */
const router: Router = express.Router();

router.get('/getSurvey', getSurvey);
/* router.post('/postSurvey', postSurvey);
router.delete('/delete/:id', deleteSurvey); */

export default router;