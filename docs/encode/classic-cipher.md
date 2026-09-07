# 古典密码工具

古典密码学中的各种加密解密算法和工具。

## 在线工具

### 综合古典密码平台

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode | [https://www.dcode.fr/](https://www.dcode.fr/) | 300+种古典密码 |
| Cipher Tools | [https://rumkin.com/tools/cipher/](https://rumkin.com/tools/cipher/) | 多种古典密码工具 |
| CTFever古典密码 | [https://ctfever.uniiem.com/](https://ctfever.uniiem.com/) | CTF常用古典密码 |

### 凯撒密码 (Caesar Cipher)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Caesar | [https://www.dcode.fr/caesar-cipher](https://www.dcode.fr/caesar-cipher) | 支持暴力破解 |
| Rumkin Caesar | [https://rumkin.com/tools/cipher/caesar.php](https://rumkin.com/tools/cipher/caesar.php) | 可视化位移 |

### ROT系列

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| ROT13 | [https://rot13.com/](https://rot13.com/) | ROT13专用 |
| ROT47 | [https://www.dcode.fr/rot-47-cipher](https://www.dcode.fr/rot-47-cipher) | ROT47解码 |

### 维吉尼亚密码 (Vigenère)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Vigenère | [https://www.dcode.fr/vigenere-cipher](https://www.dcode.fr/vigenere-cipher) | 支持密钥分析 |
| Rumkin Vigenère | [https://rumkin.com/tools/cipher/vigenere.php](https://rumkin.com/tools/cipher/vigenere.php) | 自动密钥破解 |

### 栅栏密码 (Rail Fence)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Rail Fence | [https://www.dcode.fr/rail-fence-cipher](https://www.dcode.fr/rail-fence-cipher) | 多层栅栏 |
| CTFever栅栏 | [https://ctfever.uniiem.com/tools/railfence](https://ctfever.uniiem.com/tools/railfence) | 中文友好 |

### 培根密码 (Bacon Cipher)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Bacon | [https://www.dcode.fr/bacon-cipher](https://www.dcode.fr/bacon-cipher) | 标准/变种培根 |

### 摩尔斯电码 (Morse Code)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Morse Decoder | [https://morsecode.world/international/decoder.html](https://morsecode.world/international/decoder.html) | 国际摩尔斯 |
| Audio Morse | [https://morsecode.world/international/decoder/audio-decoder-adaptive.html](https://morsecode.world/international/decoder/audio-decoder-adaptive.html) | 音频解码 |

### 仿射密码 (Affine Cipher)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Affine | [https://www.dcode.fr/affine-cipher](https://www.dcode.fr/affine-cipher) | 自动破解 |

### 普莱费尔密码 (Playfair)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Playfair | [https://www.dcode.fr/playfair-cipher](https://www.dcode.fr/playfair-cipher) | 5x5矩阵加密 |

### 波利比奥斯方阵 (Polybius Square)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Polybius | [https://www.dcode.fr/polybius-cipher](https://www.dcode.fr/polybius-cipher) | 棋盘密码 |

### 希尔密码 (Hill Cipher)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Hill | [https://www.dcode.fr/hill-cipher](https://www.dcode.fr/hill-cipher) | 矩阵加密 |

### 埃特巴什码 (Atbash)

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode Atbash | [https://www.dcode.fr/atbash-cipher](https://www.dcode.fr/atbash-cipher) | 字母反转 |

### ADFGVX密码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode ADFGVX | [https://www.dcode.fr/adfgvx-cipher](https://www.dcode.fr/adfgvx-cipher) | 一战德军密码 |

## 离线工具

### Python实现常用古典密码

#### 凯撒密码

**实现**:
```python
def caesar_encrypt(plaintext, shift):
    """凯撒加密"""
    result = ""
    for char in plaintext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            result += chr((ord(char) - base + shift) % 26 + base)
        else:
            result += char
    return result

def caesar_decrypt(ciphertext, shift):
    """凯撒解密"""
    return caesar_encrypt(ciphertext, -shift)

def caesar_bruteforce(ciphertext):
    """凯撒暴力破解"""
    for shift in range(26):
        print(f"Shift {shift:2d}: {caesar_decrypt(ciphertext, shift)}")

# 使用
plaintext = "HELLO WORLD"
encrypted = caesar_encrypt(plaintext, 3)
print(f"加密: {encrypted}")  # KHOOR ZRUOG

# 暴力破解
caesar_bruteforce(encrypted)
```

#### ROT13/ROT47

**实现**:
```python
import codecs

def rot13(text):
    """ROT13编解码（仅字母）"""
    return codecs.encode(text, 'rot_13')

def rot47(text):
    """ROT47编解码（ASCII 33-126）"""
    result = ""
    for char in text:
        code = ord(char)
        if 33 <= code <= 126:
            result += chr(33 + (code - 33 + 47) % 94)
        else:
            result += char
    return result

# 使用
print(rot13("Hello World"))  # Uryyb Jbeyq
print(rot47("Hello World"))  # w6==@ (@C=5
```

#### 维吉尼亚密码

**实现**:
```python
def vigenere_encrypt(plaintext, key):
    """维吉尼亚加密"""
    result = ""
    key = key.upper()
    key_index = 0
    
    for char in plaintext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shift = ord(key[key_index % len(key)]) - ord('A')
            result += chr((ord(char) - base + shift) % 26 + base)
            key_index += 1
        else:
            result += char
    return result

def vigenere_decrypt(ciphertext, key):
    """维吉尼亚解密"""
    result = ""
    key = key.upper()
    key_index = 0
    
    for char in ciphertext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shift = ord(key[key_index % len(key)]) - ord('A')
            result += chr((ord(char) - base - shift) % 26 + base)
            key_index += 1
        else:
            result += char
    return result

# 使用
plaintext = "HELLO WORLD"
key = "KEY"
encrypted = vigenere_encrypt(plaintext, key)
print(f"加密: {encrypted}")  # RIJVS UYVJN
print(f"解密: {vigenere_decrypt(encrypted, key)}")
```

#### 栅栏密码

**实现**:
```python
def rail_fence_encrypt(plaintext, rails):
    """栅栏加密"""
    fence = [[] for _ in range(rails)]
    rail = 0
    direction = 1
    
    for char in plaintext:
        fence[rail].append(char)
        rail += direction
        if rail == 0 or rail == rails - 1:
            direction *= -1
    
    return ''.join([''.join(rail) for rail in fence])

def rail_fence_decrypt(ciphertext, rails):
    """栅栏解密"""
    fence = [['' for _ in range(len(ciphertext))] for _ in range(rails)]
    rail = 0
    direction = 1
    
    # 标记位置
    for i in range(len(ciphertext)):
        fence[rail][i] = '*'
        rail += direction
        if rail == 0 or rail == rails - 1:
            direction *= -1
    
    # 填充字符
    index = 0
    for r in range(rails):
        for c in range(len(ciphertext)):
            if fence[r][c] == '*':
                fence[r][c] = ciphertext[index]
                index += 1
    
    # 读取
    result = ""
    rail = 0
    direction = 1
    for i in range(len(ciphertext)):
        result += fence[rail][i]
        rail += direction
        if rail == 0 or rail == rails - 1:
            direction *= -1
    
    return result

# 使用
plaintext = "HELLO WORLD"
encrypted = rail_fence_encrypt(plaintext, 3)
print(f"加密: {encrypted}")  # HOREL OLLWD
print(f"解密: {rail_fence_decrypt(encrypted, 3)}")
```

#### 培根密码

**实现**:
```python
BACON_DICT = {
    'A': 'AAAAA', 'B': 'AAAAB', 'C': 'AAABA', 'D': 'AAABB',
    'E': 'AABAA', 'F': 'AABAB', 'G': 'AABBA', 'H': 'AABBB',
    'I': 'ABAAA', 'J': 'ABAAA', 'K': 'ABAAB', 'L': 'ABABA',
    'M': 'ABABB', 'N': 'ABBAA', 'O': 'ABBAB', 'P': 'ABBBA',
    'Q': 'ABBBB', 'R': 'BAAAA', 'S': 'BAAAB', 'T': 'BAABA',
    'U': 'BAABB', 'V': 'BAABB', 'W': 'BABAA', 'X': 'BABAB',
    'Y': 'BABBA', 'Z': 'BABBB'
}

def bacon_encrypt(plaintext):
    """培根加密"""
    result = ""
    for char in plaintext.upper():
        if char in BACON_DICT:
            result += BACON_DICT[char]
    return result

def bacon_decrypt(ciphertext):
    """培根解密"""
    reverse_dict = {v: k for k, v in BACON_DICT.items()}
    result = ""
    for i in range(0, len(ciphertext), 5):
        chunk = ciphertext[i:i+5]
        if chunk in reverse_dict:
            result += reverse_dict[chunk]
    return result

# 使用
plaintext = "HELLO"
encrypted = bacon_encrypt(plaintext)
print(f"加密: {encrypted}")
print(f"解密: {bacon_decrypt(encrypted)}")
```

#### 摩尔斯电码

**实现**:
```python
MORSE_CODE = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.',
    'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
    'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---',
    'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
    'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--',
    'Z': '--..', '0': '-----', '1': '.----', '2': '..---',
    '3': '...--', '4': '....-', '5': '.....', '6': '-....',
    '7': '--...', '8': '---..', '9': '----.', ' ': '/'
}

def morse_encrypt(plaintext):
    """摩尔斯加密"""
    result = []
    for char in plaintext.upper():
        if char in MORSE_CODE:
            result.append(MORSE_CODE[char])
    return ' '.join(result)

def morse_decrypt(ciphertext):
    """摩尔斯解密"""
    reverse_dict = {v: k for k, v in MORSE_CODE.items()}
    result = ""
    for code in ciphertext.split(' '):
        if code in reverse_dict:
            result += reverse_dict[code]
    return result

# 使用
plaintext = "HELLO WORLD"
encrypted = morse_encrypt(plaintext)
print(f"加密: {encrypted}")
print(f"解密: {morse_decrypt(encrypted)}")
```

#### 仿射密码

**实现**:
```python
def gcd(a, b):
    """最大公约数"""
    while b:
        a, b = b, a % b
    return a

def mod_inverse(a, m):
    """模逆元"""
    for i in range(1, m):
        if (a * i) % m == 1:
            return i
    return None

def affine_encrypt(plaintext, a, b):
    """仿射加密 E(x) = (ax + b) mod 26"""
    if gcd(a, 26) != 1:
        raise ValueError("a必须与26互质")
    
    result = ""
    for char in plaintext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            x = ord(char) - base
            encrypted = (a * x + b) % 26
            result += chr(encrypted + base)
        else:
            result += char
    return result

def affine_decrypt(ciphertext, a, b):
    """仿射解密 D(y) = a^(-1)(y - b) mod 26"""
    a_inv = mod_inverse(a, 26)
    if a_inv is None:
        raise ValueError("a没有模逆元")
    
    result = ""
    for char in ciphertext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            y = ord(char) - base
            decrypted = (a_inv * (y - b)) % 26
            result += chr(decrypted + base)
        else:
            result += char
    return result

# 使用
plaintext = "HELLO"
a, b = 5, 8  # a必须与26互质
encrypted = affine_encrypt(plaintext, a, b)
print(f"加密: {encrypted}")
print(f"解密: {affine_decrypt(encrypted, a, b)}")
```

### 密码分析工具

#### 频率分析

**实现**:
```python
from collections import Counter

def frequency_analysis(text):
    """频率分析"""
    # 只统计字母
    letters = [c.upper() for c in text if c.isalpha()]
    counter = Counter(letters)
    
    print("字母频率统计：")
    for letter, count in counter.most_common():
        percentage = count / len(letters) * 100
        print(f"{letter}: {count:3d} ({percentage:5.2f}%)")
    
    return counter

# 英文字母标准频率
ENGLISH_FREQ = {
    'E': 12.70, 'T': 9.06, 'A': 8.17, 'O': 7.51, 'I': 6.97,
    'N': 6.75, 'S': 6.33, 'H': 6.09, 'R': 5.99, 'D': 4.25
}

# 使用
ciphertext = "KHOOR ZRUOG" * 10
frequency_analysis(ciphertext)
```

#### 重合指数法（判断维吉尼亚密钥长度）

**实现**:
```python
def index_of_coincidence(text):
    """计算重合指数"""
    text = ''.join([c for c in text.upper() if c.isalpha()])
    n = len(text)
    
    if n <= 1:
        return 0
    
    freq = {}
    for char in text:
        freq[char] = freq.get(char, 0) + 1
    
    ic = sum(f * (f - 1) for f in freq.values()) / (n * (n - 1))
    return ic

def find_key_length(ciphertext, max_length=20):
    """查找维吉尼亚密钥长度"""
    text = ''.join([c for c in ciphertext.upper() if c.isalpha()])
    
    print("可能的密钥长度（重合指数越接近0.065越可能）：")
    for length in range(1, max_length + 1):
        # 分组
        groups = ['' for _ in range(length)]
        for i, char in enumerate(text):
            groups[i % length] += char
        
        # 计算平均IC
        avg_ic = sum(index_of_coincidence(g) for g in groups) / length
        print(f"长度 {length:2d}: IC = {avg_ic:.4f}")

# 使用
ciphertext = "YOUR VIGENERE CIPHERTEXT HERE"
find_key_length(ciphertext)
```

## CTF解题技巧

!!! tip "古典密码识别"
    ```
    特征识别：
    1. 纯字母 → 可能是替换密码
       - 字母频率正常 → 可能是凯撒、维吉尼亚
       - 字母频率异常 → 可能是简单替换
    
    2. A/B或0/1 → 培根密码
    
    3. 点划符号 → 摩尔斯电码
    
    4. 数字 → 可能是坐标、编码
    
    5. 特殊格式 → 栅栏、曲路等
    
    工具：
    - dCode Cipher Identifier（自动识别）
    - 频率分析
    - 重合指数分析
    ```

!!! tip "凯撒密码破解"
    ```python
    # 暴力破解（26种可能）
    for shift in range(26):
        print(f"Shift {shift}: {caesar_decrypt(ciphertext, shift)}")
    
    # 频率分析
    # 英文E最常见，找密文中最常见字母
    most_common = Counter(ciphertext).most_common(1)[0][0]
    shift = (ord(most_common) - ord('E')) % 26
    ```

!!! tip "维吉尼亚破解步骤"
    ```
    1. 确定密钥长度
       - Kasiski测试（查找重复片段距离的公约数）
       - 重合指数法（IC接近0.065）
    
    2. 分组凯撒
       - 按密钥长度分组
       - 每组单独频率分析
       - 确定每个字母的位移
    
    3. 还原密钥
       - 组合每组的位移得到密钥
    ```

!!! tip "栅栏密码技巧"
    ```python
    # 尝试不同栅栏数
    for rails in range(2, len(ciphertext) // 2):
        result = rail_fence_decrypt(ciphertext, rails)
        print(f"Rails {rails}: {result}")
        if "flag" in result.lower():
            print("找到!")
            break
    ```

!!! tip "快速判断方法"
    ```
    1. 密文长度
       - Base64: 长度是4的倍数，字符A-Za-z0-9+/=
       - 培根: 长度是5的倍数，仅A/B
       - 摩尔斯: 包含点和划
    
    2. 字符集
       - 仅大写字母 → 古典密码
       - 大小写混合 → 可能是现代编码
       - 特殊符号 → Base系列或现代加密
    
    3. 上下文
       - 题目提示
       - 文件名
       - 题目分类
    ```

!!! warning "常见错误"
    ```
    1. 忘记去除空格和标点
       - 古典密码通常只加密字母
    
    2. 大小写问题
       - 注意保持或转换大小写
    
    3. 密钥错误
       - 密钥可能在题目描述中
       - 尝试常见密钥：KEY, FLAG, PASSWORD
    
    4. 变种算法
       - 培根密码有多种变体
       - 维吉尼亚可能用Beaufort等变种
    ```

!!! tip "组合使用"
    ```
    古典密码常见组合：
    1. Base64 + 凯撒
    2. 栅栏 + 维吉尼亚
    3. 培根 + ROT13
    4. 倒序 + 凯撒
    
    解题流程：
    1. 识别外层编码（Base64等）
    2. 解码后再分析内层
    3. 使用dCode自动识别
    4. 手动分析特征
    ```

## 相关资源

- **dCode**: 最全面的古典密码工具网站
- **Cipher Tools**: 经典在线密码工具集
- **CyberChef**: 支持多种古典密码的综合工具
- **频率分析**: 破解替换密码的关键技术
