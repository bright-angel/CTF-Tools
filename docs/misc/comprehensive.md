# 综合工具集

CTF比赛中实用的综合工具和资源。

## 多功能工具集

### CTFCrackTools
**GitHub**: [https://github.com/0Chencc/CTFCrackTools](https://github.com/0Chencc/CTFCrackTools)

**功能**: CTF工具集合

**特点**:
- 图形化界面
- 编码解码
- 加密解密
- 密码爆破

### TomatoTools
**GitHub**: [https://github.com/ht0Ruial/TomatoTools](https://github.com/ht0Ruial/TomatoTools)

**功能**: 番茄工具箱

**特点**:
- Python编写
- 多种工具集成
- 持续更新

### CaptfEncoder
**GitHub**: [https://github.com/guyoung/CaptfEncoder](https://github.com/guyoung/CaptfEncoder)

**功能**: 跨平台网络安全工具套件

**特点**:
- Electron应用
- 编码解密
- 密码学工具
- 美观界面

### CTF-Knife
**GitHub**: [https://github.com/qianxiao996/ctf-knife](https://github.com/qianxiao996/ctf-knife)

**功能**: CTF小刀工具集

### QsNctf-Python
**GitHub**: [https://github.com/Moxin1044/qsnctf-python](https://github.com/Moxin1044/qsnctf-python)

**功能**: 青少年CTF工具

### CTF-Tools
**GitHub**: [https://github.com/qianxiao996/CTF-Tools](https://github.com/qianxiao996/CTF-Tools)

**功能**: CTF工具集合

### bo_ctfcode
**在线**: [http://www.1o1o.xyz/bo_ctfcode.html](http://www.1o1o.xyz/bo_ctfcode.html)  
**GitHub**: [https://github.com/20142995/bo_ctfcode](https://github.com/20142995/bo_ctfcode)

**功能**: CTF编解码工具

### SRK-Toolbox
**GitHub**: [https://github.com/Raka-loah/SRK-Toolbox](https://github.com/Raka-loah/SRK-Toolbox)

**功能**: SRK工具箱

### ConvertTools
**GitHub**: [https://github.com/zhangqi-ulua/ConvertTools](https://github.com/zhangqi-ulua/ConvertTools)

**功能**: 转换工具集

### ToolsFx
**GitHub**: [https://github.com/Leon406/ToolsFx](https://github.com/Leon406/ToolsFx)

**功能**: JavaFX工具集

### CTF-NetA
**GitHub**: [https://github.com/Arinue/CTF-NetA](https://github.com/Arinue/CTF-NetA)

**功能**: 网络分析工具

## 自动化工具

### Ciphey
**GitHub**: [https://github.com/Ciphey/Ciphey](https://github.com/Ciphey/Ciphey)

**功能**: 自动解密工具

**特点**:
- AI驱动
- 自动识别编码
- 命令行工具
- 快速破解

**安装**:
```bash
pip install ciphey
```

**用法**:
```bash
ciphey -t "密文"
ciphey -f file.txt
```

## 图片拼图

### PuzzleSolver
**GitHub**:
- [JamesHoi/PuzzleSolver](https://github.com/JamesHoi/PuzzleSolver)
- [Byxs20/PuzzleSolver](https://github.com/Byxs20/PuzzleSolver)

**功能**: 自动拼图工具

**特点**:
- 图片碎片识别
- 自动拼接
- 多种算法

## 二维码工具

### QrScan
**GitHub**: [https://github.com/zfb132/QrScan](https://github.com/zfb132/QrScan)

**功能**: 二维码批量识别

**特点**:
- 批量处理
- 支持多种格式
- Python实现

### QRazyBox
**在线**: [https://merri.cx/qrazybox/](https://merri.cx/qrazybox/)  
**GitHub**: [https://github.com/Merricx/qrazybox](https://github.com/Merricx/qrazybox)

**功能**: QR码分析修复工具

**特点**:
- 损坏码修复
- 数据提取
- 格式分析
- XOR操作

## 十六进制编辑

### ImHex
**GitHub**: [https://github.com/WerWolv/ImHex](https://github.com/WerWolv/ImHex)

**功能**: 现代化十六进制编辑器

**特点**:
- 模式匹配
- 数据可视化
- 脚本支持
- 跨平台

## 文件分析

### Binwalk
**GitHub**: [https://github.com/ReFirmLabs/binwalk](https://github.com/ReFirmLabs/binwalk)

**功能**: 固件分析工具

**特点**:
- 文件签名识别
- 自动提取文件
- 熵分析

**用法**:
```bash
binwalk firmware.bin
binwalk -e firmware.bin  # 提取
binwalk -E firmware.bin  # 熵分析
```

### Foremost
**GitHub**: [https://github.com/jin-stuff/foremost](https://github.com/jin-stuff/foremost)

**功能**: 数据雕刻工具

**用法**:
```bash
foremost -i image.dd -o output/
foremost -t jpg,png,pdf -i file.bin -o output/
```

### Strings
**下载**: [Microsoft Sysinternals](https://learn.microsoft.com/zh-cn/sysinternals/downloads/strings)

**功能**: 提取可打印字符串

**用法**:
```bash
strings file.bin
strings -n 10 file.bin  # 最小长度10
strings -e l file.bin   # Unicode LE
```

### NBTExplorer
**GitHub**: [https://github.com/jaquadro/NBTExplorer](https://github.com/jaquadro/NBTExplorer)

**功能**: Minecraft NBT文件查看器

**用途**: CTF Minecraft题目

## 隐写工具

### SilentEye
**在线**: [https://achorein.github.io/silenteye/](https://achorein.github.io/silenteye/)

**功能**: 图片音频隐写

### MP3Stego
**链接**: [https://www.petitcolas.net/steganography/mp3stego/](https://www.petitcolas.net/steganography/mp3stego/)

**功能**: MP3音频隐写

### NPIET
**链接**: [https://www.bertnase.de/npiet](https://www.bertnase.de/npiet)

**功能**: Piet图形编程语言

**用途**: 图片隐藏代码

## 条形码识别

### 中关村在线条形码识别
**链接**: [https://xiazai.zol.com.cn/detail/35/345364.shtml](https://xiazai.zol.com.cn/detail/35/345364.shtml)

**功能**: 条形码扫描软件

## 航班信息

### 飞常准航线图
**链接**: [https://map.variflight.com](https://map.variflight.com)

**功能**: 航班轨迹查询

**用途**: OSINT情报收集

### FlightAware
**链接**: [https://zh.flightaware.com/live/flight/](https://zh.flightaware.com/live/flight/)

**功能**: 航班跟踪

**示例**: `https://zh.flightaware.com/live/flight/B7631/history/320`

## 密码破解

### CatPasswd
**链接**: [https://www.catpasswd.com/](https://www.catpasswd.com/)

**功能**: 文件密码破解

**支持**:
- ZIP/RAR
- Office文档
- PDF
- 等等

## 在线沙箱

### VirusTotal
**链接**: [https://www.virustotal.com/](https://www.virustotal.com/)

**功能**: 文件病毒扫描

**特点**:
- 多引擎扫描
- 行为分析
- 社区评论

### Any.run
**链接**: [https://any.run/](https://any.run/)

**功能**: 交互式恶意软件沙箱

### Hybrid Analysis
**链接**: [https://www.hybrid-analysis.com/](https://www.hybrid-analysis.com/)

**功能**: 免费恶意软件分析

## CTF平台

### CTFtime
**链接**: [https://ctftime.org/](https://ctftime.org/)

**功能**: CTF赛事信息

**特点**:
- 比赛日历
- 战队排名
- WriteUp收集

### 国内CTF平台
- **BugKu**: [https://ctf.bugku.com/](https://ctf.bugku.com/)
- **攻防世界**: [https://adworld.xctf.org.cn/](https://adworld.xctf.org.cn/)
- **i春秋**: [https://www.ichunqiu.com/](https://www.ichunqiu.com/)
- **实验吧**: [http://www.shiyanbar.com/](http://www.shiyanbar.com/)

### 国际CTF平台
- **HackTheBox**: [https://www.hackthebox.com/](https://www.hackthebox.com/)
- **TryHackMe**: [https://tryhackme.com/](https://tryhackme.com/)
- **PicoCTF**: [https://picoctf.org/](https://picoctf.org/)
- **OverTheWire**: [https://overthewire.org/wargames/](https://overthewire.org/wargames/)

## CTF学习资源

### CTF Wiki
**链接**: [https://ctf-wiki.org/](https://ctf-wiki.org/)

**功能**: CTF知识库

### PayloadsAllTheThings
**GitHub**: [https://github.com/swisskyrepo/PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings)

**功能**: 各种Payload集合

## CTF解题技巧

!!! tip "使用综合工具"
    1. 优先尝试自动化工具（Ciphey）
    2. 使用在线工具快速测试
    3. 本地工具深入分析
    4. 保存有用的工具链接
    5. 建立自己的工具库

!!! tip "工具选择"
    - **快速识别**: CyberChef, Ciphey
    - **深入分析**: 专用工具
    - **批量处理**: Python脚本
    - **可视化**: GUI工具
    - **自动化**: 编写脚本

!!! warning "工具使用注意"
    - 了解工具原理
    - 验证工具结果
    - 注意版本兼容性
    - 保持工具更新
    - 不要完全依赖自动化
