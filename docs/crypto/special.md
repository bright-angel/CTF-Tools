# 趣味编码与隐写工具

CTF中的趣味编码和特殊隐写技巧。

## 在线工具

### 零宽字符隐写

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| 330k Unicode | [https://330k.github.io/misc_tools/unicode_steganography.html](https://330k.github.io/misc_tools/unicode_steganography.html) | Unicode隐写 |
| Yuanfux Zero-Width | [https://yuanfux.github.io/zero-width-web/](https://yuanfux.github.io/zero-width-web/) | 零宽隐写 |
| 郭飞文本水印 | [https://www.guofei.site/pictures_for_blog/app/text_watermark/v1.html](https://www.guofei.site/pictures_for_blog/app/text_watermark/v1.html) | 文本水印 |
| MZY零宽1 | [https://www.mzy0.com/ctftools/zerowidth1/](https://www.mzy0.com/ctftools/zerowidth1/) | 零宽工具1 |
| MZY零宽2 | [https://www.mzy0.com/ctftools/zerowidth2/](https://www.mzy0.com/ctftools/zerowidth2/) | 零宽工具2 |
| QQ秀资 | [https://www.qqxiuzi.cn/bianma/yincangjiami.php](https://www.qqxiuzi.cn/bianma/yincangjiami.php) | 隐藏加密 |

**原理**: 使用零宽字符（不可见字符）隐藏信息

**常见零宽字符**:
- `U+200B` - 零宽空格 (ZERO WIDTH SPACE)
- `U+200C` - 零宽非连接符 (ZERO WIDTH NON-JOINER)
- `U+200D` - 零宽连接符 (ZERO WIDTH JOINER)
- `U+FEFF` - 零宽非断空格 (ZERO WIDTH NO-BREAK SPACE)

### 编程语言编码

#### Brainfuck & Ook!

| 工具名称 | 链接 | 支持语言 |
|---------|------|----------|
| C5R | [https://c5r.app/tools/brain-fuck](https://c5r.app/tools/brain-fuck) | Brainfuck |
| Hi编码 | [http://www.hiencode.com/brain.html](http://www.hiencode.com/brain.html) | Brainfuck |
| CTFever | [https://ctfever.uniiem.com/tools/brain-fuck](https://ctfever.uniiem.com/tools/brain-fuck) | Brainfuck |
| BugKu | [https://ctf.bugku.com/tool/brainfuck](https://ctf.bugku.com/tool/brainfuck) | Brainfuck |
| CacheSleuth | [https://www.cachesleuth.com/bfook.html](https://www.cachesleuth.com/bfook.html) | Brainfuck/Ook! |
| SplitBrain | [https://www.splitbrain.org/services/ook](https://www.splitbrain.org/services/ook) | Ook! |

**Brainfuck字符集**: `+ - > < [ ] . ,`  
**Ook!字符集**: `Ook. Ook? Ook!`

#### JSFuck

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/jsfuck.html](http://www.hiencode.com/jsfuck.html) | 加解密 |
| CoderTab | [http://codertab.com/JsUnFuck](http://codertab.com/JsUnFuck) | 解密 |
| 利民吧 | [http://www.liminba.com/tool/jsfuckdecode/](http://www.liminba.com/tool/jsfuckdecode/) | 解密 |
| C5R | [https://c5r.app/tools/jsfuck](https://c5r.app/tools/jsfuck) | 全功能 |
| CTFever | [https://ctfever.uniiem.com/tools/jsfuck](https://ctfever.uniiem.com/tools/jsfuck) | 现代界面 |
| BugKu | [https://www.bugku.com/tools/jsfuck/](https://www.bugku.com/tools/jsfuck/) | CTF专用 |

**字符集**: `[ ] ( ) + !`

#### 其他JS编码

| 编码类型 | 在线工具 | 特点 |
|---------|---------|------|
| JJencode | [Hi编码](http://www.hiencode.com/jjencode.html) | JS颜文字 |
| AAencode | [Hi编码](http://www.hiencode.com/aaencode.html) | JS颜文字 |
| AAencode | [UTF-8.jp](http://utf-8.jp/public/aaencode.html) | 官方工具 |
| PPencode | [Hi编码](http://www.hiencode.com/ppencode.html) | Perl颜文字 |

#### 其他编程语言

| 语言 | 在线工具 | 说明 |
|------|---------|------|
| Malbolge | [Malbolge Tools](https://zb3.me/malbolge-tools/) | 最难的编程语言 |
| Logo | [JSLogo](https://www.calormen.com/jslogo/) | 海龟绘图 |

### SoJSON混淆

| 版本 | 在线工具 | 说明 |
|------|---------|------|
| SoJSON v4 | [BugKu](https://ctf.bugku.com/tool/sojson4) | v4解密 |
| SoJSON v5 | [BugKu](https://ctf.bugku.com/tool/sojson5) | v5解密(jsjiami.com.v5) |

### 特殊编码

| 编码类型 | 在线工具 | 说明 |
|---------|---------|------|
| Tupper公式 | [Tupper's Formula](https://tuppers-formula.ovh/) | 数学自指公式 |
| DNA序列 | [DNA Converter](https://skaminsky115.github.io/nac/DNA-mRNA-Protein_Converter.html) | ATCG编码 |
| BubbleBabble | [Hi编码](http://www.hiencode.com/bubble.html) | 二进制转可读 |
| Handycode | [Hi编码](http://www.hiencode.com/handycode.html) | 手机键盘编码 |
| Emoji-AES | [Emoji-AES](https://aghorler.github.io/emoji-aes/) | Emoji密钥加密 |

### Cisco密码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| IFM Cracker | [https://www.ifm.net.nz/cookbooks/passwordcracker.html](https://www.ifm.net.nz/cookbooks/passwordcracker.html) | Cisco密码解密 |
| Type7工具 | [Atoolbox](http://www.atoolbox.net/Tool.php?Id=992) | Type 7加解密 |

### 其他工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Enigma密码机 | [Atoolbox](http://www.atoolbox.net/Tool.php?Id=993) | 模拟Enigma |
| 图像编码 | [http://www.fzwjscj.xyz/index.php/archives/23/](http://www.fzwjscj.xyz/index.php/archives/23/) | 图片编码 |

## 离线工具

### Python零宽字符处理

**检测零宽字符**:
```python
def detect_zero_width(text):
    """检测文本中的零宽字符"""
    zero_width_chars = {
        '​': 'ZERO WIDTH SPACE',
        '‌': 'ZERO WIDTH NON-JOINER',
        '‍': 'ZERO WIDTH JOINER',
        '﻿': 'ZERO WIDTH NO-BREAK SPACE',
        '⁠': 'WORD JOINER',
        '᠎': 'MONGOLIAN VOWEL SEPARATOR'
    }
    
    found = []
    for i, char in enumerate(text):
        if char in zero_width_chars:
            found.append({
                'position': i,
                'char': char,
                'unicode': f'U+{ord(char):04X}',
                'name': zero_width_chars[char]
            })
    
    return found

# 使用
text = "正常文本​​隐藏内容"  # 包含零宽字符
results = detect_zero_width(text)
for r in results:
    print(f"位置 {r['position']}: {r['unicode']} ({r['name']})")
```

**零宽字符编码/解码**:
```python
def encode_zero_width(message):
    """使用零宽字符编码二进制消息"""
    binary = ''.join(format(ord(c), '08b') for c in message)
    
    # 用零宽字符表示0和1
    zero = '​'  # 0
    one = '‌'   # 1
    
    encoded = ''.join(zero if bit == '0' else one for bit in binary)
    return encoded

def decode_zero_width(encoded):
    """解码零宽字符消息"""
    zero = '​'
    one = '‌'
    
    # 转为二进制
    binary = ''.join('0' if c == zero else '1' for c in encoded if c in [zero, one])
    
    # 二进制转文本
    message = ''
    for i in range(0, len(binary), 8):
        byte = binary[i:i+8]
        if len(byte) == 8:
            message += chr(int(byte, 2))
    
    return message

# 使用
secret = "flag{test}"
encoded = encode_zero_width(secret)
print(f"编码长度: {len(encoded)} 字符")

# 隐藏在正常文本中
cover_text = "这是正常文本"
hidden_text = cover_text + encoded
print(f"表面文本: {cover_text}")
print(f"实际长度: {len(hidden_text)}")

# 解码
decoded = decode_zero_width(hidden_text)
print(f"解码: {decoded}")
```

### SNOW隐写工具

**下载链接**:
```
https://darkside.com.au/snow/snow-20130616.tar.gz
```

**安装**:
```bash
# Linux/macOS
wget https://darkside.com.au/snow/snow-20130616.tar.gz
tar -xzf snow-20130616.tar.gz
cd snow-20130616
make

# 或直接从包管理器安装
apt install snow  # Debian/Ubuntu
brew install snow  # macOS
```

**基本使用**:
```bash
# 隐藏信息
snow -C -m "secret message" -p "password" input.txt output.txt

# 提取信息
snow -C -p "password" output.txt

# 不使用压缩
snow -m "secret" input.txt output.txt

# 从文件读取秘密消息
snow -C -f secret.txt -p "password" input.txt output.txt

# 统计信息
snow -S -p "password" output.txt
```

**Python实现（简化版）**:
```python
def snow_encode(cover_text, message):
    """简化的SNOW编码：使用空格和制表符"""
    # 转为二进制
    binary = ''.join(format(ord(c), '08b') for c in message)
    binary += '00000000'  # 结束标记
    
    lines = cover_text.split('\n')
    encoded_lines = []
    bit_index = 0
    
    for line in lines:
        if bit_index >= len(binary):
            encoded_lines.append(line)
            continue
        
        # 在行尾添加空格/制表符（0=空格，1=制表符）
        suffix = ''
        for _ in range(min(8, len(binary) - bit_index)):
            if binary[bit_index] == '0':
                suffix += ' '
            else:
                suffix += '\t'
            bit_index += 1
        
        encoded_lines.append(line + suffix)
    
    return '\n'.join(encoded_lines)

def snow_decode(text):
    """解码SNOW隐写"""
    lines = text.split('\n')
    binary = ''
    
    for line in lines:
        # 提取行尾的空白字符
        trailing = len(line) - len(line.rstrip(' \t'))
        if trailing > 0:
            for char in line[-trailing:]:
                binary += '0' if char == ' ' else '1'
    
    # 二进制转文本
    message = ''
    for i in range(0, len(binary), 8):
        byte = binary[i:i+8]
        if len(byte) == 8:
            char_code = int(byte, 2)
            if char_code == 0:  # 结束标记
                break
            message += chr(char_code)
    
    return message
```

### Brainfuck解释器

**Python实现**:
```python
def brainfuck_interpret(code, input_data=''):
    """Brainfuck解释器"""
    code = ''.join(c for c in code if c in '><+-.,[]')
    
    memory = [0] * 30000
    pointer = 0
    code_pointer = 0
    output = []
    input_pointer = 0
    
    # 预处理循环跳转表
    brackets = {}
    stack = []
    for i, c in enumerate(code):
        if c == '[':
            stack.append(i)
        elif c == ']':
            if stack:
                start = stack.pop()
                brackets[start] = i
                brackets[i] = start
    
    while code_pointer < len(code):
        cmd = code[code_pointer]
        
        if cmd == '>':
            pointer += 1
        elif cmd == '<':
            pointer -= 1
        elif cmd == '+':
            memory[pointer] = (memory[pointer] + 1) % 256
        elif cmd == '-':
            memory[pointer] = (memory[pointer] - 1) % 256
        elif cmd == '.':
            output.append(chr(memory[pointer]))
        elif cmd == ',':
            if input_pointer < len(input_data):
                memory[pointer] = ord(input_data[input_pointer])
                input_pointer += 1
            else:
                memory[pointer] = 0
        elif cmd == '[':
            if memory[pointer] == 0:
                code_pointer = brackets[code_pointer]
        elif cmd == ']':
            if memory[pointer] != 0:
                code_pointer = brackets[code_pointer]
        
        code_pointer += 1
    
    return ''.join(output)

# 使用
bf_code = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
result = brainfuck_interpret(bf_code)
print(f"输出: {result}")  # Hello World!
```

### 国密算法（SM2/SM3/SM4）

**下载链接**:
```
# JavaScript实现
https://github.com/JuneAndGreen/sm-crypto

# Java实现
https://github.com/ZZMarquis/gmhelper

# GUI工具
https://github.com/milu001/sm234_decrypt_gui
```

**安装使用（Python）**:
```bash
pip install gmssl
```

**Python示例**:
```python
from gmssl import sm2, sm3, sm4, func

# SM3哈希
data = b"Hello World"
hash_value = sm3.sm3_hash(func.bytes_to_list(data))
print(f"SM3: {hash_value}")

# SM4对称加密
sm4_key = b'0123456789abcdef'  # 16字节密钥
sm4_cipher = sm4.CryptSM4()
sm4_cipher.set_key(sm4_key, sm4.SM4_ENCRYPT)

plaintext = b'Hello World!'
# Padding到16字节倍数
padded = plaintext + b'\x00' * (16 - len(plaintext) % 16)
ciphertext = sm4_cipher.crypt_ecb(func.bytes_to_list(padded))
print(f"SM4加密: {bytes(ciphertext).hex()}")

# SM4解密
sm4_cipher.set_key(sm4_key, sm4.SM4_DECRYPT)
decrypted = bytes(sm4_cipher.crypt_ecb(ciphertext))
print(f"SM4解密: {decrypted.rstrip(b'\x00')}")

# SM2非对称加密（需要生成密钥对）
# 注意：完整的SM2实现较复杂，这里展示基本用法
```

### CrypTool

**下载链接**:
```
https://www.cryptool.org/en/ct2/downloads/
```

**功能**: 密码学学习软件

**特点**:
- 图形化界面
- 包含200+种算法
- 频率分析工具
- 密码破解演示
- 教学友好

### Emoji-AES爆破工具

**下载链接**:
```
https://github.com/Mumuzi7179/emoji_aes_burst
```

**安装使用**:
```bash
git clone https://github.com/Mumuzi7179/emoji_aes_burst.git
cd emoji_aes_burst
pip install -r requirements.txt

# 爆破
python emoji_aes_burst.py -c "密文" -w wordlist.txt
```

### 文本盲水印

**下载链接**:
```
https://github.com/guofei9987/text_blind_watermark
```

**安装**:
```bash
pip install text_blind_watermark
```

**使用**:
```python
from text_blind_watermark import TextBlindWatermark

# 嵌入水印
watermark = "secret"
text = "这是原始文本内容"
watermarked = TextBlindWatermark().embed(text, watermark)
print(f"加水印后: {watermarked}")

# 提取水印
extracted = TextBlindWatermark().extract(watermarked)
print(f"提取水印: {extracted}")
```

### 零宽字符工具库

**下载链接**:
```
https://github.com/yuanfux/zero-width-lib
```

**安装**:
```bash
npm install zero-width-lib
```

**使用**:
```javascript
const zeroWidth = require('zero-width-lib');

// 编码
const encoded = zeroWidth.encode('secret message');
const hidden = 'Normal text' + encoded;

// 解码
const decoded = zeroWidth.decode(hidden);
console.log(decoded);  // 'secret message'
```

## 识别技巧

### 字符特征

| 编码类型 | 字符特征 | 示例 |
|---------|---------|------|
| Brainfuck | `><+-.,[]` | `+++++[>++<-]>.` |
| Ook! | `Ook. Ook? Ook!` | `Ook. Ook. Ook.` |
| JSFuck | `[]()!+` | `[][(![]+[])[+[]]]` |
| AAencode | 颜文字 | `(ﾟДﾟ) [ﾟΘﾟ]` |
| DNA | ATCG | `ATCGATCG` |
| 零宽字符 | 看不见但存在 | 复制后长度不对 |

### 检测流程

```
1. 文本长度异常
   └─ 复制后长度 > 显示长度 → 可能有零宽字符

2. 纯字符集识别
   ├─ 只有[]()!+ → JSFuck
   ├─ 只有><+-.,[] → Brainfuck
   ├─ Ook重复 → Ook!
   └─ 颜文字 → AAencode/JJencode

3. 特殊格式
   ├─ ATCG碱基 → DNA编码
   ├─ 全是Emoji → Emoji-AES
   └─ 看起来正常但有蹊跷 → 隐写术

4. 使用工具批量尝试
```

## CTF解题技巧

!!! tip "识别特殊编码"
    **看字符集**:
    - 只有`[]()!+` → JSFuck
    - 只有`><+-.,[]` → Brainfuck
    - 只有`Ook` → Ook!
    - 颜文字 → AAencode/JJencode/PPencode
    - 只有Emoji → Emoji-AES
    - 只有ATCG → DNA编码
    
    **看格式**:
    - 佛经文字 → 与佛论禅
    - 核心价值观 → 社会主义编码
    - 文本长度异常 → 零宽字符隐写

!!! tip "提取隐藏信息"
    ```python
    # 1. 检查文本长度
    visible_len = len(text.strip())
    actual_len = len(text)
    if actual_len > visible_len:
        print("可能有隐藏字符")
    
    # 2. 十六进制查看
    print(text.encode('utf-8').hex())
    
    # 3. 逐字符检查Unicode
    for i, char in enumerate(text):
        code = ord(char)
        if code in [0x200B, 0x200C, 0x200D, 0xFEFF]:
            print(f"位置{i}: 零宽字符 U+{code:04X}")
    
    # 4. 使用工具
    # - 在线零宽检测工具
    # - SNOW工具提取空白隐写
    # - strings命令查看可打印字符
    ```

!!! tip "Brainfuck/Ook!解题"
    ```python
    # 直接使用在线工具
    # 或本地解释器
    import sys
    
    # 清理代码（只保留有效字符）
    bf_code = ''.join(c for c in code if c in '><+-.,[]')
    
    # 运行解释器
    result = brainfuck_interpret(bf_code)
    ```

!!! tip "JSFuck解题"
    ```javascript
    // 方法1：直接eval（不推荐，有安全风险）
    eval(jsfuck_code)
    
    // 方法2：使用在线工具解密
    // 方法3：手动分析（困难）
    ```

!!! warning "注意事项"
    - **零宽字符**: 复制粘贴可能丢失，保存原始文件
    - **字符编码**: 确保使用UTF-8
    - **Brainfuck超时**: 死循环检测
    - **JSFuck运行**: 可能执行恶意代码，沙箱运行
    - **SNOW隐写**: 必须保留原始空白字符
    - **国密算法**: 密钥格式和填充方式

!!! tip "工具组合"
    ```bash
    # 1. 检查零宽字符
    cat file.txt | od -c | grep -E '200[bcd]|feff'
    
    # 2. SNOW提取
    snow -C -p "password" file.txt
    
    # 3. 字符串提取
    strings file.bin
    
    # 4. Python综合检测
    python -c "
    import sys
    text = open('file.txt', 'r', encoding='utf-8').read()
    # 零宽检测
    for c in text:
        if ord(c) in [0x200B, 0x200C, 0x200D, 0xFEFF]:
            print(f'Zero-width: U+{ord(c):04X}')
    "
    ```

## 相关资源

- **零宽字符**: 多个在线工具可检测和解码
- **Brainfuck**: 使用在线解释器或本地Python实现
- **SNOW**: 空白字符隐写的经典工具
- **国密算法**: gmssl Python库提供完整实现
- **CrypTool**: 教学用密码学软件，图形界面友好
