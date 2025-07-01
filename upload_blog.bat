@echo off
REM 自动上传博客到 GitHub（修复乱码和命令错误）

REM 初始化 Git 仓库（如果未初始化）
IF NOT EXIST ".git" (
    git init
    git remote add origin "https://github.com/Neo-12138/my-blog.git"
    git branch -M main
)

REM 拉取远程（如果有）
git pull origin main

REM 添加文件并提交
git add .
git commit -m "更新博客"

REM 推送到 GitHub
git push origin main

pause
