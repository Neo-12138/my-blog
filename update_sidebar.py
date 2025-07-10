import os
from collections import defaultdict

DOCS_DIR = "docs"
SIDEBAR_FILE = os.path.join(DOCS_DIR, "_sidebar.md")

# 固定导航项
fixed_links = [
    "* [首页](README.md)",
    "* [关于我](about.md)"
]

# 分组前缀映射：前缀 => 中文分组名称
CATEGORY_MAP = {
    "embed": "嵌入式",
    "tool": "工具教程",
    "proj": "项目展示",
    "note": "学习笔记",
    "ai": "人工智能",         # ← 新增前缀分类
    "blog": "博客"    
}

def generate_sidebar():
    grouped = defaultdict(list)

    for fname in os.listdir(DOCS_DIR):
        if not fname.endswith(".md"):
            continue
        if fname in ("README.md", "about.md", "_sidebar.md"):
            continue

        parts = fname.split("_", 1)
        if len(parts) == 2 and parts[0] in CATEGORY_MAP:
            group = CATEGORY_MAP[parts[0]]
            title = os.path.splitext(parts[1])[0].replace("_", " ").title()
        else:
            group = "其他"
            title = os.path.splitext(fname)[0].replace("_", " ").title()

        grouped[group].append((title, fname))

    # 写入 sidebar
    lines = fixed_links.copy()
    for group in sorted(grouped):
        lines.append(f"* {group}")
        for title, fname in sorted(grouped[group]):
            lines.append(f"  * [{title}]({fname})")

    with open(SIDEBAR_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"✅ _sidebar.md 已更新，共生成 {len(grouped)} 个分类.")

if __name__ == "__main__":
    generate_sidebar()
