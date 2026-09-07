# 趣味编码与隐写

CTF中的趣味编码和特殊隐写技巧。

## 零宽隐写

### 零宽字符隐写
**在线工具**:
- [330k Unicode Steganography](https://330k.github.io/misc_tools/unicode_steganography.html)
- [Yuanfux Zero-Width](https://yuanfux.github.io/zero-width-web/)
- [郭飞文本水印](https://www.guofei.site/pictures_for_blog/app/text_watermark/v1.html)
- [MZY零宽1](https://www.mzy0.com/ctftools/zerowidth1/)
- [MZY零宽2](https://www.mzy0.com/ctftools/zerowidth2/)
- [QQ秀资零宽隐写](https://www.qqxiuzi.cn/bianma/yincangjiami.php)

**GitHub项目**:
- [yuanfux/zero-width-lib](https://github.com/yuanfux/zero-width-lib)

**原理**: 使用零宽字符（不可见字符）隐藏信息

**常见零宽字符**:
- `U+200B` - 零宽空格 (ZERO WIDTH SPACE)
- `U+200C` - 零宽非连接符 (ZERO WIDTH NON-JOINER)
- `U+200D` - 零宽连接符 (ZERO WIDTH JOINER)
- `U+FEFF` - 零宽非断空格 (ZERO WIDTH NO-BREAK SPACE)

**检测方法**:
```python
text = "看起来正常的文本"
# 检查是否包含零宽字符
zero_width = ['​', '‌', '‍', '﻿']
for char in text:
    if char in zero_width:
        print(f"发现零宽字符: U+{ord(char):04X}")
```

## 编程语言编码

### Brainfuck & Ook!
**在线工具**:
- [C5R Brainfuck](https://c5r.app/tools/brain-fuck)
- [Hi编码](http://www.hiencode.com/brain.html)
- [CTFever](https://ctfever.uniiem.com/tools/brain-fuck)
- [BugKu](https://ctf.bugku.com/tool/brainfuck)
- [Tool BugKu](https://tool.bugku.com/brainfuck/)
- [CacheSleuth](https://www.cachesleuth.com/bfook.html)
- [SplitBrain Ook!](https://www.splitbrain.org/services/ook)

**Brainfuck颜文字**:
- [Esolangs Wiki](https://esolangs.org/wiki/(_%CD%A1%C2%B0_%CD%9C%CA%96_%CD%A1%C2%B0)fuck)

**原理**: 极简编程语言，只用8个字符

**Brainfuck字符集**: `+ - > < [ ] . ,`

**Ook!字符集**: `Ook. Ook? Ook!`

### JSFuck
**在线工具**:
- [Hi编码](http://www.hiencode.com/jsfuck.html)
- [CoderTab](http://codertab.com/JsUnFuck)
- [利民吧](http://www.liminba.com/tool/jsfuckdecode/)
- [C5R](https://c5r.app/tools/jsfuck)
- [CTFever](https://ctfever.uniiem.com/tools/jsfuck)
- [BugKu](https://www.bugku.com/tools/jsfuck/)

**原理**: 只用6个字符编写JavaScript代码

**字符集**: `[ ] ( ) + !`

### JJencode
**在线工具**:
- [Hi编码](http://www.hiencode.com/jjencode.html)

**原理**: JavaScript颜文字编码

### AAencode
**在线工具**:
- [UTF-8.jp](http://utf-8.jp/public/aaencode.html)
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=703)
- [Hi编码](http://www.hiencode.com/aaencode.html)

**原理**: JavaScript颜文字编码

### PPencode
**在线工具**:
- [Hi编码](http://www.hiencode.com/ppencode.html)

**原理**: Perl语言的颜文字编码

### Malbolge
**在线工具**:
- [Malbolge Tools](https://zb3.me/malbolge-tools/)

**原理**: 最难的编程语言之一

### Logo编程
**在线工具**:
- [JSLogo](https://www.calormen.com/jslogo/)

**原理**: 海龟绘图语言

## 特殊编码

### Tupper自指公式
**在线工具**:
- [Tupper's Formula](https://tuppers-formula.ovh/)

**原理**: 数学公式可以绘制自己

### DNA序列编码
**在线工具**:
- [DNA-mRNA-Protein Converter](https://skaminsky115.github.io/nac/DNA-mRNA-Protein_Converter.html)

**原理**: 使用DNA碱基对(ATCG)编码

**对应关系**:
```
A - Adenine (腺嘌呤)
T - Thymine (胸腺嘧啶)
C - Cytosine (胞嘧啶)
G - Guanine (鸟嘌呤)
```

### 图像编码
**链接**: [http://www.fzwjscj.xyz/index.php/archives/23/](http://www.fzwjscj.xyz/index.php/archives/23/)

**功能**: 使用图片元素编码信息

### BubbleBabble
**在线工具**:
- [Hi编码](http://www.hiencode.com/bubble.html)

**原理**: 二进制数据转可读字符串

### Handycode
**在线工具**:
- [Hi编码](http://www.hiencode.com/handycode.html)

**原理**: 手机键盘编码

## SoJSON混淆

### SoJSON v4
**在线工具**:
- [BugKu](https://ctf.bugku.com/tool/sojson4)

**功能**: SoJSON v4混淆解密

### SoJSON v5 (jsjiami.com.v5)
**在线工具**:
- [BugKu](https://ctf.bugku.com/tool/sojson5)

**功能**: SoJSON v5混淆解密

## Emoji编码

### Emoji-AES
**在线工具**:
- [Emoji-AES](https://aghorler.github.io/emoji-aes/)

**GitHub项目**:
- [aghorler/emoji-aes](https://github.com/aghorler/emoji-aes)
- [Mumuzi7179/emoji_aes_burst](https://github.com/Mumuzi7179/emoji_aes_burst) - 爆破工具

**原理**: 使用Emoji表情作为AES密钥

## 文本隐写

### 文本盲水印
**GitHub项目**:
- [guofei9987/text_blind_watermark](https://github.com/guofei9987/text_blind_watermark)

**功能**: 在文本中嵌入不可见水印

### SNOW隐写
**链接**: [https://darkside.com.au/snow](https://darkside.com.au/snow)

**功能**: 在文本文件空白处隐藏信息

**原理**: 使用空格和制表符编码

**用法**:
```bash
# 隐藏
snow -C -m "secret" -p "password" input.txt output.txt

# 提取
snow -C -p "password" output.txt
```

### 空白字符隐写
**原理**: 使用不同的空白字符编码

**工具**: 使用零宽字符工具

## 程序代码隐写

### Ideone
**链接**: [https://ideone.com/](https://ideone.com/)

**功能**: 在线代码运行，支持空白隐藏

## Cisco密码

### Cisco密码解密
**在线工具**:
- [IFM Password Cracker](https://www.ifm.net.nz/cookbooks/passwordcracker.html)

**功能**: 解密Cisco Type 7密码

### Type7密码
**在线工具**:
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=992)

**功能**: Cisco Type 7密码加解密

## 国密算法

### SM2/SM3/SM4
**GitHub项目**:
- [JuneAndGreen/sm-crypto](https://github.com/JuneAndGreen/sm-crypto) - JavaScript实现
- [ZZMarquis/gmhelper](https://github.com/ZZMarquis/gmhelper) - Java实现
- [milu001/sm234_decrypt_gui](https://github.com/milu001/sm234_decrypt_gui) - GUI工具

**功能**: 中国商用密码算法

**包含**:
- SM2: 椭圆曲线公钥密码算法
- SM3: 哈希算法
- SM4: 分组密码算法

## 其他工具

### Enigma密码机
**在线工具**:
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=993)

**功能**: 模拟二战德国Enigma密码机

### CrypTool
**下载**: [https://www.cryptool.org/en/ct2/downloads/](https://www.cryptool.org/en/ct2/downloads/)

**功能**: 密码学学习软件

**特点**:
- 图形化界面
- 包含大量算法
- 教学友好

## CTF解题技巧

!!! tip "识别特殊编码"
    1. **看字符集**: 
       - 只有`[]()!+` → JSFuck
       - 只有`><+-.,[]` → Brainfuck
       - 颜文字 → AAencode/JJencode
       - Emoji → Emoji-AES
    2. **看格式**:
       - 佛经文字 → 与佛论禅
       - 核心价值观 → 社会主义编码
       - DNA碱基 → DNA编码
    3. **隐藏信息**:
       - 复制文本到文本编辑器查看长度
       - 检查零宽字符
       - 使用十六进制查看器

!!! tip "提取隐藏信息"
    1. 使用在线零宽检测工具
    2. Python处理文本
    3. 十六进制编辑器查看
    4. strings命令提取

!!! warning "注意事项"
    - 某些编码需要特定环境运行
    - 注意字符编码问题(UTF-8)
    - 零宽字符复制粘贴可能丢失
    - 建议保存原始文件
