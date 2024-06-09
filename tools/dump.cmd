@echo off
cd /d "%~dp0"
call tdump "..\bin\lme.dll" > lme.dll.txt
call lme.dll.txt
