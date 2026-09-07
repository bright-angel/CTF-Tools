# 综合工具集

CTF比赛中实用的综合工具和资源平台。

## 在线工具

### 多功能平台

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 数据处理瑞士军刀 |
| CTFever工具箱 | [https://ctfever.uniiem.com/](https://ctfever.uniiem.com/) | 综合CTF工具平台 |
| bo_ctfcode | [http://www.1o1o.xyz/bo_ctfcode.html](http://www.1o1o.xyz/bo_ctfcode.html) | CTF编解码工具 |
| SilentEye | [https://achorein.github.io/silenteye/](https://achorein.github.io/silenteye/) | 图片音频隐写 |

### 在线沙箱

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| VirusTotal | [https://www.virustotal.com/](https://www.virustotal.com/) | 多引擎病毒扫描 |
| Any.run | [https://any.run/](https://any.run/) | 交互式恶意软件分析 |
| Hybrid Analysis | [https://www.hybrid-analysis.com/](https://www.hybrid-analysis.com/) | 免费恶意软件分析 |

### 密码破解服务

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| CatPasswd | [https://www.catpasswd.com/](https://www.catpasswd.com/) | ZIP/RAR/Office密码破解 |

## 离线工具

### 综合工具套件

#### CTFCrackTools

**下载链接**:
```
https://github.com/0Chencc/CTFCrackTools
```

**平台**: Windows

**功能**:
- 编码解码 (Base64, URL, HTML, Unicode等)
- 加密解密 (AES, DES, RSA等)
- 哈希计算 (MD5, SHA等)
- 密码爆破
- 图片隐写
- 数据分析

**特点**: 图形化界面，适合新手

#### CaptfEncoder

**下载链接**:
```
https://github.com/guyoung/CaptfEncoder
```

**平台**: Windows/macOS/Linux (Electron)

**功能**:
- 编码/解码 (40+种)
- 加密/解密 (20+种)
- 哈希/HMAC
- 密码学工具
- 网络工具
- 实用工具

**特点**: 现代化界面，跨平台

#### CTF-Knife

**下载链接**:
```
https://github.com/qianxiao996/ctf-knife
```

**功能**: CTF小刀工具集

**特点**:
- 编码转换
- 密码学工具
- Web工具
- Misc工具

#### TomatoTools

**下载链接**:
```
https://github.com/ht0Ruial/TomatoTools
```

**功能**: 番茄工具箱

**特点**: Python编写，持续更新

#### ToolsFx

**下载链接**:
```
https://github.com/Leon406/ToolsFx
```

**平台**: Windows/macOS/Linux (JavaFX)

**功能**:
- 编码解码
- 加密解密
- 文件处理
- 网络工具

#### SRK-Toolbox

**下载链接**:
```
https://github.com/Raka-loah/SRK-Toolbox
```

**功能**: SRK工具箱

### 自动化解密

#### Ciphey

**下载链接**:
```
https://github.com/Ciphey/Ciphey
```

**安装**:
```bash
pip install ciphey
```

**基本使用**:
```bash
# 解密文本
ciphey -t "VGhpcyBpcyBhIHRlc3Q="

# 解密文件
ciphey -f encrypted.txt

# 详细输出
ciphey -t "密文" -v

# 指定语言
ciphey -t "cipher" -l en

# 静默模式（仅输出结果）
ciphey -t "cipher" -q
```

**支持类型**:
- Base64, Base32, Base16
- ROT13, ROT47, Caesar
- URL编码, HTML实体
- 各种加密（如果有密钥）
- 50+种编码/加密

**特点**: AI驱动，自动识别编码类型

#### CyberChef (离线版)

**下载链接**:
```
https://github.com/gchq/CyberChef
```

**运行**:
```bash
# 克隆仓库
git clone https://github.com/gchq/CyberChef.git
cd CyberChef

# 安装依赖
npm install

# 运行
npm run start

# 或直接用发布版
# 下载 CyberChef_v*.zip 解压后打开 CyberChef_v*.html
```

**功能**:
- 200+种操作
- 数据编码/解码
- 加密/解密
- 压缩/解压
- 数据分析
- 数据提取
- 网络工具

**特点**: 配方(Recipe)链式操作

### 图片拼图

#### PuzzleSolver

**下载链接**:
```
https://github.com/JamesHoi/PuzzleSolver
https://github.com/Byxs20/PuzzleSolver
```

**安装使用**:
```bash
# 安装依赖
pip install opencv-python numpy pillow

# 使用
python puzzle_solver.py --input pieces/ --output result.png
```

**功能**:
- 自动拼接图片碎片
- 支持多种拼图算法
- 边缘匹配
- 颜色匹配

#### Gap (Python脚本)

**原理**: 通过图片边缘相似度拼接

```python
from PIL import Image
import os

def solve_puzzle(pieces_dir, rows, cols):
    # 自定义拼图脚本
    pass
```

### 二维码批量处理

#### QrScan

**下载链接**:
```
https://github.com/zfb132/QrScan
```

**安装使用**:
```bash
pip install pyzbar pillow

python qr_scan.py images/
```

**功能**: 批量识别二维码和条形码

#### zbar

**安装**:
```bash
# Ubuntu/Debian
apt install zbar-tools python3-zbar

# macOS
brew install zbar

# Python
pip install pyzbar
```

**使用**:
```bash
# 批量识别
zbarimg *.png

# Python脚本
python -c "from pyzbar.pyzbar import decode; from PIL import Image; print(decode(Image.open('qr.png')))"
```

### 条形码识别

#### zbar

同上，支持多种条形码格式

#### python-barcode

**安装**:
```bash
pip install python-barcode pillow
```

**使用**:
```python
import barcode
from barcode.writer import ImageWriter

# 生成条形码
ean = barcode.get('code128', '1234567890', writer=ImageWriter())
ean.save('barcode')
```

### 特殊工具

#### NPIET (Piet语言解释器)

**下载链接**:
```
https://www.bertnase.de/npiet/
```

**功能**: Piet图形编程语言解释器

**使用**:
```bash
npiet program.png
```

**说明**: Piet是一种将代码隐藏在图片中的编程语言

#### MP3Stego

**下载链接**:
```
https://www.petitcolas.net/steganography/mp3stego/
```

**功能**: MP3音频隐写

**使用**:
```bash
# 解码
decode -X -P password stego.mp3
```

### 航班信息查询

#### FlightAware CLI

**使用在线API**: 
```bash
curl "https://aeroapi.flightaware.com/aeroapi/flights/B7631"
```

**在线查询**:
- https://zh.flightaware.com/
- https://map.variflight.com/

**用途**: OSINT情报收集，追踪航班轨迹

## CTF平台与资源

### 国内CTF平台

| 平台名称 | 链接 | 特点 |
|---------|------|------|
| BugKu | [https://ctf.bugku.com/](https://ctf.bugku.com/) | 题目丰富，工具齐全 |
| 攻防世界 | [https://adworld.xctf.org.cn/](https://adworld.xctf.org.cn/) | XCTF联赛官方平台 |
| i春秋 | [https://www.ichunqiu.com/](https://www.ichunqiu.com/) | 视频教程+实战 |
| 实验吧 | [http://www.shiyanbar.com/](http://www.shiyanbar.com/) | 经典题目 |

### 国际CTF平台

| 平台名称 | 链接 | 特点 |
|---------|------|------|
| HackTheBox | [https://www.hackthebox.com/](https://www.hackthebox.com/) | 渗透测试实战 |
| TryHackMe | [https://tryhackme.com/](https://tryhackme.com/) | 新手友好，路径学习 |
| PicoCTF | [https://picoctf.org/](https://picoctf.org/) | 教育性CTF |
| OverTheWire | [https://overthewire.org/wargames/](https://overthewire.org/wargames/) | Wargames挑战 |

### CTF赛事信息

| 资源名称 | 链接 | 功能 |
|---------|------|------|
| CTFtime | [https://ctftime.org/](https://ctftime.org/) | 比赛日历、排名、WriteUp |

## 学习资源

### 知识库

| 资源名称 | 链接 | 内容 |
|---------|------|------|
| CTF Wiki | [https://ctf-wiki.org/](https://ctf-wiki.org/) | CTF综合知识库 |
| PayloadsAllTheThings | [https://github.com/swisskyrepo/PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings) | 各种攻击Payload集合 |
| HackTricks | [https://book.hacktricks.xyz/](https://book.hacktricks.xyz/) | 渗透测试技巧 |

### 工具集合

| 资源名称 | 链接 | 内容 |
|---------|------|------|
| CTF-Tools | [https://github.com/zardus/ctf-tools](https://github.com/zardus/ctf-tools) | CTF工具安装脚本集合 |
| SecLists | [https://github.com/danielmiessler/SecLists](https://github.com/danielmiessler/SecLists) | 字典和Payload集合 |

## CTF解题技巧

!!! tip "综合工具使用策略"
    ```
    1. 快速识别阶段
       - CyberChef: 快速测试各种编码
       - Ciphey: 自动识别并解密
       - 在线工具: 快速验证想法
    
    2. 深入分析阶段
       - 专用工具: 针对特定问题
       - 离线工具: 深度分析
       - 自定义脚本: 特殊情况
    
    3. 批量处理阶段
       - Python脚本: 自动化处理
       - 命令行工具: 管道组合
    ```

!!! tip "工具选择优先级"
    ```
    第一层: 自动化工具
    - Ciphey (自动解密)
    - Aperi'Solve (图片隐写)
    - CyberChef (数据转换)
    
    第二层: 综合工具集
    - CTFCrackTools (Windows GUI)
    - CaptfEncoder (跨平台)
    
    第三层: 专用工具
    - 根据题目类型选择对应章节工具
    ```

!!! tip "快速尝试流程"
    ```bash
    # 1. 文件识别
    file unknown
    
    # 2. 字符串提取
    strings unknown | grep -i flag
    
    # 3. 自动解密
    ciphey -f unknown
    
    # 4. 嵌入文件检测
    binwalk unknown
    
    # 5. 十六进制查看
    xxd unknown | head
    xxd unknown | tail
    
    # 6. 专用工具分析
    ```

!!! tip "CyberChef常用配方"
    ```
    Base64系列:
    - From Base64 → From Base64 (多层)
    - From Base64 → Gunzip (压缩后编码)
    
    取证分析:
    - Extract Files (自动提取文件)
    - Entropy (检测加密/压缩)
    - Strings (提取字符串)
    
    图片分析:
    - Render Image
    - Extract EXIF
    
    数据转换:
    - From Hex → To Base64
    - XOR (已知key)
    ```

!!! tip "Ciphey使用场景"
    ```
    适用:
    - 未知编码类型
    - 多层嵌套编码
    - 常见加密算法
    - 快速试探
    
    不适用:
    - 自定义算法
    - 需要密钥的强加密
    - 复杂混淆
    - 特殊格式数据
    ```

!!! tip "建立个人工具库"
    ```
    1. 常用脚本
       - base64多层解码
       - ROT暴力破解
       - XOR爆破
       - CRC32爆破
    
    2. 在线工具书签
       - 按类别整理
       - 标注使用场景
       - 定期更新
    
    3. Docker镜像
       - CTF工具集镜像
       - 一键启动环境
    
    4. 虚拟机
       - Kali Linux
       - 预装常用工具
    ```

!!! warning "工具使用注意事项"
    ```
    1. 理解原理
       - 不要盲目使用工具
       - 了解工具做了什么
       - 验证工具结果
    
    2. 版本兼容性
       - 某些工具对Python版本有要求
       - 注意依赖库版本
       - 虚拟环境隔离
    
    3. 不要完全依赖自动化
       - 自动化工具可能失败
       - 需要手动分析能力
       - 结合多种方法
    
    4. 工具更新
       - 定期更新工具
       - 关注新工具发布
       - 测试工具可用性
    ```

!!! tip "高效工作流"
    ```
    1. 题目信息收集
       - 题目描述
       - 文件类型
       - 文件大小
       - 给出的提示
    
    2. 初步分析
       - file命令识别
       - strings提取字符串
       - binwalk检测嵌入
       - exiftool查元数据
    
    3. 自动化尝试
       - Ciphey自动解密
       - zsteg图片快速检测
       - stegseek steghide爆破
    
    4. 深入分析
       - 使用专用工具
       - 手动分析
       - 编写脚本
    
    5. 验证结果
       - 检查flag格式
       - 提交验证
    ```

!!! tip "多工具组合"
    ```bash
    # 提取+解码
    steghide extract -sf image.jpg | base64 -d
    
    # binwalk提取后批量分析
    binwalk -e firmware.bin && cd _firmware.bin.extracted && for f in *; do file $f; done
    
    # strings + grep + Ciphey
    strings file.bin | grep -E "^[A-Za-z0-9+/]{20,}={0,2}$" | head -1 | ciphey
    
    # 批量二维码识别
    for img in *.png; do echo "$img:"; zbarimg "$img"; done
    ```

!!! tip "调试技巧"
    ```
    工具失败时:
    1. 检查文件格式是否正确
    2. 尝试修复文件头
    3. 使用其他同类工具
    4. 查看工具文档和issue
    5. 降级或升级工具版本
    6. 手动实现算法
    ```

## 相关资源

- **CyberChef**: 数据处理瑞士军刀，必备在线工具
- **Ciphey**: AI驱动自动解密工具
- **CTFCrackTools**: 新手友好的Windows工具集
- **CTF Wiki**: 最全面的中文CTF知识库
- **CTFtime**: CTF赛事信息和WriteUp集合
