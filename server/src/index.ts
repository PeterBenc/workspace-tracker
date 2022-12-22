import express from "express";
const app = express();
const port = process.env.PORT || 3001;

app.listen(port, async () => {
  try {
    // await logWorkspaces();
  } catch (e) {
    process.exit();
  }
});
