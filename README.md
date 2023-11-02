# github-depbot-autoreviewer
Tired of manually reviewing automated vulnerability fixes? Here's a script which uses the GitHub CLI to approve and auto-merge all dependency upgrade pull requests (eg submitted by Snyk, Dependabot, Renovate etc) assigned to the current user. 

### Usage
1. Download the script
2. Make the script executable with `chmod +x ./github_depbot_autoreviewer.sh`
3. Run the script with `./github_depbot_autoreviewer.sh YOUR_DEPENDENCY_BOT_GITHUB_USERNAME`
