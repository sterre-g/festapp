import dotenv from "dotenv";
dotenv.config();

import { OpenAI } from "openai";
import fs from "fs";
import path from "path";

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY!,
});

export async function generateTest(widgetFile: string) {
  const widgetContent = fs.readFileSync(widgetFile, "utf-8");
  const widgetName = path.basename(widgetFile, ".dart");

  const filePath = path.join(__dirname, "prompt.md");
  const promptContent = fs.readFileSync(filePath, "utf-8");
  const prompt = `You should generate tests for: "${widgetContent}"`;

  try {
    const response = await openai.chat.completions.create({
      model: "gpt-3.5-turbo",
      messages: [
        { role: "system", content: promptContent },
        { role: "user", content: prompt },
      ],
    });

    const generatedTest = response.choices[0].message.content;

    // Save the test to the appropriate test file
    const testFile = path.join("test", `${widgetName}_accessibility_test.dart`);
    fs.writeFileSync(testFile, generatedTest);
    console.log(`✅ Test generated for ${widgetName} at ${testFile}`);
  } catch (error) {
    console.error(`❌ Failed to generate test for ${widgetName}:`, error);
  }
}

// Example to call it for all missing tests
async function main() {
  const missingTests = JSON.parse(
    fs.readFileSync("missing_accessibility_tests.json", "utf-8")
  );

  const widgetFile = missingTests[0];
  //   for (const widgetFile of missingTests) {
  await generateTest(widgetFile);
  //   }e
}

main();
