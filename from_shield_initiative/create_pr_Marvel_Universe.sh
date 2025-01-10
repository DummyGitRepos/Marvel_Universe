#!/bin/bash

# Define repository details
REPO="hemanth18245a0459/Marvel_Universe"

# Branches to create pull requests
BRANCHES=("shield_initiative")

# Loop through branches and create PRs
for BRANCH in "${BRANCHES[@]}"; do
  gh pr create \
    --repo $REPO \
    --head $BRANCH \
    --base main \
    --title "Merge $BRANCH into main" \
    --body "This pull request merges the $BRANCH branch into the main branch."
done

