import express from "express";
import { logWorkspaces } from "./logging";
const app = express();
const port = 3001;

app.listen(port, async () => {
  logWorkspaces();
});
