import { NextFunction, Response } from "express";
import admin from "firebase-admin";
import { IRequest } from "../../../../utils/auth";
import { prisma } from "../../../../utils/db";

export const checkAuth = function () {
  return (req: IRequest, res: Response, next: NextFunction) => {
    const idToken = req.headers["firebase-auth-token"] as string;
    if (idToken) {
      admin
        .auth()
        .verifyIdToken(idToken)
        .then(async (fbUser) => {
          const exisitingUser: any = await prisma.user.findUnique({
            select: {
              id: true,
              locale: true,
              username: true,
            },
            where: { email: fbUser.email },
          });

          req.user = exisitingUser;

          next();
        })
        .catch((_) => {
          next();
        });
    } else {
      next();
    }
  };
};

export const permit = function (...permittedRoles: string[]) {
  return (req: IRequest, res: Response, next: NextFunction) => {
    const user = req.user;

    if (user) {
      next();
    } else {
      res.status(403).json({ message: "Unauthorized" });
    }
  };
};

export const mobilePermit = function () {
  return (req: IRequest, res: Response, next: NextFunction) => {
    const version = req.headers["thenobody-version"] as string;
    const userAgent = req.headers["user-agent"] as string;

    if (userAgent.includes("Dart") && version) {
      next();
    } else {
      res.status(403).json({ message: "Unauthorized" });
    }
  };
};
