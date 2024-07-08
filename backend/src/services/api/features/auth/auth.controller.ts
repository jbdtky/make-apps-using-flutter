import { Response } from "express";
import { IRequest } from "../../../../utils/auth";
import admin from "firebase-admin";
import { prisma } from "../../../../utils/db";

class AuthController {
  async login(req: IRequest, res: Response) {
    const idToken = req.headers["firebase-auth-token"] as string;
    const version = req.headers["thenobody-version"] as string;
    const userAgent = req.headers["user-agent"] as string;

    // if (userAgent.includes('Dart') && (!version || parseInt(version) < 1)) {
    //   return res
    //     .status(426)
    //     .json({ message: 'Please upgrade the application' });
    // }

    if (!idToken) {
      return res.status(403).json({ message: "Unauthorized" });
    }

    // Register any phone that tries to connect to reengage
    // with them later if they do not complete the auth.
    try {
      const fbUser = await admin.auth().verifyIdToken(idToken);

      let data: any = {
        lastSeenAt: new Date(),
      };

      const user = await prisma.user.upsert({
        select: {
          id: true,
          role: true,
          username: true,
          dateOfBirth: true,
          pictureUrl: true,
          thumbnailPictureUrl: true,
          referralUser: {
            select: {
              id: true,
              username: true,
            },
          },
        },
        create: {
          email: fbUser.email,
          ...data,
        },
        update: {
          ...data,
        },
        where: {
          email: fbUser.email,
        },
      });

      return res.status(200).json({
        user: user,
      });
    } catch (err) {
      console.log(err);
      return res.status(403).json({ message: "Unauthorized" });
    }
  }
}

export default new AuthController();
