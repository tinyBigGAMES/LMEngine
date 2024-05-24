@echo off
cd /d "%~dp0"
call polib /machine:x64 /out:"..\lib\LMEngine.lib" "..\bin\LMEngine.dll"