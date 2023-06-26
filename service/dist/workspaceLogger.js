"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.WorkspaceLogger = void 0;
const constants_1 = require("./constants");
const utils_1 = require("./utils");
const fs_1 = __importDefault(require("fs"));
const constants_2 = require("./constants");
const child_process_1 = require("child_process");
class WorkspaceLogger {
    constructor() {
        this.getCurrentWorkspace = () => {
            const workspaceNames = JSON.parse(`${(0, child_process_1.execSync)("gsettings get org.gnome.desktop.wm.preferences workspace-names")
                .toString()
                .replace(/'/g, '"')}`);
            const workspaceIndex = Number((0, child_process_1.execSync)("export DISPLAY=:0 && export XAUTHORITY=/home/peter/.Xauthority && xdotool get_desktop").toString());
            return {
                time: Math.round(Date.now() / 1000).toString(),
                workspaceName: `${workspaceNames.find((wk, i) => i === workspaceIndex) || "Unknown"}`,
            };
        };
        this.appendToLogFile = (workspaceLogs) => {
            fs_1.default.appendFileSync(constants_2.LOG_FILE_PATH, `${workspaceLogs
                .map((log) => `${log.time}: ${log.workspaceName}`)
                .join("\n")}\n`);
        };
        this.logWorkspaces = () => __awaiter(this, void 0, void 0, function* () {
            let workspaceLogs = [];
            while (true) {
                workspaceLogs.push(this.getCurrentWorkspace());
                if (workspaceLogs.length === constants_1.LOG_BATCH_SIZE) {
                    this.appendToLogFile(workspaceLogs);
                    workspaceLogs = [];
                }
                yield (0, utils_1.sleep)(constants_1.LOG_INTERVAL);
            }
        });
    }
}
exports.WorkspaceLogger = WorkspaceLogger;
//# sourceMappingURL=workspaceLogger.js.map