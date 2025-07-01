# 自动上传博客到 GitHub（PowerShell 版本）

# 设置你的博客目录（请根据实际路径修改，如果你的路径没有中文，可以用单斜杠）
Set-Location -LiteralPath "F:\\工作资料\\工作笔记\\学习\\我的博客\\markdown_blog_final"

# 生成 HTML 页面
python generate_blog.py

# 初始化 Git 仓库（如果尚未初始化）
if (!(Test-Path ".git")) {
    git init
    git remote add origin "https://github.com/Neo-12138/my-blog.git"
    git branch -M main
}

# 添加并提交所有更改
git add .
git commit -m "自动更新博客 $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# 推送到远程仓库
git push origin main

# 提示成功信息
Write-Host "`n✅ 博客上传完成！你现在可以访问: https://neo-12138.github.io/my-blog/" -ForegroundColor Green
Pause
