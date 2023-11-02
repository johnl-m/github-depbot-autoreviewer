#!/bin/bash
if ! command -v gh &> /dev/null
then
    echo "gh command not found. Make sure you've installed the GitHub CLI!"
    exit 1
fi
GH_USER=$(gh api user | jq -r '.login')
PRS=$(gh search prs --assignee $GH_USER --author snyk-vestwell --state open --json repository,number)
jq -c '.[]' <<< "$PRS" | while read i; do
REPO_NAME=$(jq -r <<< $i '.repository.nameWithOwner')
PR_NUMBER=$(jq -r <<< $i '.number')
echo "Processing repository $REPO_NAME and pull request number $PR_NUMBER"
gh pr review $PR_NUMBER --repo $REPO_NAME --approve 
gh pr merge $PR_NUMBER --repo $REPO_NAME --auto --squash
done
