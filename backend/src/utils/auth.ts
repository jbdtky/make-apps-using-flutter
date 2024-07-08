import { Request } from "express";

export type User = {
  id: string;
  locale: string;
  username?: string;
};

export type UserSub = {
  id: string;
  username?: string;
};

// Request potentially authenticated
export interface IRequest extends Request {
  user?: User;
}
