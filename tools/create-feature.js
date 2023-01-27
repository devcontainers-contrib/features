#!/usr/bin/env -S deno run -A

import * as DenoFS from "https://deno.land/std@0.171.0/fs/mod.ts";

console.log("You are creating a new feature!");

const name = prompt("Name:");
const description = prompt("Description:");
const id = prompt("ID:");
const testCommand = prompt("Test command:");
const templateArgs = { name, description, id, testCommand };

await DenoFS.copy("tools/TEMPLATE-src-id/", `src/${id}/`);
console.log(`Copied tools/TEMPLATE-src-id/ to src/${id}/`);
await DenoFS.copy("tools/TEMPLATE-test-id/", `test/${id}/`);
console.log(`Copied tools/TEMPLATE-test-id/ to test/${id}/`);

for await (const { path, isFile } of DenoFS.walk(`src/${id}/`)) {
  if (!isFile) {
    continue;
  }
  for (const [name, value] of Object.entries(templateArgs)) {
    const text = await Deno.readTextFile(path);
    const newText = text.replaceAll(`\${templateOption:${name}}`, value);
    await Deno.writeTextFile(path, newText);
  }
  console.log(`Updated ${path}`);
}
for await (const { path, isFile } of DenoFS.walk(`test/${id}/`)) {
  if (!isFile) {
    continue;
  }
  for (const [name, value] of Object.entries(templateArgs)) {
    const text = await Deno.readTextFile(path);
    const newText = text.replaceAll(`\${templateOption:${name}}`, value);
    await Deno.writeTextFile(path, newText);
  }
  console.log(`Updated ${path}`);
}

console.log(`You can find more information about common patterns, templates for specific
package managers (npm, pip, etc.) and other tidbits in the GitHub wiki:
https://github.com/devcontainers-contrib/features/wiki`);
