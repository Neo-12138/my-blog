# 自动上传博客到 GitHub（PowerShell 版本）

# 步骤 1：进入博客项目目录
Set-Location -LiteralPath "F:\工作资料\工作笔记\学习\我的博客\markdown_blog_final"

# 步骤 2：标记当前目录为 Git 安全目录（解决权限警告）
git config --global --add safe.directory "F:/工作资料/工作笔记/学习/我的博客/markdown_blog_final"

# 步骤 3：运行 Python 脚本生成 HTML 博客页面
python generate_blog.py
Write-Host "`n✅ 博客页面已生成：posts/ + index.html" -ForegroundColor Cyan

# 步骤 4：如果本地没有初始化 Git 仓库，则进行初始化
if (!(Test-Path ".git")) {
    git init                                       # 初始化 Git 仓库
    git remote add origin "git@github.com:Neo-12138/my-blog.git"  # 添加远程仓库地址（建议使用 SSH）
    git branch -M main                             # 设置分支为 main
}

# 步骤 5：拉取远程仓库内容，防止因版本不同步而推送失败
git pull --rebase origin main

# 步骤 6：添加全部文件
git add .

# 步骤 7：提交修改，附带时间戳
git commit -m "自动更新博客 $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# 步骤 8：推送提交到 GitHub 仓库
git push origin main

# 步骤 9：输出提示信息
Write-Host "`n✅ 博客上传完成！你现在可以访问: https://neo-12138.github.io/my-blog/" -ForegroundColor Green

# 暂停等待用户按回车
Pause
