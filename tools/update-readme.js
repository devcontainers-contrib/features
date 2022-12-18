#!/usr/bin/env -S deno run -A
/**
 * This script updates the README.md file with the latest list of features. It
 * is run automatically by the CI/CD pipeline on every commit to main [1].
 *
 * The script reads the src/ folder and generates an HTML list of all the
 * features. It then replaces the placeholder in the README.md file with the
 * generated list. The placeholder is defined by the START and END constants.
 *
 * Why an HTML list instead of a Markdown list? Because VS Code supports
 * collapsing HTML lists, but not Markdown lists.
 *
 * 1. Read the src/ folder and get all the folders.
 * 2. Sort the folders by name alphabetically.
 * 3. For each folder, get the devcontainer-feature.json file.
 * 4. For each feature, get the name, description, and url.
 * 5. Map each of those features to an HTML list item.
 * 6. Join the list items into a single string.
 * 7. Read the README.md file.
 * 8. Replace the previous HTML list with the new HTML list.
 * 9. Write the README.md file.
 * 10. Print a report card of the changes and the number of features.
 *
 * Example:
 *
 *     <!-- prettier-ignore FEATURES_INDEX -->
 *     <ul><li>...</li><li>...</li><li>...</li></ul>
 *
 * We want to find and replace that <ul>...</ul> block with the new list of
 * features. This START variable is used to find the start of the block. We then
 * use the next line after that and replace that, regardless of what content is
 * there.
 *
 * We are using the re-template-tag library to make the regex easier to read.
 * This allows us to split a single regex into multiple separate regexes. [2]
 *
 * [1]: https://github.com/devcontainers-contrib/features/blob/main/.github/workflows/update-readme.yml
 * [3]: https://2ality.com/2017/07/re-template-tag.html
 */

import { re } from "https://esm.sh/re-template-tag";

const preLine = /<!--\s*prettier-ignore\s+FEATURES?_INDEX\s*-->/;

// 1. Read the src/ folder and get all the folders.
/** @type {string[]} */
let featureIds = [];
for await (const { name, isDirectory } of Deno.readDir("src")) {
  if (isDirectory) {
    featureIds.push(name);
  }
}

// 2. Sort the folders by name alphabetically.
featureIds.sort();

// 3. For each folder, get the devcontainer-feature.json file.
// 4. For each feature, get the name, description, and url.
const features = await Promise.all(
  featureIds.map(async (featureId) => {
    const path = `src/${featureId}/devcontainer-feature.json`;
    const json = await Deno.readTextFile(path);
    const manifest = JSON.parse(json);
    return {
      name: manifest.name,
      description: manifest.description,
      url: manifest.documentationURL,
    };
  })
);

// 5. Map each of those features to an HTML list item.
const items = features.map(
  ({ name, description, url }) =>
    `<li><b><a href="${url}">${name}</a></b>: ${description}</li>`
);

// 6. Join the list items into a single string.
const list = `<ul>\n${items.map((li) => "  " + li).join("\n")}\n</ul>`;

// 7. Read the README.md file.
// 8. Replace the previous HTML list with the new HTML list.
// 9. Write the README.md file.
const readme = await Deno.readTextFile("README.md");
const updated = readme.replace(
  re`/(${preLine})(\r?\n)(.*)(\r?\n)/`,
  // We need to escape the $ character in the replacement string. Otherwise, a
  // random "$" in the list will be interpreted as a backreference. We don't
  // want that. We want to escape the $ character so that it is treated as a
  // literal character.
  "$1$2" + list.replaceAll("$", "$$") + "$4"
);
await Deno.writeTextFile("README.md", updated);

// 10. Print a report card of the changes and the number of features.
console.log(`README.md
${features.length} features
${readme.length} bytes before
${updated.length} bytes after`);
