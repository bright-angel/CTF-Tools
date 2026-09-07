# 文件分析工具

用于分析各种文件格式的工具。

## 在线工具

### 文件分析平台

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| ExifTool在线版 | [https://exif.tools/](https://exif.tools/) | 查看图片EXIF信息 |
| HexEd.it | [https://hexed.it/](https://hexed.it/) | 在线十六进制编辑器 |
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 文件分析与数据转换 |

## 离线工具

### 文件类型识别

#### file命令

**平台**: Linux/macOS/Windows(Git Bash)

**安装**:
```bash
# Ubuntu/Debian
apt install file

# macOS (预装)
# Windows: Git Bash自带
```

**基本使用**:
```bash
# 识别文件类型
file unknown_file

# 简洁模式
file -b unknown_file

# 识别MIME类型
file -i unknown_file

# 批量识别
file *
```

#### TrID

**下载链接**:
```
https://mark0.net/soft-trid-e.html
```

**功能**: 基于特征识别文件类型

**使用**:
```bash
trid unknown_file
```

### 元数据查看

#### ExifTool

**下载链接**:
```
https://exiftool.org/
```

**安装**:
```bash
# Ubuntu/Debian
apt install libimage-exiftool-perl

# macOS
brew install exiftool

# Windows: 下载exe
```

**基本使用**:
```bash
# 查看所有元数据
exiftool image.jpg

# 查看特定字段
exiftool -Comment image.jpg

# 删除所有元数据
exiftool -all= image.jpg

# 批量处理
exiftool -all= *.jpg

# 递归处理目录
exiftool -r -all= ./images/

# 提取缩略图
exiftool -b -ThumbnailImage image.jpg > thumb.jpg
```

**常见隐写位置**:
- Comment (注释)
- UserComment
- ImageDescription
- Artist
- Copyright

### 固件分析与文件提取

#### Binwalk

**下载链接**:
```
https://github.com/ReFirmLabs/binwalk
```

**安装**:
```bash
# Ubuntu/Debian
apt install binwalk

# macOS
brew install binwalk

# Python
pip install binwalk
```

**基本使用**:
```bash
# 扫描文件
binwalk firmware.bin

# 自动提取所有文件
binwalk -e firmware.bin

# 提取到指定目录
binwalk -e firmware.bin -C output/

# 显示详细信息
binwalk -v firmware.bin

# 指定提取签名
binwalk --dd='.*' firmware.bin

# 递归提取
binwalk -Me firmware.bin

# 熵值分析（检测加密/压缩）
binwalk -E firmware.bin
```

#### Foremost

**下载链接**:
```
https://github.com/korczis/foremost
```

**安装**:
```bash
# Ubuntu/Debian
apt install foremost

# macOS
brew install foremost
```

**基本使用**:
```bash
# 恢复所有支持的文件
foremost -i disk.img -o output/

# 仅恢复特定类型
foremost -t jpg,png,pdf -i file.bin -o output/

# 详细模式
foremost -v -i file.bin -o output/
```

#### Scalpel

**下载链接**:
```
https://github.com/sleuthkit/scalpel
```

**安装**:
```bash
apt install scalpel
```

**使用**:
```bash
# 编辑配置文件 /etc/scalpel/scalpel.conf
# 取消注释需要提取的文件类型

scalpel file.bin -o output/
```

### 十六进制编辑器

#### HxD (Windows)

**下载链接**:
```
https://mh-nexus.de/en/hxd/
```

**特点**:
- 免费
- 快速
- 支持大文件
- 数据比较
- 磁盘编辑

#### 010 Editor

**下载链接**:
```
https://www.sweetscape.com/010editor/
```

**特点**:
- 模板系统（解析文件结构）
- 脚本支持
- 跨平台
- 强大的搜索功能

#### ImHex

**下载链接**:
```
https://github.com/WerWolv/ImHex
```

**特点**:
- 开源免费
- 模式语言
- 数据可视化
- 跨平台
- 现代化界面

#### xxd / hexdump (命令行)

**使用**:
```bash
# xxd
xxd file.bin                    # 十六进制+ASCII
xxd -p file.bin                 # 纯十六进制
xxd -l 100 file.bin            # 只显示前100字节
xxd -r hex.txt binary.bin      # 反向转换

# hexdump
hexdump -C file.bin            # 规范格式
hexdump -n 100 -C file.bin     # 前100字节
```

### 字符串提取

#### strings命令

**下载链接** (Windows):
```
https://learn.microsoft.com/sysinternals/downloads/strings
```

**使用**:
```bash
# 基本使用
strings file.bin

# 最小长度
strings -n 10 file.bin

# Unicode (little-endian)
strings -e l file.bin

# Unicode (big-endian)
strings -e b file.bin

# 显示偏移
strings -t x file.bin

# 结合grep
strings file.bin | grep -i flag
strings file.bin | grep -E "^[a-zA-Z0-9+/]{20,}={0,2}$"  # Base64
```

#### FLOSS

**下载链接**:
```
https://github.com/mandiant/flare-floss
```

**功能**: 提取混淆字符串

**使用**:
```bash
floss malware.exe
floss --no-static-strings malware.exe  # 仅提取解混淆字符串
```

### 压缩文件

#### 7-Zip

**下载链接**:
```
https://www.7-zip.org/
```

**命令行使用**:
```bash
# 解压
7z x archive.7z

# 列出内容
7z l archive.7z

# 测试完整性
7z t archive.7z

# 带密码解压
7z x -p"password" archive.zip
```

#### ZIP伪加密修复

**原理**: ZIP中央目录记录的加密标志位被修改

**检测与修复**:
```python
# 使用十六进制编辑器
# 搜索 50 4B 01 02 (中央目录文件头)
# 修改偏移+8处的加密标志位为00 00
```

**工具**: ZipCenOp, Advanced ZIP Password Recovery

#### 压缩包密码破解

##### fcrackzip

**安装**:
```bash
apt install fcrackzip
```

**使用**:
```bash
# 字典攻击
fcrackzip -u -D -p rockyou.txt file.zip

# 暴力破解（纯数字）
fcrackzip -b -c '1' -l 1-6 file.zip

# 暴力破解（字母+数字）
fcrackzip -b -c 'aA1' -l 4-6 file.zip
```

##### John the Ripper

**下载链接**:
```
https://www.openwall.com/john/
```

**使用**:
```bash
# ZIP
zip2john file.zip > hash.txt
john hash.txt
john --wordlist=rockyou.txt hash.txt

# RAR
rar2john file.rar > hash.txt
john hash.txt
```

##### Hashcat

**下载链接**:
```
https://hashcat.net/hashcat/
```

**使用**:
```bash
# ZIP (PKZIP)
hashcat -m 17200 hash.txt wordlist.txt

# ZIP (WinZip)
hashcat -m 13600 hash.txt wordlist.txt

# RAR3
hashcat -m 12500 hash.txt wordlist.txt

# RAR5
hashcat -m 13000 hash.txt wordlist.txt

# 7z
hashcat -m 11600 hash.txt wordlist.txt
```

### CRC32工具

#### crc32-tools

**下载链接**:
```
https://github.com/theonlypwner/crc32
```

**使用**:
```bash
# 已知CRC32反推内容
python crc32.py reverse 0x12345678

# 已知明文部分
python crc32.py append "known_text" 0x12345678
```

#### CRC32-Tools

**下载链接**:
```
https://github.com/AabyssZG/CRC32-Tools
```

**功能**: ZIP CRC碰撞工具

### PDF分析

#### pdfinfo

**安装**:
```bash
# Ubuntu/Debian
apt install poppler-utils

# macOS
brew install poppler
```

**使用**:
```bash
# 查看PDF信息
pdfinfo file.pdf

# 提取文本
pdftotext file.pdf output.txt

# 提取图片
pdfimages file.pdf output_prefix
```

#### pdfdetach

**使用**:
```bash
# 列出附件
pdfdetach -list file.pdf

# 提取附件
pdfdetach -save 1 -o output.file file.pdf
pdfdetach -saveall -o output_dir file.pdf
```

#### qpdf

**安装**:
```bash
apt install qpdf
brew install qpdf
```

**使用**:
```bash
# 解密PDF
qpdf --decrypt input.pdf output.pdf

# 使用密码
qpdf --password=pass --decrypt input.pdf output.pdf

# 修复PDF
qpdf --check input.pdf
```

#### PDFStreamDumper

**下载链接**:
```
http://sandsprite.com/blogs/index.php?uid=7&pid=57
```

**功能**: PDF流分析和JavaScript提取

#### pdf-parser

**下载链接**:
```
https://blog.didierstevens.com/programs/pdf-tools/
```

**使用**:
```bash
# 分析PDF结构
python pdf-parser.py file.pdf

# 搜索关键字
python pdf-parser.py -s "/JavaScript" file.pdf

# 提取对象
python pdf-parser.py -o 10 file.pdf
```

### Office文档分析

#### oletools

**下载链接**:
```
https://github.com/decalage2/oletools
```

**安装**:
```bash
pip install oletools
```

**使用**:
```bash
# 提取VBA宏
olevba document.docm

# 识别OLE文件
oleid document.doc

# 提取RTF对象
rtfobj document.rtf

# 检测恶意宏
mraptor document.xlsm
```

#### oledump

**下载链接**:
```
https://blog.didierstevens.com/programs/oledump-py/
```

**使用**:
```bash
# 列出流
python oledump.py document.doc

# 查看特定流
python oledump.py -s 1 document.doc

# 反编译VBA
python oledump.py -s 1 -v document.doc
```

### 数据库工具

#### SQLite Browser

**下载链接**:
```
https://sqlitebrowser.org/
```

**特点**: 图形界面SQLite管理工具

#### sqlite3命令

**使用**:
```bash
# 打开数据库
sqlite3 database.db

# 常用命令
.tables                    # 列出表
.schema table_name         # 查看表结构
.dump table_name          # 导出表
SELECT * FROM table_name; # 查询

# 单行命令
sqlite3 database.db "SELECT * FROM users;"
```

### 特殊格式工具

#### NBTExplorer

**下载链接**:
```
https://github.com/jaquadro/NBTExplorer
```

**功能**: Minecraft NBT文件编辑器

**用途**: CTF Minecraft相关题目

#### FFmpeg

**下载链接**:
```
https://ffmpeg.org/download.html
```

**功能**: 音视频分析

**使用**:
```bash
# 查看信息
ffmpeg -i video.mp4

# 提取帧
ffmpeg -i video.mp4 -vf fps=1 frame_%d.png

# 提取音频
ffmpeg -i video.mp4 -vn audio.mp3
```

## CTF解题技巧

!!! tip "标准分析流程"
    ```bash
    # 1. 基本识别
    file unknown_file
    
    # 2. 查看十六进制头部
    xxd unknown_file | head
    
    # 3. 提取字符串
    strings unknown_file
    strings -e l unknown_file  # Unicode
    
    # 4. 搜索嵌入文件
    binwalk unknown_file
    binwalk -e unknown_file
    
    # 5. 查看元数据
    exiftool unknown_file
    
    # 6. 专用工具分析
    ```

!!! tip "文件头修复"
    ```bash
    # 常见文件头（魔数）
    JPEG: FF D8 FF E0 (JFIF) / FF D8 FF E1 (EXIF)
    PNG:  89 50 4E 47 0D 0A 1A 0A
    GIF:  47 49 46 38 39 61 (GIF89a)
    ZIP:  50 4B 03 04
    RAR:  52 61 72 21 1A 07
    PDF:  25 50 44 46
    ELF:  7F 45 4C 46
    BMP:  42 4D
    
    # 修复方法：使用十六进制编辑器修改前几个字节
    ```

!!! tip "隐藏数据位置"
    ```
    1. 文件头尾
       - 文件开头魔数之前
       - 文件结尾EOF之后
    
    2. 元数据
       - EXIF (图片)
       - ID3 (音频)
       - Comment字段
    
    3. 保留空间
       - 扇区尾部
       - 填充字节
    
    4. 嵌套文件
       - 多个文件拼接
       - ZIP注释
       - PNG额外数据块
    
    5. 备用数据流 (Windows ADS)
       dir /r 查看
       more < file.txt:hidden.txt
    ```

!!! tip "ZIP文件技巧"
    ```
    1. ZIP伪加密
       - 修改加密标志位
       - 50 4B 01 02之后第9-10字节改为00 00
    
    2. ZIP明文攻击
       - 已知明文攻击
       - 工具: pkcrack, bkcrack
    
    3. ZIP CRC爆破
       - 文件很小时可通过CRC反推内容
       - 工具: crc32-tools
    
    4. ZIP注释
       - ZIP文件末尾可以有注释
       - 十六进制查看或7z查看
    ```

!!! tip "PDF隐写"
    ```
    1. 对象流
       - PDF中可以有隐藏对象
       - 使用pdf-parser分析
    
    2. JavaScript
       - PDF可嵌入JS代码
       - 使用PDFStreamDumper提取
    
    3. 附件
       - pdfdetach提取
    
    4. 元数据
       - pdfinfo查看
       - exiftool查看
    ```

!!! tip "Office文档隐写"
    ```
    1. VBA宏
       - olevba提取
       - 可能包含隐藏代码
    
    2. 隐藏工作表
       - Excel可以隐藏sheet
       - 取消隐藏查看
    
    3. 修订历史
       - Word文档可能保留历史
       - 接受所有修订查看
    
    4. 嵌入对象
       - 可能嵌入文件或图片
       - 解压docx查看media目录
    ```

!!! tip "Binwalk提取后处理"
    ```bash
    # Binwalk提取后通常创建 _filename.extracted 目录
    
    # 查看提取的文件
    cd _firmware.bin.extracted
    ls -lh
    
    # 递归提取
    binwalk -Me firmware.bin
    
    # 如果提取失败，手动dd提取
    dd if=firmware.bin of=extracted.bin bs=1 skip=OFFSET count=SIZE
    ```

!!! warning "常见陷阱"
    ```
    1. 文件扩展名伪装
       - 不要相信扩展名
       - 用file命令确认
    
    2. 多层嵌套
       - 可能需要多次提取
       - 每次都要分析提取结果
    
    3. 部分损坏
       - 可能故意损坏文件头
       - 尝试修复或跳过错误
    
    4. 密码保护
       - 密码可能在题目描述或其他文件中
       - 尝试弱密码、空密码
    
    5. 自定义格式
       - 可能是自定义或魔改的格式
       - 手动分析结构
    ```

!!! tip "快速字符串搜索"
    ```bash
    # 搜索flag格式
    strings file.bin | grep -i flag
    strings file.bin | grep "flag{"
    
    # 搜索Base64
    strings file.bin | grep -E "^[A-Za-z0-9+/]{20,}={0,2}$"
    
    # 搜索URL
    strings file.bin | grep "http"
    
    # 搜索十六进制
    strings file.bin | grep -E "^[0-9a-fA-F]{32,}$"
    ```

## 相关资源

- **Binwalk**: 固件分析必备工具
- **ExifTool**: 元数据查看和编辑标准工具
- **010 Editor**: 专业十六进制编辑器，支持模板
- **oletools**: Office文档分析工具集
- **CyberChef**: 在线数据分析瑞士军刀
