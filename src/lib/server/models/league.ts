import { Schema, model } from "mongoose";

interface ILeague {
  name: string;
  sport: string;
}

const schema = new Schema<ILeague>({
  name: { type: String, required: true },
  sport: { type: String, required: true },
});

const League = model<ILeague>("League", schema);

export { League };
