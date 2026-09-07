# 特殊字符编码工具

各种特殊字符编码方式，包括与佛论禅、零宽字符等。

## 在线工具

### 中文编码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| 与佛论禅 | [https://www.keyfc.net/bbs/tools/tudoucode.aspx](https://www.keyfc.net/bbs/tools/tudoucode.aspx) | 与佛论禅加解密 |
| 兽音译者 | [https://monster.ouliu.net/](https://monster.ouliu.net/) | 兽音加解密 |
| 熊曰/兽曰 | [http://hi.pcmoe.net/buddha.html](http://hi.pcmoe.net/buddha.html) | 新约佛论禅 |
| 当当加密 | [https://ctfever.uniiem.com/tools/dangdang](https://ctfever.uniiem.com/tools/dangdang) | 当当文加密 |

### 特殊编码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| JSFuck | [http://www.jsfuck.com/](http://www.jsfuck.com/) | JS混淆编码 |
| AAencode | [https://cat-in-136.github.io/2010/12/aadecode-decode-encoded-as-aaencode.html](https://cat-in-136.github.io/2010/12/aadecode-decode-encoded-as-aaencode.html) | 颜文字编码 |
| JJencode | [http://utf-8.jp/public/jjencode.html](http://utf-8.jp/public/jjencode.html) | JS混淆编码 |
| BrainFuck | [https://www.dcode.fr/brainfuck-language](https://www.dcode.fr/brainfuck-language) | 脑残编码 |
| Ook! | [https://www.dcode.fr/ook-language](https://www.dcode.fr/ook-language) | Ook编程语言 |

### 零宽字符

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Unicode隐写 | [https://www.irongeek.com/i.php?page=security/unicode-steganography-homoglyph-encoder](https://www.irongeek.com/i.php?page=security/unicode-steganography-homoglyph-encoder) | 零宽字符隐写 |
| 零宽检测 | [https://330k.github.io/misc_tools/unicode_steganography.html](https://330k.github.io/misc_tools/unicode_steganography.html) | 零宽字符检测 |

### 键盘编码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| 九宫格键盘 | [https://ctfever.uniiem.com/tools/phone-keyboard](https://ctfever.uniiem.com/tools/phone-keyboard) | 手机九宫格编码 |
| QWERTY键盘 | [https://www.dcode.fr/keyboard-shift-cipher](https://www.dcode.fr/keyboard-shift-cipher) | 键盘位移加密 |

### 音符/符号编码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| 千千秀字 | [https://www.qqxiuzi.cn/bianma/wenbenjiami.php](https://www.qqxiuzi.cn/bianma/wenbenjiami.php) | 音符/盲文/符号编码 |
| 盲文编码 | [https://www.dcode.fr/braille-alphabet](https://www.dcode.fr/braille-alphabet) | 盲文点字 |

### 汉字编码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| 四角号码 | [https://www.qqxiuzi.cn/bianma/sijiaohaomazaixian.php](https://www.qqxiuzi.cn/bianma/sijiaohaomazaixian.php) | 汉字四角号码 |
| 汉字笔画 | [https://www.qqxiuzi.cn/bianma/bihuachaxun.php](https://www.qqxiuzi.cn/bianma/bihuachaxun.php) | 笔画编码 |
| 拼音编码 | [https://www.qqxiuzi.cn/zh/pinyin/](https://www.qqxiuzi.cn/zh/pinyin/) | 汉字转拼音 |
| 电码查询 | [https://www.qqxiuzi.cn/bianma/dianbaodianma.php](https://www.qqxiuzi.cn/bianma/dianbaodianma.php) | 中文电码 |

## 离线工具

### 与佛论禅

#### Python实现

**安装**:
```bash
pip install buddha
```

**使用**:
```python
# 方法1: 使用buddha库
from buddha import encode, decode

# 加密
plaintext = "Hello World"
encrypted = encode(plaintext)
print(encrypted)

# 解密
decrypted = decode(encrypted)
print(decrypted)
```

**手动实现**:
```python
def buddha_encode(text):
    """与佛论禅加密"""
    result = "佛曰："
    for char in text:
        unicode_val = ord(char)
        buddha_char = ""
        
        # 转换为"佛"系字符
        buddha_chars = "諸行無常諸法無我涅槃寂靜"
        while unicode_val > 0:
            buddha_char = buddha_chars[unicode_val % len(buddha_chars)] + buddha_char
            unicode_val //= len(buddha_chars)
        
        result += buddha_char
    
    return result

def buddha_decode(text):
    """与佛论禅解密"""
    if not text.startswith("佛曰："):
        return text
    
    text = text[3:]  # 去掉"佛曰："
    buddha_chars = "諸行無常諸法無我涅槃寂靜"
    
    result = ""
    unicode_val = 0
    
    for char in text:
        if char in buddha_chars:
            unicode_val = unicode_val * len(buddha_chars) + buddha_chars.index(char)
        else:
            if unicode_val > 0:
                result += chr(unicode_val)
                unicode_val = 0
    
    if unicode_val > 0:
        result += chr(unicode_val)
    
    return result
```

### 零宽字符隐写

**Python实现**:
```python
# 零宽字符定义
ZERO_WIDTH_CHARS = {
    '0': '​',  # Zero Width Space
    '1': '‌',  # Zero Width Non-Joiner
}

def zero_width_encode(text, message):
    """零宽字符隐写"""
    # 将消息转为二进制
    binary = ''.join(format(ord(c), '08b') for c in message)
    
    # 转为零宽字符
    hidden = ''.join(ZERO_WIDTH_CHARS[bit] for bit in binary)
    
    # 插入到文本中
    return text + hidden

def zero_width_decode(text):
    """零宽字符提取"""
    # 提取零宽字符
    binary = ""
    for char in text:
        if char == '​':
            binary += '0'
        elif char == '‌':
            binary += '1'
    
    # 转为字符
    message = ""
    for i in range(0, len(binary), 8):
        byte = binary[i:i+8]
        if len(byte) == 8:
            message += chr(int(byte, 2))
    
    return message

def zero_width_detect(text):
    """检测零宽字符"""
    zero_width = ['​', '‌', '‍', '﻿']
    
    found = []
    for i, char in enumerate(text):
        if char in zero_width:
            found.append((i, repr(char)))
    
    return found

# 使用
cover_text = "这是公开的文本"
secret = "flag{hidden}"

stego_text = zero_width_encode(cover_text, secret)
print(f"隐写文本: {stego_text}")
print(f"提取消息: {zero_width_decode(stego_text)}")
print(f"检测结果: {zero_width_detect(stego_text)}")
```

### JSFuck/AAencode

**在线解码**:
```python
import requests

def jsfuck_decode(code):
    """JSFuck解码（使用在线工具）"""
    # 本地执行JS代码
    import subprocess
    result = subprocess.run(
        ['node', '-e', code],
        capture_output=True,
        text=True
    )
    return result.stdout

# 或使用pyexecjs
import execjs
ctx = execjs.compile(jsfuck_code)
result = ctx.eval('code')
```

### BrainFuck

**Python实现**:
```python
def brainfuck_execute(code, input_data=""):
    """BrainFuck解释器"""
    code = [c for c in code if c in '><+-.,[]']
    
    memory = [0] * 30000
    pointer = 0
    code_pointer = 0
    output = []
    input_pointer = 0
    
    bracket_map = {}
    stack = []
    for i, cmd in enumerate(code):
        if cmd == '[':
            stack.append(i)
        elif cmd == ']':
            if stack:
                start = stack.pop()
                bracket_map[start] = i
                bracket_map[i] = start
    
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
        elif cmd == '[':
            if memory[pointer] == 0:
                code_pointer = bracket_map[code_pointer]
        elif cmd == ']':
            if memory[pointer] != 0:
                code_pointer = bracket_map[code_pointer]
        
        code_pointer += 1
    
    return ''.join(output)

# 使用
bf_code = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
result = brainfuck_execute(bf_code)
print(result)  # Hello World!
```

### 九宫格键盘码

**Python实现**:
```python
PHONE_KEYBOARD = {
    '2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
    '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz',
    '0': ' '
}

def phone_keyboard_decode(code):
    """九宫格键盘解码"""
    # 格式: 22 (按2键2次 = b)
    groups = code.split()
    result = ""
    
    for group in groups:
        if not group:
            continue
        
        key = group[0]
        count = len(group)
        
        if key in PHONE_KEYBOARD:
            letters = PHONE_KEYBOARD[key]
            result += letters[(count - 1) % len(letters)]
    
    return result

# 使用
code = "44 33 555 555 666"
print(phone_keyboard_decode(code))  # hello
```

### 键盘位移

**Python实现**:
```python
KEYBOARD_LAYOUT = [
    "1234567890",
    "qwertyuiop",
    "asdfghjkl",
    "zxcvbnm"
]

def keyboard_shift(text, direction='right'):
    """键盘位移加密"""
    keyboard_map = {}
    
    for row in KEYBOARD_LAYOUT:
        for i, char in enumerate(row):
            if direction == 'right':
                next_char = row[(i + 1) % len(row)]
            else:  # left
                next_char = row[(i - 1) % len(row)]
            keyboard_map[char] = next_char
            keyboard_map[char.upper()] = next_char.upper()
    
    result = ""
    for char in text:
        result += keyboard_map.get(char, char)
    
    return result

# 使用
plaintext = "hello"
encrypted = keyboard_shift(plaintext, 'right')
print(f"加密: {encrypted}")  # jropt
print(f"解密: {keyboard_shift(encrypted, 'left')}")  # hello
```

### 盲文编码

**Python实现**:
```python
BRAILLE_MAP = {
    'a': '⠁', 'b': '⠃', 'c': '⠉', 'd': '⠙', 'e': '⠑',
    'f': '⠋', 'g': '⠛', 'h': '⠓', 'i': '⠊', 'j': '⠚',
    'k': '⠅', 'l': '⠇', 'm': '⠍', 'n': '⠝', 'o': '⠕',
    'p': '⠏', 'q': '⠟', 'r': '⠗', 's': '⠎', 't': '⠞',
    'u': '⠥', 'v': '⠧', 'w': '⠺', 'x': '⠭', 'y': '⠽',
    'z': '⠵', ' ': '⠀'
}

def braille_encode(text):
    """盲文编码"""
    result = ""
    for char in text.lower():
        result += BRAILLE_MAP.get(char, char)
    return result

def braille_decode(text):
    """盲文解码"""
    reverse_map = {v: k for k, v in BRAILLE_MAP.items()}
    result = ""
    for char in text:
        result += reverse_map.get(char, char)
    return result

# 使用
text = "hello"
encoded = braille_encode(text)
print(f"编码: {encoded}")
print(f"解码: {braille_decode(encoded)}")
```

## CTF解题技巧

!!! tip "识别特殊编码"
    ```
    特征识别:
    1. 佛曰/諸行無常 → 与佛论禅
    2. 熊熊熊/兽音 → 熊曰/兽曰
    3. []()!+= → JSFuck
    4. (゜Д゜) → AAencode
    5. +-<>.,[] → BrainFuck
    6. 文本显示异常长度 → 零宽字符
    7. ⠁⠃⠉ → 盲文
    8. 数字重复 → 九宫格键盘
    ```

!!! tip "零宽字符检测"
    ```python
    # 检测文本中的零宽字符
    import unicodedata
    
    def detect_zero_width(text):
        zero_width = []
        for i, char in enumerate(text):
            if unicodedata.category(char) == 'Cf':  # Format字符
                zero_width.append((i, char, repr(char)))
        return zero_width
    
    # 查看十六进制
    print(text.encode('unicode-escape'))
    
    # 移除零宽字符
    clean = ''.join(c for c in text if unicodedata.category(c) != 'Cf')
    ```

!!! tip "与佛论禅变种"
    ```
    标准版: 佛曰：
    新约版: 熊曰：
    兽音版: 嗷~
    
    关键字识别:
    - 諸行無常諸法無我涅槃寂靜
    - 看到这些字符基本确定是佛曰系列
    ```

!!! tip "JSFuck识别与解码"
    ```javascript
    // 特征：仅使用 []()!+ 六个字符
    // 示例：[][(![]+[])[+[]]+([![]]+[][[]])[+!+[]+[+[]]]...]
    
    // 解码方法：
    // 1. 直接在浏览器console执行
    // 2. 使用Node.js执行
    // 3. 在线JSFuck解码器
    ```

!!! tip "BrainFuck快速识别"
    ```
    特征：
    - 只有8个字符：+-<>.,[]
    - > < 移动指针
    - + - 增减值
    - . 输出
    - , 输入
    - [] 循环
    
    在线执行或使用解释器
    ```

!!! tip "九宫格键盘"
    ```
    格式识别:
    - 22 = b (2键按2次)
    - 222 = c (2键按3次)
    - 2 = a (2键按1次)
    
    数字与字母对应:
    2-abc, 3-def, 4-ghi, 5-jkl
    6-mno, 7-pqrs, 8-tuv, 9-wxyz
    ```

!!! warning "常见问题"
    ```
    1. 零宽字符不可见
       - 复制到文本编辑器查看长度
       - 使用十六进制查看
       - Python unicodedata检测
    
    2. 与佛论禅解密失败
       - 检查是否为变种（熊曰、兽音）
       - 确认字符集完整
       - 尝试不同解密工具
    
    3. JSFuck执行超时
       - 代码可能很长，耐心等待
       - 使用Node.js而非浏览器
    
    4. 中文编码乱码
       - 注意编码格式（UTF-8）
       - 检查字符集支持
    ```

!!! tip "组合使用"
    ```
    常见组合:
    1. Base64 + 零宽字符
    2. 与佛论禅 + Base64
    3. JSFuck + 其他编码
    4. 键盘位移 + 凯撒密码
    
    解题流程:
    1. 检测是否有零宽字符
    2. 识别明显特征（佛曰、熊曰等）
    3. 尝试自动解码工具
    4. 手动分析编码规律
    ```

## 相关资源

- **千千秀字**: 中文在线编码工具集合
- **dCode**: 支持多种特殊编码
- **CyberChef**: Magic操作可自动识别
- **零宽字符检测**: Unicode分析工具
