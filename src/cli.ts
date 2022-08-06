import { execSync } from "child_process";

export const getCurrentWorkspace = (): WorkspaceLog => {
  const workspaceNames = JSON.parse(
    `${execSync(
      "gsettings get org.gnome.desktop.wm.preferences workspace-names"
    )
      .toString()
      .replace(/'/g, '"')}`
  ) as string[];
  const workspaceIndex = Number(
    execSync(
      "export DISPLAY=:0 && export XAUTHORITY=/home/peter/.Xauthority && xdotool get_desktop"
    ).toString()
  );
  return {
    time: Math.round(Date.now() / 1000).toString(),
    workspaceName: `${
      workspaceNames.find((wk, i) => i === workspaceIndex) || "Unknown"
    }`,
  };
};
2;
