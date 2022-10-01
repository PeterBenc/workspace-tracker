import express from "express";
import { logWorkspaces } from "./logging";
const app = express();
const port = process.env.PORT || 3001;

app.listen(port, async () => {
  try {
    await logWorkspaces();
  } catch (e) {
    process.exit();
  }
});