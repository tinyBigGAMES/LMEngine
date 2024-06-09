@echo off
cd /d "%~dp0"
call polib /machine:x64 /out:"..\lib\lme.lib" "..\bin\lme.dll"