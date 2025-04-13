import dotenv from "dotenv";
dotenv.config();

import { Octokit } from "@octokit/rest";
import path from "path";

const octokit = new Octokit({
  auth: process.env.GITHUB_TOKEN!,
});

const owner = process.env.GITHUB_USERNAME!;
const repo = process.env.GITHUB_REPOSITORY!;

export async function getOpenPrWidgets(): Promise<Set<string>> {
  if (!owner || !repo) {
    console.error("Missing GITHUB_OWNER or GITHUB_REPO in .env");
    process.exit(1);
  }

  const widgets = new Set<string>();

  const prs = await octokit.rest.pulls.list({ owner, repo, state: "open" });

  for (const pr of prs.data) {
    const files = await octokit.rest.pulls.listFiles({
      owner,
      repo,
      pull_number: pr.number,
    });

    for (const file of files.data) {
      if (
        file.filename.startsWith("test/") &&
        file.filename.endsWith(".dart")
      ) {
        const name = path.basename(file.filename).replace("_test.dart", "");
        widgets.add(name);
      }
    }
  }

  return widgets;
}
