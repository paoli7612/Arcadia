@echo off
set /p dl=Enter a drive:
echo %dl%
start python main.py %dl%
