# 快速开始指南

欢迎使用CTF在线工具导航！本指南帮助你快速上手。

## 📖 使用导航

### 浏览工具

1. 使用顶部**导航栏**切换不同类别
2. 使用左侧**侧边栏**查看详细分类
3. 点击工具链接直接访问在线工具

### 搜索功能

点击顶部的🔍搜索图标，输入关键词：
- 工具名称
- 技术术语
- 攻击类型

### 主题切换

点击顶部的🌙/☀️图标切换亮色/暗色主题。

## 🎯 常用工具推荐

### 新手入门

如果你是CTF新手，推荐从这些工具开始：

1. **[CyberChef](https://gchq.github.io/CyberChef/)** - 万能数据处理工具
2. **[Base64 Decode](https://www.base64decode.org/)** - 最常用的编码
3. **[MD5解密](https://www.cmd5.com/)** - 哈希破解
4. **[SQLMap](http://www.sqlilab.com/)** - SQL注入学习
5. **[Aperi'Solve](https://www.aperisolve.com/)** - 图片隐写分析

### 进阶工具

熟练后可以尝试：

1. **[RsaCtfTool](https://github.com/RsaCtfTool/RsaCtfTool)** - RSA攻击
2. **[Ghidra](https://ghidra-sre.org/)** - 逆向分析
3. **[Burp Suite](https://portswigger.net/burp)** - Web安全测试
4. **[Volatility](https://github.com/volatilityfoundation/volatility3)** - 内存取证
5. **[Pwntools](https://github.com/Gallopsled/pwntools)** - Pwn工具库

## 🔍 按场景查找

### 拿到一个加密字符串

1. 访问 [编码解码 → Base系列](encode/base.md)
2. 尝试使用 CyberChef 自动识别
3. 查看 [加密解密 → 哈希函数](crypto/hash.md) 判断是否为哈希

### 分析一个Web应用

1. 查看 [Web工具](web/sqli.md)
2. 使用 Burp Suite 抓包分析
3. 测试常见漏洞：SQL注入、XSS、文件上传等

### 逆向一个二进制文件

1. 访问 [逆向工具 → 反编译](reverse/decompiler.md)
2. 根据文件类型选择工具
3. 配合 [在线调试](reverse/debugger.md) 动态分析

### 分析一张图片

1. 访问 [杂项工具 → 隐写分析](misc/stego.md)
2. 使用 Aperi'Solve 自动分析
3. 查看 [文件分析](misc/file.md) 了解更多技巧

### 处理压缩包

1. 访问 [杂项工具 → 文件分析](misc/file.md)
2. 检查是否有密码保护
3. 使用相应工具破解或绕过

## 💡 解题流程

### 通用思路

```
1. 信息收集
   ↓
2. 识别问题类型
   ↓
3. 选择合适工具
   ↓
4. 尝试解决
   ↓
5. 验证答案
```

### Crypto类

1. 识别加密/编码类型
2. 判断是否为古典密码
3. 检查密钥或参数
4. 尝试爆破或数学攻击
5. 获取明文

### Web类

1. 信息收集（源码、注释、robots.txt）
2. 识别技术栈
3. 测试常见漏洞
4. 构造Payload
5. 获取Flag

### Reverse类

1. 静态分析（反编译）
2. 识别关键函数
3. 动态调试验证
4. 提取或计算Flag

### Pwn类

1. 检查保护机制
2. 寻找漏洞点
3. 构造利用链
4. 编写Exploit
5. 获取Shell/Flag

### Misc类

1. 文件类型识别
2. 元数据检查
3. 尝试常见隐写工具
4. 组合多种技术
5. 提取隐藏信息

## 🛠️ 工具组合

很多题目需要组合使用多个工具：

### 组合1: 图片 + 加密
```
Stegsolve提取数据 → Base64解码 → AES解密 → Flag
```

### 组合2: Web + Crypto
```
SQL注入获取密文 → 识别加密算法 → 破解密钥 → Flag
```

### 组合3: 文件分析 + 隐写
```
Binwalk提取文件 → Steghide提取数据 → 解码 → Flag
```

## 📚 学习资源

### 在线靶场

- [PicoCTF](https://picoctf.org/) - 适合初学者
- [HackTheBox](https://www.hackthebox.com/) - 综合平台
- [OverTheWire](https://overthewire.org/wargames/) - 命令行游戏

### 赛事信息

- [CTFtime](https://ctftime.org/) - 比赛日历和排名

### 文档资料

- [CTF Wiki](https://ctf-wiki.org/) - 中文知识库
- [Crypto Wiki](https://en.wikipedia.org/wiki/Outline_of_cryptography) - 密码学

## ⚙️ 本地环境搭建

### 推荐工具安装

**Linux (Ubuntu/Debian)**:
```bash
# 基础工具
sudo apt update
sudo apt install binwalk foremost steghide exiftool

# Python工具
pip install pwntools z3-solver

# 逆向工具
sudo apt install gdb radare2
```

**macOS**:
```bash
brew install binwalk exiftool steghide
pip3 install pwntools
```

**Windows**:
- 使用 WSL (Windows Subsystem for Linux)
- 或安装各工具的Windows版本

## 🎓 提升技巧

### 练习建议

1. **每日一题**: 坚持做题保持手感
2. **专项突破**: 针对薄弱方向集中练习
3. **复盘总结**: 比赛后阅读WriteUp学习
4. **工具熟练**: 熟悉常用工具的用法
5. **知识积累**: 建立自己的笔记库

### 比赛策略

1. **快速扫描**: 先浏览所有题目
2. **先易后难**: 从擅长的类型开始
3. **团队协作**: 合理分工，避免重复
4. **记录过程**: 记下尝试过的方法
5. **时间管理**: 避免在一道题上卡太久

## ❓ 常见问题

**Q: 工具链接失效怎么办？**

A: 请在GitHub提交Issue，我们会及时更新。

**Q: 如何判断使用哪个工具？**

A: 先识别问题类型，参考本站的分类和描述。

**Q: 有移动版吗？**

A: 本站响应式设计，手机浏览器可直接访问。

**Q: 可以离线使用吗？**

A: 可以克隆仓库到本地运行。

## 🚀 开始探索

准备好了吗？从[首页](index.md)开始探索CTF在线工具的世界吧！

---

遇到问题？查看[关于页面](about.md)获取帮助。
