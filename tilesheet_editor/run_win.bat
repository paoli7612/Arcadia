@echo off
set /p dl=Enter a name of json file:
echo %dl%
start python main.py %dl%
