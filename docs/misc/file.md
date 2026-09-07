# 文件分析工具

用于分析各种文件格式的工具。

## 在线工具

### ExifTool 在线版
**链接**: [https://exif.tools/](https://exif.tools/)

**功能**: 在线查看图片元数据

**特点**:
- 无需安装
- 快速查看EXIF信息
- 支持多种图片格式

### HexEd.it
**链接**: [https://hexed.it/](https://hexed.it/)

**功能**: 在线十六进制编辑器

**特点**:
- 无需安装
- 基础功能完善
- 隐私友好

## 离线工具

### 文件类型识别

#### file 命令
**平台**: Linux/macOS/Windows(Git Bash)

**安装**:
```bash
# Ubuntu/Debian
apt install file

# macOS (预装)
```

**功能**: 识别文件类型

**用法**:
```bash
file unknown_file
file -b unknown_file  # 简洁模式
```

#### ExifTool
**下载**: 
```
https://exiftool.org/
```

**安装**:
```bash
# Ubuntu/Debian
apt install libimage-exiftool-perl

# macOS
brew install exiftool

# Windows
下载exe文件
```

**功能**: 读取和修改文件元数据

**用法**:
```bash
exiftool image.jpg
exiftool -all= image.jpg  # 删除所有元数据
```

### 固件分析与文件提取

#### Binwalk
**下载**:
```
https://github.com/ReFirmLabs/binwalk/releases
```

**安装**:
```bash
# Ubuntu/Debian
apt install binwalk

# macOS
brew install binwalk

# Python安装
pip install binwalk
```

**功能**: 固件分析和文件提取

**特点**:
- 搜索二进制镜像文件
- 提取嵌入的文件和代码
- 固件逆向必备

**用法**:
```bash
binwalk firmware.bin
binwalk -e firmware.bin  # 自动提取
binwalk -D='.*' firmware.bin  # 提取所有
```

#### Foremost
**下载**:
```
https://github.com/jin-stuff/foremost
```

**安装**:
```bash
# Ubuntu/Debian
apt install foremost

# macOS
brew install foremost
```

**功能**: 数据雕刻和文件恢复

**用法**:
```bash
foremost -i disk.img -o output/
foremost -t jpg,png,pdf -i file.bin -o output/
```

### 十六进制编辑器

#### HxD (Windows)
**下载**:
```
https://mh-nexus.de/en/hxd/
```

**功能**: Windows十六进制编辑器

**特点**:
- 免费
- 快速
- 支持大文件

#### WinHex (Windows)
**下载**:
```
http://www.x-ways.net/winhex.zip
```

**功能**: 专业十六进制编辑器

**特点**:
- 数据恢复
- 低级数据处理
- 磁盘编辑
- 强大的搜索功能

#### 010 Editor (跨平台)
**下载**:
```
https://www.sweetscape.com/010editor/
```

**功能**: 专业十六进制编辑器

**特点**:
- 模板系统
- 脚本支持
- 结构化查看
- 商业软件

#### ImHex (开源)
**下载**:
```
https://github.com/WerWolv/ImHex
```

**功能**: 现代化十六进制编辑器

**特点**:
- 开源免费
- 模式匹配
- 数据可视化
- 脚本支持
- 跨平台

#### xxd / hexdump (命令行)
**平台**: Linux/macOS

**用法**:
```bash
xxd file.bin
xxd -p file.bin  # 纯十六进制
xxd -r hex.txt binary.bin  # 反向转换

hexdump -C file.bin
```

### 字符串提取

#### strings (命令行)
**平台**: Linux/macOS/Windows(Binutils)

**下载** (Windows):
```
https://learn.microsoft.com/zh-cn/sysinternals/downloads/strings
```

**用法**:
```bash
strings file.bin
strings -n 10 file.bin  # 最小长度10
strings -e l file.bin   # Unicode (little-endian)
strings -e b file.bin   # Unicode (big-endian)
```

#### FLOSS
**下载**:
```
https://github.com/mandiant/flare-floss
```

**功能**: 混淆字符串提取

**特点**:
- 自动去混淆
- 栈字符串识别
- 恶意软件分析

### 压缩文件工具

#### 7-Zip (跨平台)
**下载**:
```
https://www.7-zip.org/
```

**功能**: 压缩文件管理

**支持格式**: ZIP, RAR, 7z, TAR, GZ等

#### 密码破解工具

##### fcrackzip (Linux)
**安装**:
```bash
apt install fcrackzip
```

**用法**:
```bash
fcrackzip -u -D -p rockyou.txt file.zip
fcrackzip -b -c a -p aaaaaa --method 2 file.zip
```

##### Ziperello (Windows)
**下载**:
```
https://pan.baidu.com/s/1z9b_NWOjQvGWmTRn9H5vBQ
```

**功能**: ZIP密码破解工具

**特点**:
- GUI界面
- 暴力破解
- 字典破解

##### cRARk (跨平台)
**下载**:
```
http://www.crark.net/
```

**功能**: RAR压缩包密码破解工具

**特点**:
- 跨平台支持
- GPU加速
- 高性能破解

##### RAR Password Unlocker (Windows)
**下载**:
```
https://pan.baidu.com/s/1m2hoPANn5sADfPf5rf2KZA
```

**功能**: WinRAR文件密码破解器

**特点**:
- 暴力破解
- 字典破解
- 智能破解

##### John the Ripper (跨平台)
**下载**:
```
https://www.openwall.com/john/
```

**用法**:
```bash
zip2john file.zip > hash.txt
john hash.txt
john --wordlist=rockyou.txt hash.txt
```

##### Hashcat (跨平台)
**下载**:
```
https://hashcat.net/hashcat/
```

**用法**:
```bash
# ZIP
hashcat -m 17200 hash.txt wordlist.txt

# RAR5
hashcat -m 13000 hash.txt wordlist.txt
```

### CRC32碰撞工具

#### crc32-tools
**下载**:
```
https://github.com/theonlypwner/crc32
```

**功能**: CRC32爆破和碰撞

**应用**: 已知CRC32值爆破短文件内容

#### CRC32-Tools
**下载**:
```
https://github.com/AabyssZG/CRC32-Tools/releases
```

**功能**: ZIP中CRC碰撞脚本

**特点**:
- 针对ZIP伪加密
- CRC32碰撞攻击
- Python脚本

### PDF分析工具

#### pdfinfo (命令行)
**安装**:
```bash
# Ubuntu/Debian
apt install poppler-utils

# macOS
brew install poppler
```

**用法**:
```bash
pdfinfo file.pdf
```

#### pdfdetach (命令行)
**功能**: 提取PDF附件

**用法**:
```bash
pdfdetach -list file.pdf
pdfdetach -save 1 -o output.file file.pdf
```

#### qpdf (命令行)
**安装**:
```bash
apt install qpdf
brew install qpdf
```

**用法**:
```bash
qpdf --decrypt file.pdf output.pdf
qpdf --password=pass file.pdf output.pdf
```

#### PDFStreamDumper (Windows)
**下载**:
```
http://sandsprite.com/blogs/index.php?uid=7&pid=57
```

**功能**: PDF分析工具

**特点**:
- JavaScript提取
- 流分析
- 恶意代码检测

### Office文档分析

#### oledump
**下载**:
```
https://blog.didierstevens.com/programs/oledump-py/
```

**功能**: OLE文件分析

**用法**:
```bash
oledump.py document.doc
oledump.py -s 1 -v document.doc  # 查看流
```

#### oletools
**安装**:
```bash
pip install oletools
```

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

### 数据库工具

#### SQLite Browser
**下载**:
```
https://sqlitebrowser.org/
```

**功能**: SQLite数据库查看器

**特点**:
- 图形界面
- 跨平台
- SQL查询

#### sqlite3 (命令行)
**平台**: 内置于大多数系统

**用法**:
```bash
sqlite3 database.db
.tables
.schema table_name
SELECT * FROM table_name;
```

### Minecraft工具

#### NBTExplorer
**下载**:
```
https://github.com/jaquadro/NBTExplorer
```

**功能**: Minecraft NBT文件查看器

**用途**: CTF Minecraft题目

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
