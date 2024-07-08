import express from "express";
import dotenv from "dotenv";
import helmet from "helmet";
import cors from "cors";
import admin from "firebase-admin";
import { v4 as uuidv4 } from "uuid";

// Setup firebase admin
admin.initializeApp({
  credential: admin.credential.cert(`./firebaseServiceAccountKey.json`),
});

// Load the env variable for local development
dotenv.config({ path: `${__dirname}/.env` });

import { router as authRouter } from "./features/auth/auth.routes";

import { checkAuth } from "./features/auth/auth.middleware";
import { prisma } from "../../utils/db";

const main = async () => {
  const port = process.env.PORT;
  let app: express.Application = express();

  app.use(helmet());
  app.use(cors());

  app.use(checkAuth());
  app.use(authRouter);

  // Connect to the db
  await prisma.$connect();

  const serviceId = uuidv4();
  app.get("/health", (req, res) => {
    res.json({
      status: "pass",
      version: "1",
      serviceID: serviceId,
      description: "Health of api",
    });
  });

  app.listen(port, () => {
    console.log(`server running on port ${port}`);
    if (process.env.DEBUG) console.log("debug mode");
  });
};

main();
