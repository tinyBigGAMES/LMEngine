@echo off
cd /d "%~dp0"
call upx --best --ultra-brute "..\bin\LMEngine.dll"