# 文件分析工具

用于分析各种文件格式的工具。

## 综合分析

### file命令
**平台**: Linux/macOS/Windows(Git Bash)

**功能**: 识别文件类型

**用法**:
```bash
file unknown_file
file -b unknown_file  # 简洁模式
```

### ExifTool
**链接**: [https://exiftool.org/](https://exiftool.org/)

**功能**: 读取和修改元数据

**用法**:
```bash
exiftool image.jpg
exiftool -all= image.jpg  # 删除所有元数据
```

**在线版**: [https://exif.tools/](https://exif.tools/)

### Binwalk
**安装**: `apt install binwalk`

**功能**: 固件分析和文件提取

**用法**:
```bash
binwalk firmware.bin
binwalk -e firmware.bin  # 自动提取
binwalk -D='.*' firmware.bin  # 提取所有
```

### Foremost
**安装**: `apt install foremost`

**功能**: 数据雕刻和文件恢复

**用法**:
```bash
foremost -i disk.img -o output/
foremost -t jpg,png,pdf -i file.bin -o output/
```

## 十六进制编辑

### HxD
**链接**: [https://mh-nexus.de/en/hxd/](https://mh-nexus.de/en/hxd/)

**功能**: Windows十六进制编辑器

**特点**:
- 免费
- 快速
- 支持大文件

### 010 Editor
**链接**: [https://www.sweetscape.com/010editor/](https://www.sweetscape.com/010editor/)

**功能**: 专业十六进制编辑器

**特点**:
- 模板系统
- 脚本支持
- 结构化查看

### HexEd.it
**链接**: [https://hexed.it/](https://hexed.it/)

**功能**: 在线十六进制编辑器

**特点**:
- 无需安装
- 基础功能
- 隐私友好

### xxd / hexdump
**平台**: Linux/macOS

**用法**:
```bash
xxd file.bin
xxd -p file.bin  # 纯十六进制
xxd -r hex.txt binary.bin  # 反向转换

hexdump -C file.bin
```

## 字符串提取

### strings
**平台**: Linux/macOS/Windows(Binutils)

**用法**:
```bash
strings file.bin
strings -n 10 file.bin  # 最小长度10
strings -e l file.bin   # Unicode (little-endian)
strings -e b file.bin   # Unicode (big-endian)
```

### FLOSS
**链接**: [https://github.com/mandiant/flare-floss](https://github.com/mandiant/flare-floss)

**功能**: 混淆字符串提取

**特点**:
- 自动去混淆
- 栈字符串识别
- 恶意软件分析

## 压缩文件

### 7-Zip
**链接**: [https://www.7-zip.org/](https://www.7-zip.org/)

**功能**: 压缩文件管理

**支持格式**: ZIP, RAR, 7z, TAR, GZ, 等

### 密码破解

#### fcrackzip
**安装**: `apt install fcrackzip`

**用法**:
```bash
fcrackzip -u -D -p rockyou.txt file.zip
fcrackzip -b -c a -p aaaaaa --method 2 file.zip
```

#### John the Ripper
**链接**: [https://www.openwall.com/john/](https://www.openwall.com/john/)

**用法**:
```bash
zip2john file.zip > hash.txt
john hash.txt
john --wordlist=rockyou.txt hash.txt
```

#### Hashcat
**链接**: [https://hashcat.net/hashcat/](https://hashcat.net/hashcat/)

**用法**:
```bash
# ZIP
hashcat -m 17200 hash.txt wordlist.txt

# RAR5
hashcat -m 13000 hash.txt wordlist.txt
```

### CRC32碰撞

#### crc32-tools
**链接**: [https://github.com/theonlypwner/crc32](https://github.com/theonlypwner/crc32)

**功能**: CRC32爆破和碰撞

**应用**: 已知CRC32值爆破短文件内容

### 伪加密

#### ZIP伪加密修复
```bash
# 查看压缩文件头
hexdump -C file.zip | head -20

# 修改加密标志位
# 全局加密标志: 0x06, 0x07 -> 0x00, 0x00
```

**工具**: ZipCenOp.jar

## PDF分析

### pdfinfo
**安装**: `apt install poppler-utils`

**用法**:
```bash
pdfinfo file.pdf
```

### pdfdetach
**功能**: 提取PDF附件

**用法**:
```bash
pdfdetach -list file.pdf
pdfdetach -save 1 -o output.file file.pdf
```

### qpdf
**功能**: PDF处理工具

**用法**:
```bash
qpdf --decrypt file.pdf output.pdf
qpdf --password=pass file.pdf output.pdf
```

### PDFStreamDumper
**链接**: [http://sandsprite.com/blogs/index.php?uid=7&pid=57](http://sandsprite.com/blogs/index.php?uid=7&pid=57)

**功能**: PDF分析工具(Windows)

**特点**:
- JavaScript提取
- 流分析
- 恶意代码检测

## 办公文档

### oledump
**链接**: [https://blog.didierstevens.com/programs/oledump-py/](https://blog.didierstevens.com/programs/oledump-py/)

**功能**: OLE文件分析

**用法**:
```bash
oledump.py document.doc
oledump.py -s 1 -v document.doc  # 查看流
```

### oletools
**安装**: `pip install oletools`

**功能**: Office文档分析套件

**工具**:
- oleid: 识别OLE文件
- olevba: 提取VBA宏
- mraptor: 检测恶意宏
- rtfobj: 提取RTF对象

**用法**:
```bash
olevba document.docm
```

## 内存转储

### Volatility
**链接**: [https://github.com/volatilityfoundation/volatility3](https://github.com/volatilityfoundation/volatility3)

**功能**: 内存取证框架

**基本用法**:
```bash
vol.py -f memory.dmp windows.info
vol.py -f memory.dmp windows.pslist
vol.py -f memory.dmp windows.filescan
```

## 网络流量

### Wireshark
**链接**: [https://www.wireshark.org/](https://www.wireshark.org/)

**功能**: 网络协议分析器

**特点**:
- 深度包检测
- 协议解析
- 流追踪
- 过滤器

### tcpdump
**平台**: Linux/macOS

**用法**:
```bash
tcpdump -r capture.pcap
tcpdump -A -r capture.pcap  # ASCII显示
```

### NetworkMiner
**链接**: [https://www.netresec.com/?page=NetworkMiner](https://www.netresec.com/?page=NetworkMiner)

**功能**: 网络取证工具

**特点**:
- 自动提取文件
- 主机分析
- 凭证提取

## 数据库

### SQLite Browser
**链接**: [https://sqlitebrowser.org/](https://sqlitebrowser.org/)

**功能**: SQLite数据库查看器

**特点**:
- 图形界面
- 跨平台
- SQL查询

### sqlite3
**平台**: 内置于大多数系统

**用法**:
```bash
sqlite3 database.db
.tables
.schema table_name
SELECT * FROM table_name;
```

## CTF解题技巧

!!! tip "文件识别流程"
    1. `file` 命令识别类型
    2. `strings` 提取可见字符串
    3. `hexdump` 查看文件头
    4. `binwalk` 检测嵌入文件
    5. 专用工具深入分析

!!! tip "隐藏数据位置"
    - 文件头尾部
    - 元数据(EXIF, ID3等)
    - 注释字段
    - 备用数据流(ADS)
    - 文件内嵌套文件

!!! warning "文件格式伪装"
    - 文件扩展名可能被修改
    - 魔数被篡改
    - 多种格式混合
    - 使用file命令判断真实类型

!!! tip "常用文件头(魔数)"
    - JPEG: FF D8 FF
    - PNG: 89 50 4E 47
    - GIF: 47 49 46 38
    - ZIP: 50 4B 03 04
    - PDF: 25 50 44 46
    - ELF: 7F 45 4C 46
