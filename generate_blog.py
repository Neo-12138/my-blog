import sys
import io

# 如果终端不是 UTF-8，才强制使用 UTF-8 输出
if sys.stdout.encoding != 'UTF-8':
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

import os
from pathlib import Path
import markdown
from datetime import datetime

md_dir = Path("md")
out_dir = Path("posts")
out_dir.mkdir(exist_ok=True)

html_template = """<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <title>{title}</title>
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/github.css">
</head>
<body>
  <header>
    <h1>{title}</h1>
    <nav>
      <a href="../index.html">首页</a>
      <a href="../about.html">关于我</a>
    </nav>
  </header>
  <main>
    {content}
  </main>
  <footer>版权所有 © 嵌入式开发笔记</footer>
  <script src="../js/highlight.min.js"></script>
  <script>hljs.highlightAll();</script>
</body>
</html>
"""

article_links = []

for md_file in sorted(md_dir.glob("*.md")):
    title = md_file.stem
    with open(md_file, 'r', encoding='utf-8') as f:
        md_content = f.read()
    html_body = markdown.markdown(md_content, extensions=['fenced_code', 'codehilite'])
    full_html = html_template.format(title=title, content=html_body)
    html_path = out_dir / f"{title}.html"
    with open(html_path, 'w', encoding='utf-8') as f:
        f.write(full_html)
    article_links.append(f'<li><a href="posts/{title}.html">{title}</a></li>')

# 生成首页 index.html
index_html = f"""<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <title>嵌入式开发笔记</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header>
    <h1>嵌入式开发笔记</h1>
    <nav>
      <a href="index.html">首页</a>
      <a href="about.html">关于我</a>
    </nav>
  </header>
  <main>
    <h2>文章列表</h2>
    <ul>
      {"\n      ".join(article_links)}
    </ul>
  </main>
  <footer>最后更新：{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}</footer>
</body>
</html>
"""

with open("index.html", "w", encoding="utf-8") as f:
    f.write(index_html)

print("✅ 博客页面已生成：posts/ + index.html")
