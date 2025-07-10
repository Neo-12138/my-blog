@echo off
:: 推送到 GitHub 的批处理脚本（适用于 Windows）

setlocal enabledelayedexpansion

:: === 1. 可选配置 ===
set GIT_USER=Neo-12138
set GIT_REPO=my-blog
set BRANCH=master
set MSG=%1

if "%MSG%"=="" (
    set MSG=更新博客内容
)

:: === 2. 执行推送操作 ===
echo 👉 正在进入仓库目录...
cd /d %~dp0

echo 🔄 添加更改...
git add .

echo 📝 提交更改: "%MSG%"
git commit -m "%MSG%"

echo 🚀 推送到 GitHub 仓库: %GIT_USER%/%GIT_REPO% [%BRANCH%]
git push origin %BRANCH%

echo ✅ 推送完成！
pause
