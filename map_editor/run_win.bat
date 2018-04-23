@echo off
set /p dl=Enter a name of the map:
echo %dl%
start python main.py %dl%
