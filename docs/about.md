# 关于本站

## 项目简介

**CTF Tool Wiki（CTF工具百科）**是一个收集整理CTF(Capture The Flag)比赛中常用工具的综合性平台，包含**在线工具**和**离线工具**两大类，旨在帮助CTF选手快速找到需要的工具，提高解题效率。

## 工具分类

本站将200+工具分为以下几个大类：

### 📝 编码解码
- Base系列编码（Base16-100）
- URL编码解码
- 十六进制/ASCII转换
- Unicode/HTML实体
- 摩尔斯电码
- 其他特殊编码

### 🔐 加密解密
- **对称加密**: AES、DES、3DES等
- **非对称加密**: RSA、ECC、DH密钥交换
- **哈希函数**: MD5、SHA系列、密码破解
- **古典密码**: 凯撒、维吉尼亚、栅栏等
- **趣味编码**: 与佛论禅、核心价值观、零宽字符等

### 🌐 Web安全
- **SQL注入**: SQLMap、注入技巧
- **XSS测试**: Payload生成、绕过技巧
- **浏览器工具**: Burp Suite、HackBar、Wappalyzer
- **综合工具**: JWT、文件上传/包含、命令注入等

### 🔍 逆向工程
- **反编译器**: Ghidra、IDA Pro、dnSpy、JADX
- **调试器**: GDB、x64dbg、Frida
- **Java工具**: JD-GUI、CFR、Bytecode Viewer
- **Python工具**: uncompyle6、pyinstxtractor
- **辅助工具**: 查壳、脱壳、IDA插件

### 🛠️ 杂项工具
- **文件分析**: binwalk、foremost、ExifTool
- **隐写分析**: StegSolve、zsteg、steghide
- **综合工具**: CyberChef、010 Editor

## 技术栈

本站使用以下技术构建：

- **静态站点生成器**: [MkDocs](https://www.mkdocs.org/)
- **主题**: [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- **部署**: GitHub Actions + GitHub Pages
- **搜索支持**: jieba分词（中文搜索）
- **语言**: Markdown + Python

## 特点

- 📱 **响应式设计**：支持移动设备访问
- 🌓 **主题切换**：支持亮色/暗色主题
- 🔍 **全站搜索**：支持中文搜索，快速定位工具
- 🚀 **快速加载**：静态网页，秒开
- 📊 **分类清晰**：在线/离线工具分别展示
- 📝 **详细说明**：包含下载链接、安装步骤、使用示例
- 💡 **解题技巧**：每个分类都有CTF解题技巧
- 🔄 **持续更新**：定期添加新工具和更新链接

## 贡献指南

欢迎为本项目贡献！你可以通过以下方式参与：

### 提交新工具

如果你发现了有用的工具，欢迎提交Issue或Pull Request，请提供：

- **工具名称**
- **工具链接**（在线工具）或**GitHub地址**（离线工具）
- **工具简介**：功能、特点
- **适用分类**：编码/加密/Web/逆向/杂项
- **使用示例**（可选）

### 更新失效链接

如果发现某个工具链接失效，请：
1. 提交Issue注明失效工具
2. 如有新链接，请一并提供
3. 或提交PR直接修改

### 改进文档

发现文档错误、格式问题或有改进建议，欢迎：
- 提交Issue说明问题
- 提交PR直接修改
- 添加更多使用技巧和示例

### Pull Request流程

1. Fork本仓库
2. 创建你的特性分支
   ```bash
   git checkout -b feature/AddNewTool
   ```
3. 提交你的修改
   ```bash
   git commit -m 'Add: 新增XXX工具'
   ```
4. 推送到分支
   ```bash
   git push origin feature/AddNewTool
   ```
5. 开启Pull Request

### 文档格式规范

为保持文档一致性，请遵循以下格式：

**在线工具**：使用表格展示
```markdown
| 工具名称 | 链接 | 特点 |
|---------|------|------|
| 工具A | [https://...](https://...) | 功能说明 |
```

**离线工具**：详细说明
```markdown
### 工具名称

**下载链接**:
\`\`\`
https://github.com/...
\`\`\`

**安装**:
\`\`\`bash
安装命令
\`\`\`

**使用**:
\`\`\`bash
使用示例
\`\`\`
```

## 免责声明

**请注意**：本站收录的工具和技术仅供学习研究和授权测试使用。

使用这些工具时，请务必遵守：

- ✅ **仅在授权的环境中使用**
- ✅ **遵守当地法律法规**
- ✅ **遵守计算机安全相关法律**
- ✅ **不攻击未经授权的系统**
- ✅ **负责任地披露漏洞**
- ✅ **用于CTF比赛和安全学习**

❌ **禁止用于**：
- 攻击未授权的系统
- 窃取他人数据
- 破坏计算机系统
- 其他违法行为

**本站及工具作者不对使用者的任何违法行为负责。**

## 联系方式

- **GitHub仓库**: [https://github.com/bright-angel/CTF-Tools](https://github.com/bright-angel/CTF-Tools)
- **在线访问**: [https://bright-angel.github.io/CTF-Tools/](https://bright-angel.github.io/CTF-Tools/)
- **Issue反馈**: [提交Issue](https://github.com/bright-angel/CTF-Tools/issues)

## 致谢

感谢以下项目和社区：

- 所有工具开发者和维护者
- CTF社区的贡献者
- MkDocs和Material主题开发团队
- GitHub提供的免费托管服务
- 所有提交Issue和PR的贡献者

特别感谢：
- [BugKu CTF](https://ctf.bugku.com/)
- [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings)
- [CTF Wiki](https://ctf-wiki.org/)
- [Hack Tricks](https://book.hacktricks.xyz/)

## 统计数据

- 📚 **工具总数**: 200+ 个
- 📁 **文档页面**: 24 个
- 🏷️ **分类数量**: 5 大类 20+ 小类
- 🔄 **更新频率**: 持续更新
- 🌍 **支持语言**: 中文

## 许可证

本项目文档内容采用 [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) 许可证。

代码部分（如有）采用 MIT 许可证。

详见 [LICENSE](https://github.com/bright-angel/CTF-Tools/blob/main/LICENSE) 文件。

---

**最后更新**: 2026年9月

**版本**: 2.0.0

**维护者**: bright-angel

---

<center>

**⭐ 如果这个项目对你有帮助，请给个Star支持一下！⭐**

[GitHub仓库](https://github.com/bright-angel/CTF-Tools){ .md-button .md-button--primary }

</center>
