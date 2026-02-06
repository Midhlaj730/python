@echo off
echo Setting remote URL...
git remote set-url origin https://github.com/Midhlaj730/python.git

echo Adding files...
git add .

echo Committing changes...
git commit -m "Add DevOps configuration: Docker, Nginx, Jenkins"

echo Pushing to GitHub...
git push -u origin main

echo Done!
pause
