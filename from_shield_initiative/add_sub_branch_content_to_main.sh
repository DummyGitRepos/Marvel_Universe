#!/bin/bash

# Repository details
REPO_NAME="Marvel_Universe"

# Branch names
BRANCHES=("shield_initiative")

# Ensure we're in the correct directory
echo "Ensuring we are in the correct repository: $REPO_NAME"
if [[ "$(basename "$PWD")" != "$REPO_NAME" ]]; then
  echo "Error: Please run this script from the $REPO_NAME repository directory."
  exit 1
fi

# Pull the latest changes from the remote main branch
echo "Switching to the main branch..."
git checkout main
git pull origin main || { echo "Failed to pull the latest changes from the main branch. Exiting."; exit 1; }

# Loop through branches and merge their content into the main branch
for BRANCH in "${BRANCHES[@]}"; do
  echo "Processing branch: $BRANCH"

  # Create a temporary directory to hold the branch's content
  TEMP_DIR="from_${BRANCH}"
  mkdir -p "../${TEMP_DIR}"

  # Check out the branch and copy its content
  git checkout $BRANCH || { echo "Failed to switch to branch $BRANCH. Skipping..."; continue; }
  cp -r ./* "../${TEMP_DIR}" || { echo "Failed to copy files from branch $BRANCH. Skipping..."; continue; }

  # Switch back to main and add the copied content
  git checkout main
  mv "../${TEMP_DIR}" .
  git add "${TEMP_DIR}/"
  git commit -m "Added content from branch $BRANCH to main branch" || echo "No changes to commit for branch $BRANCH."
done

# Push the updated main branch to GitHub
echo "Pushing updates to the main branch..."
git push origin main || { echo "Failed to push changes to the main branch. Exiting."; exit 1; }

echo "Script execution completed."

