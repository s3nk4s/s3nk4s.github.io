@echo off 
rem set /p msg="Commit message: "
git add .
git commit -a -m %1
git push