@echo off
cd /d "%~dp0"
call tdump "..\bin\LMEngine.dll" > LMEngine.dll.txt
call LMEngine.dll.txt
