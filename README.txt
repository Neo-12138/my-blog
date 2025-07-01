
📦 使用说明（双击 .bat 文件自动上传博客）：

1. 解压本压缩包，将所有文件放到任意位置。
2. 双击 upload_blog.bat 即可自动上传博客。
3. 它会调用 PowerShell 脚本 upload_blog.ps1 来执行博客生成与上传，并防止窗口闪退。

⚠️ 如果提示“脚本被禁止运行”，请在 PowerShell 中手动运行一次以下命令以解除限制：
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
