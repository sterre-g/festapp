import dotenv from "dotenv";
dotenv.config();

import fs from "fs";
import path from "path";

const ollamaApiUrl = "http://localhost:11434/v1/chat/completions";

// Function to call Ollama locally with fetch
async function generateTest(widgetFile: string) {
    const widgetContent = fs.readFileSync(widgetFile, "utf-8");
    const widgetName = path.basename(widgetFile, ".dart");

    const filePath = path.join(__dirname, "prompt.md");
    const promptContent = fs.readFileSync(filePath, "utf-8");
    const prompt = `You should generate tests for: "${widgetContent}"`;

    try {
        // Fetch request to Ollama API
        const response = await fetch(ollamaApiUrl, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                Authorization: `Bearer ${process.env.OLLAMA_API_KEY}`,
            },
            body: JSON.stringify({
                model: "deepseek-r1:8b",
                messages: [
                    { role: "system", content: promptContent },
                    { role: "user", content: prompt },
                ],
            }),
        });

        if (!response.ok) {
            throw new Error(`Ollama API error: ${response.statusText}`);
        }

        const data = await response.json();
        const generatedTest = data.choices[0].message.content;

        // Save the test to the appropriate test file
        const testFile = path.join(
            "test",
            `${widgetName}_accessibility_test.dart`
        );
        fs.writeFileSync(testFile, generatedTest);
        console.log({ generatedTest });
        console.log(` Test generated for ${widgetName} at ${testFile}`);
    } catch (error) {
        console.error(` Failed to generate test for ${widgetName}:`, error);
    }
}

// Example to call it for all missing tests
async function main() {
    const missingTests = JSON.parse(
        fs.readFileSync(
            "github_action_scripts/output/missing_accessibility_tests.json",
            "utf-8"
        )
    );

    const widgetFile = missingTests[0]; // Only testing the first widget for now
    await generateTest(widgetFile);
}

main();
