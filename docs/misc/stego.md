# 隐写分析工具

隐写术(Steganography)是将信息隐藏在其他文件中的技术。

## 图片隐写

### StegOnline
**链接**: [https://stegonline.georgeom.net/upload](https://stegonline.georgeom.net/upload)

**功能**: 在线图片隐写分析

**特点**:
- LSB分析
- 颜色通道分离
- 位平面查看
- 数据提取

### Aperi'Solve
**链接**: [https://www.aperisolve.com/](https://www.aperisolve.com/)

**功能**: 自动化图片隐写检测

**特点**:
- 集成多种工具
- 自动尝试各种方法
- 详细分析报告
- 非常适合CTF

### StegSolve
**下载**: [GitHub](https://github.com/zardus/ctf-tools/tree/master/stegsolve)

**功能**: 图片隐写分析工具(Java)

**特点**:
- 通道查看
- LSB提取
- 图片对比
- 数据浏览器

### Zsteg
**安装**: `gem install zsteg`

**功能**: PNG/BMP隐写检测

**用法**:
```bash
zsteg image.png
zsteg -a image.png  # 尝试所有方法
```

### Steghide
**安装**: `apt install steghide`

**功能**: 图片/音频隐写工具

**用法**:
```bash
# 提取
steghide extract -sf image.jpg

# 查看信息
steghide info image.jpg
```

**支持格式**: JPEG, BMP, WAV, AU

### Stegseek
**链接**: [https://github.com/RickdeJager/stegseek](https://github.com/RickdeJager/stegseek)

**功能**: Steghide密码爆破

**特点**:
- 极快的速度
- 字典攻击
- 自动提取

## 音频隐写

### Sonic Visualiser
**链接**: [https://www.sonicvisualiser.org/](https://www.sonicvisualiser.org/)

**功能**: 音频波形和频谱分析

**特点**:
- 频谱图查看
- 时域/频域分析
- 隐藏信息可视化

### Audacity
**链接**: [https://www.audacityteam.org/](https://www.audacityteam.org/)

**功能**: 音频编辑和分析

**特点**:
- 波形查看
- 频谱分析
- 查看元数据
- 反转/变速

### DeepSound
**链接**: [http://jpinsoft.net/deepsound/](http://jpinsoft.net/deepsound/)

**功能**: 音频隐写工具(Windows)

**特点**:
- WAV/FLAC隐写
- AES加密
- 提取隐藏文件

## LSB隐写

### LSB原理
最低有效位(Least Significant Bit)隐写是最常见的方法。

**原理**: 修改像素值的最后一位来隐藏数据。

**示例**:
```
原始RGB: (255, 254, 253) = (11111111, 11111110, 11111101)
藏入'A'的一位(0): (11111110, 11111110, 11111101)
```

### LSB隐写检测
```python
from PIL import Image

img = Image.open('image.png')
pixels = img.load()

# 提取LSB
data = []
for i in range(img.width):
    for j in range(img.height):
        r, g, b = pixels[i, j]
        data.append(r & 1)
        data.append(g & 1)
        data.append(b & 1)
```

## 文本隐写

### Unicode隐写
**工具**: [Unicode Steganography](https://www.irongeek.com/i.php?page=security/unicode-steganography-homoglyph-encoder)

**原理**: 使用不可见字符或同形字

**示例**:
- 零宽字符(Zero-Width)
- 同形异义字符

### 空白隐写
**工具**: [SNOW](http://www.darkside.com.au/snow/)

**原理**: 在文本文件的空白处(空格/制表符)隐藏信息

**用法**:
```bash
# 隐藏
snow -C -m "secret" -p "password" input.txt output.txt

# 提取
snow -C -p "password" output.txt
```

## ZIP隐写

### Binwalk
**安装**: `apt install binwalk`

**功能**: 固件分析和文件提取

**用法**:
```bash
binwalk file.bin
binwalk -e file.bin  # 自动提取
```

### Foremost
**安装**: `apt install foremost`

**功能**: 数据雕刻工具

**用法**:
```bash
foremost -i file.img -o output/
```

### 010 Editor
**链接**: [https://www.sweetscape.com/010editor/](https://www.sweetscape.com/010editor/)

**功能**: 十六进制编辑器

**特点**:
- 模板支持
- 结构化查看
- 强大的搜索

## PDF隐写

### PDF-Parser
**安装**: `pip install pdfminer.six`

**功能**: PDF内容提取

**用法**:
```bash
pdf-parser.py file.pdf
```

### PDFtk
**安装**: `apt install pdftk`

**功能**: PDF工具包

**用法**:
```bash
pdftk file.pdf dump_data  # 查看元数据
```

## 二维码

### QR Code Reader
**链接**: [https://www.webqr.com/](https://www.webqr.com/)

**功能**: 在线二维码识别

### QRazyBox
**链接**: [https://merricx.github.io/qrazybox/](https://merricx.github.io/qrazybox/)

**功能**: QR码分析工具

**特点**:
- 损坏码修复
- 数据提取
- 格式分析
- XOR操作

### zbarimg
**安装**: `apt install zbar-tools`

**功能**: 命令行二维码识别

**用法**:
```bash
zbarimg image.png
```

## CTF解题技巧

!!! tip "图片隐写分析流程"
    1. 查看文件属性和元数据(exiftool)
    2. 十六进制查看(xxd, hexdump)
    3. 搜索已知文件头(binwalk)
    4. LSB分析(stegsolve, zsteg)
    5. 尝试stegseek暴力破解
    6. 频域分析(FFT)
    7. 检查通道和位平面

!!! tip "常见隐写类型识别"
    - **LSB**: 图片看起来正常，文件稍大
    - **Steghide**: JPEG文件，需要密码
    - **附加数据**: 文件末尾有额外数据(binwalk)
    - **颜色通道**: 特定通道有异常(stegsolve)
    - **二维码**: 扫描或拼接后是二维码

!!! warning "注意事项"
    - 保留原始文件，避免损坏
    - 注意文件格式(PNG/JPEG特性不同)
    - 某些隐写需要密码(题目描述/文件名)
    - 提取出的数据可能还需解码
    - 组合使用多种方法

!!! tip "元数据检查"
    ```bash
    exiftool image.jpg
    strings file.bin
    file unknown_file
    ```
