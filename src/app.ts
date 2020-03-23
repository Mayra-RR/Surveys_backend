import express, { Application } from "express";
import surveyRoutes from "../src/routes/surveyRoutes";
import bodyParser from "body-parser";
import cors from "cors";
 
const app: Application = express();

// 3th party middleware
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json());
app.use(cors())

// Survey routes
app.use('/surveys', surveyRoutes);


export default app;