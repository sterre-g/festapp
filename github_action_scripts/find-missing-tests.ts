import fs from "fs";
import path from "path";
import { getOpenPrWidgets } from "./get-open-pr-widget-tests";

const libDir = path.join(process.cwd(), "lib");
const testDir = path.join(process.cwd(), "test");

function listDartFiles(dir: string): string[] {
  const files: string[] = [];
  const items = fs.readdirSync(dir, { withFileTypes: true });

  for (const item of items) {
    const fullPath = path.join(dir, item.name);
    if (item.isDirectory()) {
      files.push(...listDartFiles(fullPath));
    } else if (item.name.endsWith(".dart")) {
      files.push(fullPath);
    }
  }

  return files;
}

function getTestedWidgets(): Set<string> {
  const tested = new Set<string>();
  const testFiles = listDartFiles(testDir);

  for (const file of testFiles) {
    const content = fs.readFileSync(file, "utf-8");
    if (content.includes("find.bySemanticsLabel")) {
      // crude heuristic: extract possible widget names from test filenames
      const base = path.basename(file).replace("_test.dart", "");
      tested.add(base);
    }
  }

  return tested;
}

async function main() {
  const widgetFiles = listDartFiles(libDir);
  const testedWidgets = getTestedWidgets();
  const openPRWidgets = await getOpenPrWidgets();

  const untested: string[] = [];

  for (const file of widgetFiles) {
    const base = path.basename(file).replace(".dart", "");
    if (!testedWidgets.has(base) && !openPRWidgets.has(base)) {
      untested.push(file);
    }
  }

  fs.writeFileSync(
    "missing_accessibility_tests.json",
    JSON.stringify(untested, null, 2)
  );

  console.log(
    `✅ Found ${untested.length} widgets missing accessibility tests.`
  );
}

main();
