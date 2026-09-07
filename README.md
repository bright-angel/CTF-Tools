# CTF Tool Wiki

CTF工具百科 - 收集整理CTF比赛中的在线工具和离线工具。

[![Deploy](https://github.com/bright-angel/CTF-Tools/actions/workflows/deploy.yml/badge.svg)](https://github.com/bright-angel/CTF-Tools/actions/workflows/deploy.yml)

## 🚀 在线访问

**网站**: [https://bright-angel.github.io/CTF-Tools/](https://bright-angel.github.io/CTF-Tools/)

## 📚 内容特色

### 在线工具
无需安装，打开即用的在线工具：
- **编码解码**: Base系列、URL、摩尔斯电码等
- **加密解密**: 对称/非对称加密、哈希、古典密码
- **Web安全**: SQL注入、XSS测试、浏览器插件
- **在线反编译**: Java/Python在线反编译

### 离线工具
功能强大的专业工具，包含下载、安装、使用说明：
- **逆向分析**: IDA插件、反编译器、调试器
- **文件分析**: 十六进制编辑器、固件分析、数据恢复
- **密码破解**: ZIP/RAR破解、哈希破解工具
- **隐写分析**: 图片/音频/文件隐写工具

### 展示格式
- ✅ **在线工具**: 同功能工具以表格形式展示
- ✅ **离线工具**: 包含下载链接（代码块）、安装步骤、基础用法
- ✅ **分类清晰**: 在线工具在前，离线工具在后
- ✅ **便于查找**: 200+工具，强大搜索功能

## 🛠️ 本地开发

### 环境要求
- Python 3.8+
- pip

### 快速启动
```bash
# Windows
start.bat

# Linux/Mac
./start.sh
```

### 手动启动
```bash
# 安装依赖
pip install -r requirements.txt

# 启动服务
mkdocs serve

# 访问
http://127.0.0.1:8000
```

### 构建静态文件
```bash
mkdocs build
```

## 📖 项目结构

```
CTF-Tools/
├── docs/                 # 文档目录
│   ├── index.md         # 首页
│   ├── encode/          # 编码解码
│   ├── crypto/          # 加密解密
│   ├── web/             # Web工具
│   ├── reverse/         # 逆向工具
│   └── misc/            # 杂项工具
├── .github/workflows/   # GitHub Actions
├── mkdocs.yml          # MkDocs配置
├── requirements.txt    # Python依赖
└── README.md          # 本文件
```

## 🎯 使用指南

### 搜索工具
- 按 `/` 或 `S` 键打开搜索
- 输入关键词快速定位
- 支持中英文搜索

### 添加工具

#### 在线工具（表格格式）
```markdown
| 工具名称 | 链接 | 特点 |
|---------|------|------|
| 工具A | [链接](url) | 特点描述 |
| 工具B | [链接](url) | 特点描述 |
```

#### 离线工具（完整格式）
```markdown
### 工具名称

**下载**:
` ``
https://github.com/xxx/releases
` ``

**安装**:
` ``bash
apt install tool-name
` ``

**基础用法**:
` ``bash
tool-name [options]
` ``
```

## 🚀 部署

项目使用 GitHub Actions 自动部署到 GitHub Pages。

### 部署步骤
1. Fork 本仓库
2. 在 Settings → Pages 中选择 "GitHub Actions"
3. 推送代码到 main 分支即可自动部署

## 📊 项目统计

- **27个文档页面**
- **200+工具收录**
- **在线工具**: 表格展示，便于对比
- **离线工具**: 详细安装使用说明
- **搜索索引**: 202KB
- **格式统一**: ✅ 完成

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

### 贡献内容
- 推荐新工具
- 更新失效链接
- 改进文档
- 修复错误

### 提交规范
```bash
git add .
git commit -m "feat: 添加xxx工具"
git push
```

## 📄 许可证

MIT License

## ⚠️ 免责声明

本项目收录的工具仅供学习研究和授权测试使用。使用者需遵守当地法律法规，对使用本项目工具产生的任何后果自行承担责任。

---

**Star ⭐ 本项目支持我们！**
