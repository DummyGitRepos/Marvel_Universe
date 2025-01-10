#!/bin/bash

# Create branch
git branch shield_initiative
git checkout shield_initiative

# Create files and folders
mkdir -p Heroes
echo "Nick Fury leads the S.H.I.E.L.D initiative to protect the Earth." > Heroes/NickFury.txt

# Commit and push changes
git add .
git commit -m "Added Heroes folder and Nick Fury file for the shield_initiative branch."
git push origin shield_initiative

