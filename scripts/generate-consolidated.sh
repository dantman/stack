#!/bin/bash

# Consolidation script - merges related configurations into consumption-ready files
# Usage: ./generate-consolidated.sh

REPO_BASE="https://raw.githubusercontent.com/dantman/stack/refs/heads/main"

# Always run from the repository root
cd "$(dirname "$0")/.."

echo "🔄 Generating consolidated configuration files..."

# Create consolidated directory
mkdir -p consolidated

# Clean up any existing files
rm -f consolidated/*.md

# Function to create consolidated file
create_consolidated() {
    local group="$1"
    local title="$2"
    local description="$3"
    shift 3
    local files=("$@")
    
    echo "📦 Creating consolidated/$group.md..."
    
    # Start the consolidated file
    cat > "consolidated/$group.md" << EOF
# $title

*Auto-generated consolidated configuration: $description*

EOF
    
    # Process each file in the group
    for file in "${files[@]}"; do
        if [[ -f "$file" ]]; then
            echo "  ➕ Adding $file"
            
            # Add section header
            filename=$(basename "$file" .md)
            dir=$(dirname "$file")
            if [[ "$dir" != "." && "$dir" != "tooling" ]]; then
                section_name="$(basename "$dir") - $filename"
            else
                section_name="$filename"
            fi
            
            echo "## $section_name" >> "consolidated/$group.md"
            echo "" >> "consolidated/$group.md"
            echo "*Source: \`$file\`*" >> "consolidated/$group.md"
            echo "" >> "consolidated/$group.md"
            
            # Add file content
            cat "$file" >> "consolidated/$group.md"
            echo "" >> "consolidated/$group.md"
            echo "---" >> "consolidated/$group.md"
            echo "" >> "consolidated/$group.md"
        else
            echo "  ⚠️  Warning: $file not found"
        fi
    done
    
    # Add footer
    cat >> "consolidated/$group.md" << EOF
*Consolidated from multiple source files on $(date)*
*Source files: ${files[*]}*
EOF
}

# Create consolidated files
create_consolidated "tooling" "Development Tooling Configuration" "Prettier, Dependabot, Package Scripts" \
    "tooling/prettier/setup.md" "tooling/dependabot.md" "tooling/package-scripts.md"

create_consolidated "vscode" "VS Code Configuration" "Settings, Tasks, MCP Servers, Extensions" \
    "tooling/vscode/settings.md" "tooling/vscode/tasks.md" "tooling/vscode/mcp-servers.md" "tooling/vscode/extensions.md"

create_consolidated "workspace" "Workspace Setup" "Project initialization and setup prompts" \
    "tooling/WorkspaceSetup.prompt.md"

# Generate new index with consolidated files
echo "📋 Updating INDEX.md with consolidated files..."

cat > INDEX.md << EOF
# Stack Repository Index

*Auto-generated index with consolidated configurations for efficient AI consumption*

## 🚀 Consolidated Configurations (Recommended)

These consolidated files group related configurations for single-fetch efficiency:

- **tooling**: [\`consolidated/tooling.md\`]($REPO_BASE/consolidated/tooling.md) - Prettier, Dependabot, Package Scripts
- **vscode**: [\`consolidated/vscode.md\`]($REPO_BASE/consolidated/vscode.md) - Settings, Tasks, MCP Servers
- **workspace**: [\`consolidated/workspace.md\`]($REPO_BASE/consolidated/workspace.md) - Workspace Setup Prompts

## 📁 Individual Files (For Reference)

EOF

# Add individual files
find . -name "*.md" -not -name "README.md" -not -name "INDEX.md" -not -path "./consolidated/*" -not -path "./.git/*" | \
  sort | \
  sed 's|^\./||' | \
  while read file; do
    filename=$(basename "$file" .md)
    dir_path=$(dirname "$file")
    if [[ "$dir_path" != "." ]]; then
        display_name="$dir_path/$filename"
    else
        display_name="$filename"
    fi
    echo "- **$display_name**: [\`$file\`]($REPO_BASE/$file)" >> INDEX.md
  done

cat >> INDEX.md << EOF

## 🤖 For AI Context Loading

**Use consolidated files for efficiency (recommended):**
\`\`\`
# Load all configurations in 3 requests
@github $REPO_BASE/consolidated/tooling.md
@github $REPO_BASE/consolidated/vscode.md  
@github $REPO_BASE/consolidated/workspace.md
\`\`\`

**Or load the index to choose specific files:**
\`\`\`
@github $REPO_BASE/INDEX.md
\`\`\`

*Generated: $(date)*
*Repository: https://github.com/dantman/stack*
EOF

echo "✅ Consolidation complete!"
echo "📊 Created $(ls consolidated/*.md 2>/dev/null | wc -l) consolidated files"
echo "🔗 Use consolidated files for single-fetch AI context loading"
