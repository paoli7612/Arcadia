@echo off
set /p dl=Enter a name of map:
echo %dl%
start python main.py %dl%
