#!/bin/bash

mkdir -p Heroes
mkdir -p Superpowers

echo "Tony Stark becomes Iron Man with an Arc Reactor." > Heroes/IronMan.txt
echo "The Arc Reactor is a powerful energy source." > Superpowers/ArcReactor.txt

git add .
git commit -m "Added Heroes and Superpowers in Marvel Universe."
git push origin main

