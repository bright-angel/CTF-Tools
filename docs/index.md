# CTF Tool Wiki

<div style="text-align: center; margin: 2em 0;">
  <h2>🎯 CTF工具百科</h2>
  <p style="font-size: 1.2em;">收集整理 <strong>200+</strong> 个CTF比赛常用工具</p>
  <p>包含在线工具和离线工具，覆盖编码/加密/Web/逆向/杂项等分类</p>
</div>

---

## 🚀 快速导航

<div class="grid cards" markdown>

-   :material-code-tags:{ .lg .middle } __编码解码__

    ---

    Base系列、URL编码、十六进制、摩尔斯电码等常见编码工具

    [:octicons-arrow-right-24: 查看工具](encode/base.md)

-   :material-lock:{ .lg .middle } __加密解密__

    ---

    对称/非对称加密、哈希函数、古典密码、趣味编码等

    [:octicons-arrow-right-24: 查看工具](crypto/hash.md)

-   :material-web:{ .lg .middle } __Web安全__

    ---

    SQL注入、XSS、Burp Suite、HackBar等Web安全测试工具

    [:octicons-arrow-right-24: 查看工具](web/sqli.md)

-   :material-code-braces:{ .lg .middle } __逆向工程__

    ---

    反编译器、调试器、Ghidra、IDA、dnSpy等逆向分析工具

    [:octicons-arrow-right-24: 查看工具](reverse/decompiler.md)

-   :material-folder-search:{ .lg .middle } __杂项工具__

    ---

    文件分析、隐写术、CyberChef等综合性工具

    [:octicons-arrow-right-24: 查看工具](misc/file.md)

</div>

---

## 📚 工具分类

### 编码解码 (Encoding/Decoding)

| 子分类 | 包含工具 | 页面 |
|--------|---------|------|
| Base编码 | Base16-100、Base64等 | [查看](encode/base.md) |
| URL编码 | URL编码解码、JavaScript编码 | [查看](encode/url.md) |
| 其他编码 | 摩尔斯、ASCII、十六进制、Unicode | [查看](encode/others.md) |

### 加密解密 (Cryptography)

| 子分类 | 包含工具 | 页面 |
|--------|---------|------|
| 哈希函数 | MD5、SHA系列、Hashcat、John | [查看](crypto/hash.md) |
| 对称加密 | AES、DES、3DES、OpenSSL | [查看](crypto/symmetric.md) |
| 非对称加密 | RSA、ECC、DH、RsaCtfTool | [查看](crypto/asymmetric.md) |
| 古典密码 | 凯撒、维吉尼亚、栅栏等50+种 | [查看](crypto/classical.md) |
| 趣味编码 | 与佛论禅、核心价值观、零宽字符 | [查看](crypto/special.md) |

### Web安全 (Web Security)

| 子分类 | 包含工具 | 页面 |
|--------|---------|------|
| SQL注入 | SQLMap、注入速查表、绕过技巧 | [查看](web/sqli.md) |
| XSS测试 | XSStrike、BeEF、Payload大全 | [查看](web/xss.md) |
| 浏览器工具 | Burp Suite、HackBar、Wappalyzer | [查看](web/browser-tools.md) |
| 综合工具 | JWT、文件上传、XXE、SSRF等 | [查看](web/comprehensive.md) |
| 其他工具 | 反序列化、CORS、WebSocket等 | [查看](web/others.md) |

### 逆向工程 (Reverse Engineering)

| 子分类 | 包含工具 | 页面 |
|--------|---------|------|
| 反编译器 | Ghidra、IDA、dnSpy、JADX | [查看](reverse/decompiler.md) |
| 调试器 | GDB、x64dbg、Frida、ltrace | [查看](reverse/debugger.md) |
| Java工具 | JD-GUI、CFR、Bytecode Viewer | [查看](reverse/java.md) |
| Python工具 | uncompyle6、pyinstxtractor | [查看](reverse/python.md) |
| 辅助工具 | 查壳、脱壳、IDA插件 | [查看](reverse/tools.md) |

### 杂项工具 (Miscellaneous)

| 子分类 | 包含工具 | 页面 |
|--------|---------|------|
| 文件分析 | binwalk、foremost、ExifTool | [查看](misc/file.md) |
| 隐写分析 | StegSolve、zsteg、steghide | [查看](misc/stego.md) |
| 综合工具 | CyberChef、010 Editor | [查看](misc/comprehensive.md) |
| 其他工具 | 各类辅助工具 | [查看](misc/others.md) |

---

## 💡 使用说明

### 在线工具
点击工具名称或链接，直接在浏览器中使用，无需安装。适合快速测试和简单操作。

### 离线工具
提供详细的下载链接、安装步骤和使用示例。功能更强大，适合深度分析。

### 搜索功能
使用顶部搜索框，支持中文搜索，快速定位需要的工具。

### CTF解题技巧
每个分类页面都包含实用的解题技巧和Payload示例，帮助提高解题效率。

---

## 🎓 适用人群

- 🏆 **CTF选手**: 快速查找比赛工具
- 🔒 **安全研究人员**: 渗透测试和漏洞研究
- 📚 **安全学习者**: 学习各类安全工具
- 👨‍💻 **开发人员**: 了解安全测试方法

---

## 🔥 热门工具推荐

### 必备在线工具
- **CyberChef**: 数据处理瑞士军刀
- **JWT.io**: JWT解析和调试
- **CyberChef**: 编码解码全能工具
- **PortSwigger Cheat Sheets**: 官方速查表

### 必备离线工具
- **Burp Suite**: Web安全测试必备
- **Ghidra**: NSA开源逆向工具
- **SQLMap**: SQL注入自动化工具
- **Wireshark**: 流量分析神器
- **IDA Pro / IDA Free**: 专业反汇编器

---

## 📊 项目特色

<div class="grid cards" markdown>

-   :material-speedometer:{ .lg .middle } __快速查找__

    ---

    分类清晰，搜索便捷，秒速定位所需工具

-   :material-book-open-variant:{ .lg .middle } __详细文档__

    ---

    每个工具都有详细说明、使用示例和解题技巧

-   :material-update:{ .lg .middle } __持续更新__

    ---

    定期更新工具列表，修复失效链接

-   :material-github:{ .lg .middle } __开源协作__

    ---

    GitHub开源，欢迎贡献新工具和改进建议

</div>

---

## 🤝 参与贡献

发现好用的工具？链接失效了？

欢迎通过以下方式参与：

- 📝 [提交Issue](https://github.com/bright-angel/CTF-Tools/issues) - 报告问题或建议
- 🔀 [提交PR](https://github.com/bright-angel/CTF-Tools/pulls) - 直接贡献代码
- ⭐ [Star项目](https://github.com/bright-angel/CTF-Tools) - 支持项目发展

详见 [贡献指南](about.md#贡献指南)

---

## ⚠️ 免责声明

本站工具仅供**学习研究**和**授权测试**使用。

使用前请确保：

- ✅ 已获得授权
- ✅ 遵守法律法规
- ✅ 用于学习和CTF比赛

详见 [完整免责声明](about.md#免责声明)

---

## 📞 联系我们

- **GitHub**: [bright-angel/CTF-Tools](https://github.com/bright-angel/CTF-Tools)
- **在线访问**: [https://bright-angel.github.io/CTF-Tools/](https://bright-angel.github.io/CTF-Tools/)
- **问题反馈**: [提交Issue](https://github.com/bright-angel/CTF-Tools/issues)

---

<center>

**开始探索工具吧！使用左侧导航栏或上方快速导航 →**

最后更新: 2026年9月 | 版本: 2.0.0

</center>
