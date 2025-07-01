# 自动上传博客到 GitHub（PowerShell 版本）

# 设置你的博客目录
Set-Location -LiteralPath "F:\工作资料\工作笔记\学习\我的博客\markdown_blog_final"

# 将当前目录设为安全目录（防止权限问题）
git config --global --add safe.directory "F:/工作资料/工作笔记/学习/我的博客/markdown_blog_final"

# 生成博客页面
python generate_blog.py
Write-Host "`n✅ 博客页面已生成：posts/ + index.html" -ForegroundColor Cyan

# 初始化 Git（如果没初始化过）
if (!(Test-Path ".git")) {
    git init
    git remote add origin "git@github.com:Neo-12138/my-blog.git"  # ⚠️ 建议用 SSH
    git branch -M main
}

# 添加并提交所有更改
git add .
git commit -m "自动更新博客 $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# 推送到远程仓库（可选加上错误处理）
git push origin main

# 提示完成
Write-Host "`n✅ 博客上传完成！你现在可以访问: https://neo-12138.github.io/my-blog/" -ForegroundColor Green
pause
