# scripts/ Directory

## Purpose
This directory contains all automation, setup, and integration scripts for the stack repository. It is not intended for direct execution by AI agents unless specifically instructed.

## AI Agent Instructions: Handling Index Updates

When an AI agent receives a request to update the repository index (e.g., "update the index", "trigger index update", or similar):

- **Do NOT run scripts directly.**
- Instead, trigger the GitHub Actions workflow named `update-index.yml` using the GitHub API or CLI.
- The workflow will handle running `generate-consolidated.sh` and committing any changes to `INDEX.md` and the `consolidated/` directory.
- If you need to check the workflow status, use the GitHub Actions API or CLI to monitor the run.
- If authentication is required, prompt the user for a fine-grained GitHub Personal Access Token with the documented permissions.

### Example (AI Agent Pseudocode)

1. **Trigger the workflow:**
   - Use the GitHub API endpoint for `workflow_dispatch` or the CLI:
     ```bash
     gh workflow run update-index.yml --repo dantman/stack
     ```
2. **Monitor the workflow:**
   - Check status:
     ```bash
     gh run list --workflow=update-index.yml --repo dantman/stack
     ```
3. **Report results to the user.**

---

**Note:**
- Scripts in this directory are for human-initiated automation and reference only.
- AI agents should always prefer workflow-based automation for index updates.
- See `github-token-required.md` and `github-token-setup.md` for authentication details.
