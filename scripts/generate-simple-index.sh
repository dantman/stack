#!/bin/bash

# Simple index generator - creates both local paths and GitHub raw URLs
# Usage: ./generate-simple-index.sh > INDEX.md

REPO_BASE="https://raw.githubusercontent.com/dantman/stack/main"

echo "# Stack Repository Index"
echo ""
echo "*Auto-generated list of all configuration files*"
echo ""
echo "## Available Configurations"
echo ""

# Find all .md files except README.md and INDEX.md, format as list
find . -name "*.md" -not -name "README.md" -not -name "INDEX.md" -not -path "./.git/*" | \
  sort | \
  sed 's|^\./||' | \
  while read file; do
    # Get just the filename without extension for display
    filename=$(basename "$file" .md)
    echo "- **$filename**: [\`$file\`]($REPO_BASE/$file)"
  done

echo ""
echo "## For AI Context Loading"
echo ""
echo "Use these patterns in your shared prompts:"
echo "\`\`\`"
echo "# Load the index first to discover available configurations"
echo "@github $REPO_BASE/INDEX.md"
echo ""
echo "# Then load specific configurations as needed, e.g.:"
echo "@github $REPO_BASE/tooling/prettier/setup.md"
echo "@github $REPO_BASE/tooling/vscode/settings.md"
echo "\`\`\`"
echo ""
echo "*Generated: $(date)*"
