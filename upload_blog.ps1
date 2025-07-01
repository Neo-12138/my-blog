# 自动上传博客到 GitHub（PowerShell 版）

# 解决 Git "dubious ownership" 报错
git config --global --add safe.directory "F:/工作资料/工作笔记/学习/我的博客/markdown_blog_final"

# 切换到博客目录
Set-Location -LiteralPath "F:\\工作资料\\工作笔记\\学习\\我的博客\\markdown_blog_final"

# 生成博客页面
python generate_blog.py

# 初始化 Git（如果还未初始化）
if (!(Test-Path ".git")) {
    git init
    git remote add origin "https://github.com/Neo-12138/my-blog.git"
    git branch -M main
}

# 添加提交并推送
git add .
git commit -m "自动更新博客 $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git push origin main

Write-Host "`n✅ 博客上传完成！你现在可以访问: https://neo-12138.github.io/my-blog/" -ForegroundColor Green
Pause
