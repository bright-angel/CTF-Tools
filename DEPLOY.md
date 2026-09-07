# 部署指南

本文档说明如何将CTF在线工具导航部署到GitHub Pages。

## 前置要求

- GitHub账号
- Git基础知识

## 快速开始

### 1. 准备仓库

#### 方式一：Fork本仓库（推荐）

1. 访问本项目的GitHub仓库
2. 点击右上角的 `Fork` 按钮
3. Fork到你的GitHub账号下

#### 方式二：创建新仓库

1. 在GitHub创建新仓库，命名如：`ctf-online-tools`
2. 将本地代码推送到新仓库：

```bash
cd "CTF Online Tools"
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/你的用户名/ctf-online-tools.git
git push -u origin main
```

### 2. 配置GitHub Pages

1. 进入仓库的 `Settings` (设置)
2. 在左侧菜单找到 `Pages`
3. 在 `Build and deployment` 部分：
   - **Source**: 选择 `GitHub Actions`
4. 保存设置

### 3. 触发部署

推送代码到 `main` 分支会自动触发部署：

```bash
git push origin main
```

### 4. 查看部署状态

1. 进入仓库的 `Actions` 标签页
2. 查看 `Deploy MkDocs to GitHub Pages` 工作流
3. 等待绿色✓表示部署成功

### 5. 访问网站

部署成功后，访问：
```
https://你的用户名.github.io/ctf-online-tools/
```

## 自定义配置

### 修改网站信息

编辑 `mkdocs.yml` 文件：

```yaml
site_name: 你的网站名称
site_description: 你的网站描述
site_author: 你的名字
site_url: https://你的用户名.github.io/仓库名/
```

### 修改主题颜色

在 `mkdocs.yml` 中修改：

```yaml
theme:
  palette:
    - scheme: default
      primary: indigo  # 改成你喜欢的颜色
      accent: indigo   # 改成你喜欢的颜色
```

可用颜色：red, pink, purple, deep purple, indigo, blue, light blue, cyan, teal, green, light green, lime, yellow, amber, orange, deep orange

### 添加社交链接

在 `mkdocs.yml` 的 `extra` 部分修改：

```yaml
extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/你的用户名
    - icon: fontawesome/brands/twitter
      link: https://twitter.com/你的用户名
```

## 本地开发

### 安装依赖

```bash
pip install -r requirements.txt
```

### 启动开发服务器

```bash
mkdocs serve
```

访问 http://127.0.0.1:8000 预览网站。

### 构建静态文件

```bash
mkdocs build
```

生成的文件在 `site/` 目录。

## 添加内容

### 添加新页面

1. 在 `docs/` 目录下创建 Markdown 文件
2. 在 `mkdocs.yml` 的 `nav` 部分添加导航项：

```yaml
nav:
  - 首页: index.md
  - 你的新分类:
      - 新页面: your-category/new-page.md
```

### 添加新工具

在对应分类的文件中添加：

```markdown
### 工具名称
**链接**: [https://example.com](https://example.com)

**功能**: 工具功能描述

**特点**:
- 特点1
- 特点2
- 特点3
```

## 故障排除

### 部署失败

1. 检查 Actions 标签页的错误日志
2. 确认 `requirements.txt` 中的依赖版本正确
3. 确认所有 Markdown 文件语法正确

### 页面404

1. 确认 GitHub Pages 设置为 GitHub Actions
2. 检查 `site_url` 配置是否正确
3. 等待几分钟让DNS生效

### 样式异常

1. 清除浏览器缓存
2. 检查主题配置是否正确
3. 确认 Material for MkDocs 版本

## 更新网站

只需修改文件并推送到GitHub：

```bash
git add .
git commit -m "更新内容"
git push origin main
```

GitHub Actions会自动重新部署。

## 自定义域名（可选）

### 1. 添加CNAME文件

在 `docs/` 目录创建 `CNAME` 文件：

```
your-domain.com
```

### 2. 配置DNS

在你的域名提供商处添加DNS记录：

```
类型: CNAME
名称: @（或www）
值: 你的用户名.github.io
```

### 3. 更新mkdocs.yml

```yaml
site_url: https://your-domain.com/
```

## 高级配置

### 启用Google Analytics

在 `mkdocs.yml` 添加：

```yaml
extra:
  analytics:
    provider: google
    property: G-XXXXXXXXXX
```

### 添加评论系统

使用 Giscus（基于GitHub Discussions）：

在 `mkdocs.yml` 添加：

```yaml
extra:
  comments:
    enabled: true
    provider: giscus
```

## 性能优化

### 压缩图片

使用工具压缩 `docs/` 中的图片文件。

### 启用缓存

GitHub Pages 自动启用CDN缓存。

### 使用自定义插件

在 `requirements.txt` 添加插件，在 `mkdocs.yml` 配置。

## 安全建议

1. 不要在仓库中提交敏感信息
2. 定期更新依赖包
3. 使用 Dependabot 自动更新依赖

## 获取帮助

- [MkDocs文档](https://www.mkdocs.org/)
- [Material for MkDocs文档](https://squidfunk.github.io/mkdocs-material/)
- [GitHub Pages文档](https://docs.github.com/en/pages)
- [提交Issue](https://github.com/yourusername/ctf-online-tools/issues)

## 常见问题

**Q: 可以使用其他主题吗？**

A: 可以，在 `mkdocs.yml` 中修改 `theme.name`，并安装对应主题。

**Q: 如何备份网站？**

A: GitHub仓库本身就是备份，也可以克隆到本地。

**Q: 可以添加搜索功能吗？**

A: Material主题已内置搜索功能，自动启用。

**Q: 部署需要多长时间？**

A: 通常1-3分钟，首次可能需要5分钟。

---

祝你部署顺利！🚀
