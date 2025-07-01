@echo off
REM 启动 PowerShell 脚本（防止闪退关闭窗口）

powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0upload_blog.ps1"
