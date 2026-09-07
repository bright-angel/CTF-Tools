# 隐写分析工具

隐写术(Steganography)是将信息隐藏在其他文件中的技术。

## 在线工具

### 图片隐写分析

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| StegOnline | [https://stegonline.georgeom.net/upload](https://stegonline.georgeom.net/upload) | LSB分析、位平面查看 |
| Aperi'Solve | [https://www.aperisolve.com/](https://www.aperisolve.com/) | 自动化图片隐写检测 |
| Unicode隐写 | [https://www.irongeek.com/i.php?page=security/unicode-steganography-homoglyph-encoder](https://www.irongeek.com/i.php?page=security/unicode-steganography-homoglyph-encoder) | Unicode零宽字符隐写 |

### 二维码工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| WebQR | [https://www.webqr.com/](https://www.webqr.com/) | 在线二维码识别 |
| QRazyBox | [https://merricx.github.io/qrazybox/](https://merricx.github.io/qrazybox/) | 二维码修复与分析 |

## 离线工具

### 图片隐写

#### StegSolve

**下载链接**:
```
https://github.com/zardus/ctf-tools/blob/master/stegsolve/install
http://www.caesum.com/handbook/Stegsolve.jar
```

**安装使用**:
```bash
# 运行
java -jar Stegsolve.jar
```

**功能**:
- 颜色通道分离 (Red/Green/Blue 0-7)
- LSB位平面查看
- 图片XOR、ADD、SUB操作
- 立体图查看
- 帧浏览器 (GIF动图)
- 图片组合分析
- 数据提取器

**使用技巧**:
```
1. 打开图片后用箭头键切换通道
2. Analyse -> Data Extract 提取数据
3. Analyse -> Frame Browser 查看GIF帧
4. Analyse -> Image Combiner 组合两张图
```

#### zsteg

**下载链接**:
```
gem install zsteg
```

**功能**: PNG/BMP隐写自动检测

**基本使用**:
```bash
# 快速扫描
zsteg image.png

# 尝试所有方法
zsteg -a image.png

# 详细输出
zsteg -v image.png

# 仅LSB
zsteg --lsb image.png

# 提取特定通道
zsteg -E "b1,rgb,lsb,xy" image.png > output.txt
```

**检测内容**:
- LSB隐写
- OpenStego
- Camouflage
- LSB with The Eratosthenes set
- 各种字节序和通道组合

#### Steghide

**下载链接**:
```
https://steghide.sourceforge.net/
```

**安装**:
```bash
# Ubuntu/Debian
apt install steghide

# macOS
brew install steghide
```

**基本使用**:
```bash
# 嵌入文件
steghide embed -cf cover.jpg -ef secret.txt -p password

# 提取文件
steghide extract -sf stego.jpg -p password

# 不用密码
steghide extract -sf stego.jpg

# 查看信息
steghide info stego.jpg

# 获取嵌入容量
steghide --encinfo -sf cover.jpg
```

**支持格式**: JPEG, BMP, WAV, AU

#### Stegseek

**下载链接**:
```
https://github.com/RickdeJager/stegseek
```

**安装**:
```bash
# Ubuntu/Debian
wget https://github.com/RickdeJager/stegseek/releases/download/v0.6/stegseek_0.6-1.deb
dpkg -i stegseek_0.6-1.deb
```

**使用**:
```bash
# 字典爆破steghide密码
stegseek image.jpg rockyou.txt

# 使用默认字典
stegseek image.jpg

# 指定输出文件
stegseek image.jpg wordlist.txt -xf output.txt
```

**特点**: 比stegcracker快数千倍

#### stegcracker

**下载链接**:
```
pip install stegcracker
```

**使用**:
```bash
stegcracker image.jpg rockyou.txt
```

#### outguess

**下载链接**:
```
https://github.com/resurrecting-open-source-projects/outguess
```

**安装**:
```bash
apt install outguess
```

**使用**:
```bash
# 提取
outguess -r image.jpg output.txt

# 嵌入
outguess -d secret.txt cover.jpg stego.jpg
```

#### jsteg

**下载链接**:
```
https://github.com/lukechampine/jsteg
```

**功能**: JPEG隐写

**使用**:
```bash
# 提取
jsteg reveal image.jpg output.txt

# 嵌入
jsteg hide cover.jpg secret.txt stego.jpg
```

#### F5-steganography

**下载链接**:
```
https://github.com/matthewgao/F5-steganography
```

**功能**: F5算法JPEG隐写

**使用**:
```bash
java Extract stego.jpg -p password
```

#### BlindWatermark

**下载链接**:
```
https://github.com/chishaxie/BlindWaterMark
```

**功能**: 频域盲水印

**安装使用**:
```bash
pip install blind-watermark

# 提取水印
python bwm.py decode image.png output.png
```

### 音频隐写

#### Audacity

**下载链接**:
```
https://www.audacityteam.org/download/
```

**功能**: 音频编辑和分析

**使用技巧**:
```
1. 导入音频文件
2. 查看波形 - 可能有摩斯电码等视觉信息
3. 频谱图 (Analyze -> Plot Spectrum) - 查看频域
4. 声谱图 (View -> Spectrogram) - 可能有隐藏图像
5. 效果 -> 反转、变速、变调
6. 分离立体声轨道分析
```

**常见技巧**:
- DTMF音频 -> 拨号音译码
- 摩斯电码 -> 长短波形
- SSTV图像 -> 慢扫描电视
- 频谱隐藏文字/图像

#### Sonic Visualiser

**下载链接**:
```
https://www.sonicvisualiser.org/
```

**功能**: 专业音频可视化分析

**特点**:
- 频谱图
- 时域/频域分析
- 层叠波形
- 插件系统

#### DeepSound

**下载链接**:
```
http://jpinsoft.net/deepsound/
```

**平台**: Windows

**使用**:
```
1. 打开音频文件
2. Extract secret files
3. 输入密码（如果有）
```

**支持格式**: WAV, FLAC, WMA, APE

#### Steghide

同样支持WAV和AU格式音频文件

#### DTMF Decoder

**在线工具**: 
- http://dialabc.com/sound/detect/
- https://dtmf.netlify.app/

**功能**: 拨号音(DTMF)解码

#### Morse Code

**在线工具**:
- https://morsecode.world/international/decoder/audio-decoder-adaptive.html

**离线工具**: Audacity手动识别

#### SSTV Decoder

**工具**: MMSSTV, RX-SSTV, QSSTV

**下载链接**:
```
http://www.qsl.net/mmhamsoft/mmsstv/
```

**功能**: 慢扫描电视图像解码

### LSB隐写工具

#### LSBSteg

**下载链接**:
```
https://github.com/RobinDavid/LSB-Steganography
```

**安装使用**:
```bash
pip install lsbsteg

# 提取
python LSBSteg.py decode -i stego.png -o output.txt

# 嵌入
python LSBSteg.py encode -i cover.png -o stego.png -f secret.txt
```

#### cloacked-pixel

**下载链接**:
```
https://github.com/livz/cloacked-pixel
```

**功能**: LSB隐写工具

#### Python脚本

```python
from PIL import Image

def extract_lsb(image_path, output_file):
    img = Image.open(image_path)
    binary_data = ""
    
    for pixel in img.getdata():
        for value in pixel[:3]:  # RGB
            binary_data += str(value & 1)
    
    # 转换为字节
    chars = [binary_data[i:i+8] for i in range(0, len(binary_data), 8)]
    message = ''.join([chr(int(char, 2)) for char in chars])
    
    with open(output_file, 'w') as f:
        f.write(message)

extract_lsb('stego.png', 'output.txt')
```

### 文本隐写

#### SNOW

**下载链接**:
```
http://www.darkside.com.au/snow/
```

**功能**: 空白字符隐写

**使用**:
```bash
# 嵌入
snow -C -m "secret message" -p "password" input.txt output.txt

# 提取
snow -C -p "password" output.txt
```

#### Unicode零宽字符检测

**Python脚本**:
```python
text = open('file.txt', 'r', encoding='utf-8').read()

# 检测零宽字符
zero_width_chars = [
    '​',  # Zero Width Space
    '‌',  # Zero Width Non-Joiner
    '‍',  # Zero Width Joiner
    '﻿',  # Zero Width No-Break Space
]

for char in zero_width_chars:
    if char in text:
        print(f"Found {repr(char)}")
        print(text.encode('unicode-escape'))
```

### 二维码工具

#### zbarimg

**安装**:
```bash
apt install zbar-tools
```

**使用**:
```bash
# 识别二维码
zbarimg image.png

# 批量识别
zbarimg *.png
```

#### qrcode (Python)

**安装**:
```bash
pip install qrcode pillow pyzbar
```

**使用**:
```python
from pyzbar.pyzbar import decode
from PIL import Image

# 解码
data = decode(Image.open('qr.png'))
print(data[0].data.decode())
```

### 其他格式隐写

#### PDF隐写

**pdf-parser**:
```
https://blog.didierstevens.com/programs/pdf-tools/
```

**使用**:
```bash
python pdf-parser.py file.pdf
python pdf-parser.py -s "/JavaScript" file.pdf
```

#### Office隐写

**oletools**:
```bash
pip install oletools
olevba document.docm
```

#### 压缩包隐写

见文件分析工具章节的Binwalk、Foremost

## CTF解题技巧

!!! tip "图片隐写标准流程"
    ```bash
    # 1. 基本信息
    file image.jpg
    exiftool image.jpg
    
    # 2. 查看十六进制
    xxd image.jpg | head
    xxd image.jpg | tail
    
    # 3. 搜索嵌入文件
    binwalk image.jpg
    binwalk -e image.jpg
    
    # 4. 字符串提取
    strings image.jpg | grep -i flag
    
    # 5. LSB分析
    zsteg image.png          # PNG/BMP
    stegsolve image.jpg      # 所有格式
    
    # 6. Steghide检测
    steghide info image.jpg
    stegseek image.jpg rockyou.txt
    
    # 7. 其他工具
    outguess -r image.jpg output.txt
    jsteg reveal image.jpg output.txt
    ```

!!! tip "音频隐写标准流程"
    ```
    1. Audacity打开
       - 查看波形 (摩斯电码、异常波形)
       - 查看声谱图 (隐藏图像、文字)
       - Analyze -> Plot Spectrum (频域分析)
    
    2. 分离声道
       - 左右声道可能不同
       - Tracks -> Mix -> Split Stereo to Mono
    
    3. 特殊编码
       - DTMF (拨号音)
       - 摩斯电码
       - SSTV (慢扫描电视)
    
    4. Steghide
       steghide extract -sf audio.wav
    
    5. 频谱水印
       - 调高频谱图对比度
       - 可能有文字或二维码
    ```

!!! tip "快速判断隐写类型"
    ```
    文件末尾有额外数据 → Binwalk提取
    JPEG/BMP/WAV → Steghide
    PNG/BMP → zsteg
    文件大小异常 → 可能有附加数据
    JPEG → jsteg, outguess, F5
    音频声谱图异常 → Audacity查看
    文本大小异常 → SNOW, Unicode零宽
    ```

!!! tip "Steghide密码来源"
    ```
    1. 题目描述中的关键词
    2. 文件名
    3. 图片中可见文字
    4. 元数据中的信息
    5. 空密码（直接回车）
    6. 常见弱密码：password, 123456, admin
    7. 字典爆破：stegseek + rockyou.txt
    ```

!!! tip "LSB隐写识别"
    ```
    特征：
    - 文件大小正常或略大
    - 肉眼无法察觉
    - 像素最低位被修改
    
    检测：
    - zsteg (PNG/BMP自动化)
    - StegSolve (查看所有位平面)
    - 自定义Python脚本
    
    提取：
    - 可能需要指定通道、顺序、位数
    - RGB vs BGR
    - 横向 vs 纵向
    - 1位 vs 多位
    ```

!!! tip "频域隐写"
    ```
    1. 图片频域
       - 使用Python + FFT
       - 查看频谱图
    
    2. 音频频域
       - Audacity声谱图
       - Sonic Visualiser
       - 可能隐藏文字、图片、二维码
    
    3. 盲水印
       - blind-watermark工具
       - 频域隐藏，时域不可见
    ```

!!! tip "多层嵌套"
    ```
    提取出的数据可能还需要：
    1. Base64解码
    2. 进制转换
    3. 再次隐写提取
    4. 压缩包解压
    5. 二维码识别
    
    保持警惕，多次尝试不同方法
    ```

!!! warning "常见错误"
    ```
    1. 直接使用JPEG处理PNG隐写工具
       - PNG用zsteg
       - JPEG用steghide/jsteg/outguess
    
    2. 修改图片格式后分析
       - 保留原始文件
       - 格式转换会破坏隐写数据
    
    3. 忽略文件末尾数据
       - 用binwalk检查
       - 十六进制查看文件尾
    
    4. 只尝试一种工具
       - 多种工具组合使用
       - 一种失败尝试另一种
    
    5. 忽略密码提示
       - 仔细阅读题目描述
       - 检查元数据、文件名
    ```

!!! tip "工具选择指南"
    ```
    PNG/BMP: zsteg (首选), StegSolve
    JPEG: steghide, stegseek, jsteg, outguess, F5
    音频WAV: steghide, DeepSound, Audacity
    音频分析: Audacity, Sonic Visualiser
    综合分析: StegSolve (图片), Aperi'Solve (在线)
    LSB自定义: Python PIL库
    文本: SNOW, Unicode零宽检测
    二维码: zbarimg, QRazyBox
    ```

!!! tip "自动化工具"
    ```bash
    # Aperi'Solve - 在线自动化
    https://www.aperisolve.com/
    
    # stegpy - Python自动化
    pip install stegpy
    stegpy -i image.png
    
    # 自定义脚本批量尝试
    for tool in zsteg steghide outguess jsteg; do
        echo "Trying $tool..."
        $tool extract image.jpg 2>/dev/null
    done
    ```

## 相关资源

- **StegSolve**: 图片隐写分析必备工具
- **zsteg**: PNG/BMP自动化检测首选
- **Stegseek**: Steghide超快速密码爆破
- **Audacity**: 音频隐写分析标准工具
- **Aperi'Solve**: 在线自动化隐写检测平台
