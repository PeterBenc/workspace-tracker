import express from "express";
import { logWorkspaces } from "./logging";
const app = express();
const port = 3001; // TODO: from .env

app.listen(port, async () => {
  try {
    await logWorkspaces();
  } catch (e) {
    process.exit();
  }
});
