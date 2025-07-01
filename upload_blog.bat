@echo off
REM 启动 PowerShell 脚本（防止直接闪退）

powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0upload_blog.ps1"
