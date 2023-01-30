import express from "express";
import { PORT } from "./constants";
import { WorkspaceLogger } from "./workspaceLogger";

const workspaceLogger = new WorkspaceLogger();

const app = express();

app.listen(PORT, async () => {
  try {
    await workspaceLogger.logWorkspaces();
  } catch (e) {
    console.log(e);
    process.exit(1);
  }
});
