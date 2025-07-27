# VS Code Extension Recommendations

This document lists recommended VS Code extensions for Daniel's TypeScript-based web development stack. Each extension includes a link and a brief explanation of why it is included.

## How to Use

- **For AI assistants:** When setting up a new project, add the listed extensions to the `recommendations` array in `.vscode/extensions.json` (or the devcontainer customizations if using a devcontainer).
- **For developers:** Install these extensions from the VS Code Marketplace for the best experience with this stack.

## Recommended Extensions

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) — Ensures consistent code formatting across the team and integrates with format-on-save.
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) — Integrates ESLint for real-time linting and code quality feedback in JavaScript and TypeScript projects.
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) — Enforces consistent coding styles between different editors and IDEs using .editorconfig files.
- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) — Visualizes your Git repository history as a graph, helping you understand branching and commit history at a glance.
- [Git Stash](https://marketplace.visualstudio.com/items?itemName=arturock.gitstash) — Provides a visual interface for Git stashes, making it easier to manage, review, and apply stashed changes.
- [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss) — Adds Tailwind CSS IntelliSense, including autocomplete, syntax highlighting, and linting for Tailwind classes.
- [npm-import-package-version](https://marketplace.visualstudio.com/items?itemName=axetroy.vscode-npm-import-package-version) — Displays the installed version of npm packages inline in your import statements, reducing context switching.
- [npm Dependency Links](https://marketplace.visualstudio.com/items?itemName=herrmannplatz.npm-dependency-links) — Adds clickable links to npm package pages directly from your package.json dependencies for quick reference.
- [NPM Scripts](https://marketplace.visualstudio.com/items?itemName=fknop.vscode-npm) — Adds NPM scripts explorer and task integration, making it easier to run and manage project scripts directly from VS Code.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) — Provides in-editor spell checking for source code, comments, and documentation, helping catch typos and improve code quality.
- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) — Highlights CSV and TSV files, and allows running SQL-like queries on tabular data, making it easier to inspect and manipulate data files in your projects.
- [Insert Unicode](https://marketplace.visualstudio.com/items?itemName=brunnerh.insert-unicode) — Lets you search for and insert Unicode characters directly into your documents, useful for symbols and special characters.
- [File Nesting Updater](https://marketplace.visualstudio.com/items?itemName=antfu.file-nesting) — Automatically updates Anthony Fu's file nesting config for improved file organization in the VS Code explorer.
- [Package Json Upgrade](https://marketplace.visualstudio.com/items?itemName=codeandstuff.package-json-upgrade) — Shows available updates in package.json files, offers quick fixes to update dependencies, and displays changelogs for easy package maintenance.
- [Copy Relative Path](https://marketplace.visualstudio.com/items?itemName=alexdima.copy-relative-path) — Adds a "Copy Relative Path" that should've been included in VSCode by default.

---

## Optional Extensions

These extensions are recommended for specific workflows or environments:

- [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=github.vscode-pull-request-github) — Recommended if your repository is hosted on GitHub. Enables pull request management, code reviews, and issue tracking directly within VS Code.
- [Atlassian: Jira & Bitbucket](https://marketplace.visualstudio.com/items?itemName=atlassian.atlascode) — Recommended if your project uses Jira for issue tracking or Bitbucket for source control. Integrates Jira issues and Bitbucket pull requests into your workflow.
- [Astro](https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode) — Recommended for Astro projects. Provides language support, syntax highlighting, and tooling for Astro static site development.

*Only add these to your recommended extensions if your project uses the corresponding services or frameworks.*

---

*To update the recommended extensions, edit this file and update `.vscode/extensions.json` accordingly.*
