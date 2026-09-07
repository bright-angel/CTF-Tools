# CTF Tool Wiki

CTF工具百科 - 收集整理CTF比赛中的在线工具和离线工具。

[![Deploy](https://github.com/bright-angel/CTF-Tools/actions/workflows/deploy.yml/badge.svg)](https://github.com/bright-angel/CTF-Tools/actions/workflows/deploy.yml)

## 🚀 在线访问

访问地址: [https://bright-angel.github.io/CTF-Tools/](https://bright-angel.github.io/CTF-Tools/)

## 📚 内容分类

### 在线工具
- **编码解码**: Base系列、URL编码、摩尔斯电码等
- **加密解密**: 对称/非对称加密、哈希、古典密码
- **Web工具**: SQL注入、XSS测试、浏览器插件
- **在线反编译**: Java/Python在线反编译

[![Deploy](https://github.com/bright-angel/ctf-online-tools/actions/workflows/deploy.yml/badge.svg)](https://github.com/bright-angel/ctf-online-tools/actions/workflows/deploy.yml)

## 🚀 在线访问

访问地址: [https://bright-angel.github.io/ctf-online-tools/](https://bright-angel.github.io/ctf-online-tools/)

## 📚 内容分类

- **编码解码**: Base系列、URL编码、其他编码
- **加密解密**: 对称加密、非对称加密、哈希函数
- **Web工具**: SQL注入、XSS测试、其他Web安全工具
- **逆向工具**: 反编译器、在线调试器
- **杂项工具**: 隐写分析、文件分析、其他实用工具

## 🛠️ 本地开发

### 环境要求

- Python 3.8+
- pip

### 安装依赖

```bash
pip install -r requirements.txt
```

### 本地预览

```bash
mkdocs serve
```

访问 http://127.0.0.1:8000 查看效果。

### 构建静态文件

```bash
mkdocs build
```

生成的静态文件位于 `site/` 目录。

## 📦 部署

本项目使用 GitHub Actions 自动部署到 GitHub Pages。

### 部署步骤

1. Fork本仓库
2. 在仓库设置中启用 GitHub Pages
3. 设置 Pages 的 Source 为 "GitHub Actions"
4. 推送到 `main` 分支即可自动部署

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

### 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📝 添加新工具

在对应分类的 Markdown 文件中添加工具信息，格式如下：

```markdown
### 工具名称
**链接**: [https://example.com](https://example.com)

**功能**: 简短描述

**特点**:
- 特点1
- 特点2
```

## 📄 许可证

本项目采用 [MIT License](LICENSE)。

## ⚠️ 免责声明

本站收录的工具仅供学习研究和授权测试使用，请勿用于非法用途。使用者需遵守当地法律法规，对使用本站工具产生的任何后果自行承担责任。

## 📮 联系方式

- GitHub Issues: [提交问题](https://github.com/bright-angel/ctf-online-tools/issues)

## 🙏 致谢

感谢所有工具开发者和CTF社区的贡献！

---

**Star ⭐ 本项目来支持我们！**
