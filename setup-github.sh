#!/bin/bash
# Run this script to push to GitHub Pages
# Prerequisites: git installed, GitHub CLI or SSH key configured

cd "$(dirname "$0")/project-change"

git init -b main
git add -A
git commit -m "feat: Project Change - 60-day transformation tracker"

# Create repo and push (requires GitHub CLI)
gh repo create project-change --public --source=. --push

# Enable GitHub Pages (main branch, root)
gh api repos/hitman567/project-change/pages -X POST -f "build_type=workflow" -f "source[branch]=main" -f "source[path]=/" 2>/dev/null || \
echo "Enable Pages manually: Settings > Pages > Source: main branch, / (root)"

echo ""
echo "Done! Your site will be live at:"
echo "https://hitman567.github.io/project-change/"
