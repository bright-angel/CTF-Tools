# 其他编码工具

除Base系列和URL编码外的其他常见编码格式。

## 在线工具

### 摩尔斯电码

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Morsecode World | [https://morsecode.world/international/translator.html](https://morsecode.world/international/translator.html) | 国际标准，支持音频 |
| Hi编码 | [http://www.hiencode.com/morse.html](http://www.hiencode.com/morse.html) | 中文友好 |
| CTFever | [https://ctfever.uniiem.com/tools/morse-code](https://ctfever.uniiem.com/tools/morse-code) | CTF专用 |
| C5R | [https://c5r.app/tools/morse-code](https://c5r.app/tools/morse-code) | 简洁实用 |

### ASCII编码

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/cencode.html](http://www.hiencode.com/cencode.html) | ASCII转换 |
| RapidTables | [https://www.rapidtables.org/zh-CN/convert/number/hex-to-ascii.html](https://www.rapidtables.org/zh-CN/convert/number/hex-to-ascii.html) | 十六进制转ASCII |

### 十六进制编码

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 Hex | [http://www.hiencode.com/hex.html](http://www.hiencode.com/hex.html) | 十六进制编解码 |
| 在线转换 | [https://the-x.cn/encodings/Hex.aspx](https://the-x.cn/encodings/Hex.aspx) | 十六进制转字符 |
| ConvertString | [https://www.convertstring.com/](https://www.convertstring.com/) | 多种格式转换 |

### Unicode编码

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Unicode转换 | [https://www.branah.com/unicode-converter](https://www.branah.com/unicode-converter) | Unicode与文本互转 |

### HTML实体编码

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| HTML Entity Encoder | [https://mothereff.in/html-entities](https://mothereff.in/html-entities) | HTML实体编解码 |
| ConvertString | [https://www.convertstring.com/zh_CN/EncodeDecode/HtmlDecode](https://www.convertstring.com/zh_CN/EncodeDecode/HtmlDecode) | 支持中文 |

### UUencode

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 UU | [http://www.hiencode.com/uu.html](http://www.hiencode.com/uu.html) | UU编码 |
| BugKu | [https://ctf.bugku.com/tool/uuencode](https://ctf.bugku.com/tool/uuencode) | CTF专用 |
| 茶凑 | [http://web.chacuo.net/charsetuuencode](http://web.chacuo.net/charsetuuencode) | 在线转换 |

### XXencode

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 XX | [http://www.hiencode.com/xxencode.html](http://www.hiencode.com/xxencode.html) | XX编码 |
| BugKu | [https://ctf.bugku.com/tool/xxencode](https://ctf.bugku.com/tool/xxencode) | CTF专用 |
| 茶凑 | [http://web.chacuo.net/charsetxxencode](http://web.chacuo.net/charsetxxencode) | 在线转换 |

### Quoted-Printable

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/quoted.html](http://www.hiencode.com/quoted.html) | QP编码 |
| 茶凑 | [http://web.chacuo.net/charsetquotedprintable/](http://web.chacuo.net/charsetquotedprintable/) | 邮件编码 |

### Punycode

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/punycode.html](http://www.hiencode.com/punycode.html) | 国际化域名 |
| Punycoder | [https://www.punycoder.com/](https://www.punycoder.com/) | 域名转换 |

### 综合编码工具

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Dencode | [https://dencode.com/](https://dencode.com/) | 一次显示多种编码 |
| Hi编码 | [http://www.hiencode.com/](http://www.hiencode.com/) | 50+种编码工具 |

## 离线工具

### Python编码处理

**安装**: Python内置

**摩尔斯电码**:
```python
MORSE_CODE = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.',
    'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
    'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---',
    'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
    'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--',
    'Z': '--..', '0': '-----', '1': '.----', '2': '..---',
    '3': '...--', '4': '....-', '5': '.....', '6': '-....',
    '7': '--...', '8': '---..', '9': '----.'
}

def text_to_morse(text):
    """文本转摩尔斯电码"""
    morse = []
    for char in text.upper():
        if char in MORSE_CODE:
            morse.append(MORSE_CODE[char])
        elif char == ' ':
            morse.append('/')
    return ' '.join(morse)

def morse_to_text(morse):
    """摩尔斯电码转文本"""
    morse_dict = {v: k for k, v in MORSE_CODE.items()}
    words = morse.split(' / ')
    result = []
    for word in words:
        chars = word.split(' ')
        result.append(''.join(morse_dict.get(c, '') for c in chars))
    return ' '.join(result)

# 使用
print(text_to_morse("SOS"))  # ... --- ...
print(morse_to_text("... --- ..."))  # SOS
```

**十六进制转换**:
```python
# 字符串转十六进制
text = "Hello"
hex_str = text.encode().hex()
print(hex_str)  # 48656c6c6f

# 十六进制转字符串
hex_str = "48656c6c6f"
text = bytes.fromhex(hex_str).decode()
print(text)  # Hello
```

**ASCII编码**:
```python
# 字符转ASCII码
char = 'A'
print(ord(char))  # 65

# ASCII码转字符
print(chr(65))  # A

# 字符串转ASCII码列表
text = "ABC"
ascii_list = [ord(c) for c in text]
print(ascii_list)  # [65, 66, 67]
```

**HTML实体编码**:
```python
import html

# 编码
text = '<script>alert(1)</script>'
encoded = html.escape(text)
print(encoded)  # &lt;script&gt;alert(1)&lt;/script&gt;

# 解码
decoded = html.unescape(encoded)
print(decoded)  # <script>alert(1)</script>
```

**Unicode编码**:
```python
# 字符转Unicode码点
char = '中'
print(ord(char))  # 20013
print(hex(ord(char)))  # 0x4e2d

# Unicode转字符
print(chr(0x4e2d))  # 中

# 字符串转Unicode转义
text = "中文"
unicode_str = text.encode('unicode_escape').decode()
print(unicode_str)  # 中文
```

## 常见编码格式

### 摩尔斯电码

**示例**:
```
SOS → ... --- ...
HELLO → .... . .-.. .-.. ---
```

### HTML实体编码

**示例**:
```html
< → &lt; 或 &#60;
> → &gt; 或 &#62;
" → &quot; 或 &#34;
& → &amp; 或 &#38;
```

### Unicode编码

**格式**:
- `\uXXXX` - JavaScript/Python格式
- `\UXXXXXXXX` - Python长格式
- `&#xXXXX;` - HTML格式
- `&#XXXXX;` - HTML十进制格式

**示例**:
```
中 → 中
中 → &#x4e2d;
中 → &#20013;
```

### Punycode

**用途**: 国际化域名编码(IDN)

**示例**:
```
中国.com → xn--fiqs8s.com
münchen.de → xn--mnchen-3ya.de
```

## CTF解题技巧

!!! tip "识别技巧"
    - `... --- ...` → 摩尔斯电码
    - `%XX` → URL编码
    - `\xXX` → 十六进制转义
    - `&xxx;` → HTML实体
    - `\uXXXX` → Unicode
    - `xn--` 开头 → Punycode

!!! tip "快速转换"
    使用CyberChef或Hi编码可以一次尝试多种编码

!!! warning "混合编码"
    CTF中常见多种编码混合使用：
    - Base64 + Hex
    - URL + HTML实体
    - 多层编码嵌套
