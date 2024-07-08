import express from "express";
import bodyParser from "body-parser";
import AuthController from "./auth.controller";

export const router = express.Router();

// POST Sign in
router.post("/auth/login", bodyParser.json(), AuthController.login);
