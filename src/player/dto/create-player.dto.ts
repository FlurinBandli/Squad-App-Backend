import { Gender } from "src/types";

export class CreatePlayerDto {
  firstName: string;
  lastName: string;
  gender: Gender;
}
