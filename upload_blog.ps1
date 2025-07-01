# 鑷姩涓婁紶鍗氬鍒?GitHub锛圥owerShell 鐗堬級


Set-Location -Path "F:\宸ヤ綔璧勬枡\宸ヤ綔绗旇\瀛︿範\鎴戠殑鍗氬\markdown_blog_final"
python generate_blog.py

if (!(Test-Path ".git")) {
    git init
    git remote add origin "https://github.com/Neo-12138/my-blog.git"
    git branch -M main
}

git add .
git commit -m "鑷姩鏇存柊鍗氬 $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git push origin main

Write-Host "n鉁?鍗氬涓婁紶瀹屾垚锛佷綘鐜板湪鍙互璁块棶: https://neo-12138.github.io/my-blog/" -ForegroundColor Green
Pause