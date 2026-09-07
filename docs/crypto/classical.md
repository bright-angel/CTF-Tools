# 古典密码工具

古典密码是密码学的基础，在CTF中经常出现。

## 在线工具

### 综合工具站点

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/](http://www.hiencode.com/) | 50+种古典密码工具 |
| CTFever | [https://ctfever.uniiem.com/](https://ctfever.uniiem.com/) | 现代化界面，持续更新 |
| BugKu CTF | [https://ctf.bugku.com/tools](https://ctf.bugku.com/tools) | CTF专用工具集 |
| CTF SSLEye | [http://ctf.ssleye.com/](http://ctf.ssleye.com/) | 常用CTF工具 |

### 凯撒密码 (Caesar Cipher)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| 摩尔斯电码00查 | [http://moersima.00cha.net/kaisamima.asp](http://moersima.00cha.net/kaisamima.asp) | 自动爆破 |
| Hi编码 | [http://www.hiencode.com/caesar.html](http://www.hiencode.com/caesar.html) | 支持偏移量设置 |
| BugKu | [https://ctf.bugku.com/tool/caesar](https://ctf.bugku.com/tool/caesar) | CTF专用 |
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | ROT13/ROT47 |

**原理**: 字母移位加密

**示例**:
```
明文: HELLO
移位3: KHOOR
移位13(ROT13): URYYB
```

### 维吉尼亚密码 (Vigenere Cipher)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/vigenere.html](http://www.hiencode.com/vigenere.html) | 加解密 |
| BugKu | [https://ctf.bugku.com/tool/vigenere](https://ctf.bugku.com/tool/vigenere) | CTF专用 |
| CTFever | [https://ctfever.uniiem.com/tools/vigenereCipher](https://ctfever.uniiem.com/tools/vigenereCipher) | 现代界面 |
| Guballa Solver | [https://www.guballa.de/vigenere-solver](https://www.guballa.de/vigenere-solver) | 自动破解 |
| MyGeocaching | [https://www.mygeocachingprofile.com/codebreaker.vigenerecipher.aspx](https://www.mygeocachingprofile.com/codebreaker.vigenerecipher.aspx) | 破解工具 |

**原理**: 多表代换密码，使用密钥

### 栅栏密码 (Rail Fence Cipher)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/railfence.html](http://www.hiencode.com/railfence.html) | Z字形栅栏 |
| BugKu | [https://ctf.bugku.com/tool/railfence](https://ctf.bugku.com/tool/railfence) | CTF专用 |
| QQ秀资 | [https://www.qqxiuzi.cn/bianma/zhalanmima.php](https://www.qqxiuzi.cn/bianma/zhalanmima.php) | 中文界面 |
| CTFever | [https://ctfever.uniiem.com/tools/rail-fence-cipher](https://ctfever.uniiem.com/tools/rail-fence-cipher) | 支持多栏数 |

**原理**: Z字形排列后按行读取

### 培根密码 (Bacon Cipher)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/baconian.html](http://www.hiencode.com/baconian.html) | 标准培根 |
| dCode | [https://www.dcode.fr/bacon-cipher](https://www.dcode.fr/bacon-cipher) | 多版本支持 |

**原理**: 只用A和B两个字母，5位一组

**示例**:
```
A = AAAAA
B = AAAAB
C = AAABA
```

### 猪圈密码 (Pigpen Cipher)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| CTF SSLEye | [http://ctf.ssleye.com/pigpen.html](http://ctf.ssleye.com/pigpen.html) | 在线解密 |
| Hi编码 | [http://www.hiencode.com/pigpen.html](http://www.hiencode.com/pigpen.html) | 图形展示 |
| CTFever | [https://ctfever.uniiem.com/tools/pigpen](https://ctfever.uniiem.com/tools/pigpen) | 现代界面 |

**别名**: 共济会密码、石匠密码

**原理**: 使用几何图形替换字母

### 仿射密码 (Affine Cipher)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/affine.html](http://www.hiencode.com/affine.html) | 参数设置 |
| Boxentriq | [https://www.boxentriq.com/code-breaking/affine-cipher](https://www.boxentriq.com/code-breaking/affine-cipher) | 自动破解 |
| WishingStar | [https://www.wishingstarmoye.com/ctf/affinecipher](https://www.wishingstarmoye.com/ctf/affinecipher) | CTF工具 |

**原理**: 数学函数加密  
**公式**: E(x) = (ax + b) mod 26

### 埃特巴什码 (Atbash Cipher)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Hi编码 | [http://www.hiencode.com/atbash.html](http://www.hiencode.com/atbash.html) | 字母表反转 |

**原理**: A↔Z, B↔Y, C↔X...

### 敲击码 (Tap Code)

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| CTF SSLEye | [http://ctf.ssleye.com/tapcode.html](http://ctf.ssleye.com/tapcode.html) | 在线工具 |
| Hi编码 | [http://www.hiencode.com/tapcode.html](http://www.hiencode.com/tapcode.html) | 波尔比俄斯方阵 |

**原理**: 5×5方阵，用敲击次数表示位置

**示例**:
```
A = 1,1  (• •)
B = 1,2  (• ••)
```

### 其他古典密码

| 密码类型 | 在线工具 | 原理 |
|---------|---------|------|
| 四方密码 | [Hi编码](http://www.hiencode.com/four.html) | 四个5×5方阵 |
| 双密码 (Bifid) | [Hi编码](http://www.hiencode.com/bifid.html) | 方阵+转置 |
| 普莱费尔 (Playfair) | [Hi编码](http://www.hiencode.com/playfair.html) | 5×5方阵成对加密 |
| 希尔密码 (Hill) | [BugKu](https://ctf.bugku.com/tool/hill) | 矩阵运算 |
| 博福特 (Beaufort) | [Hi编码](http://www.hiencode.com/beaufort.html) | 维吉尼亚变体 |
| 波特 (Porta) | [Hi编码](http://www.hiencode.com/porta.html) | 维吉尼亚改进 |
| Gronsfeld | [Hi编码](http://www.hiencode.com/gronsfeld.html) | 数字密钥 |
| 自动密钥 (Autokey) | [Hi编码](http://www.hiencode.com/autokey.html) | 明文作密钥 |
| 关键字密码 | [Hi编码](http://www.hiencode.com/keyword.html) | 关键字替换表 |
| 列移位密码 | [Hi编码](http://www.hiencode.com/colum.html) | 按列移位 |
| ADFGX | [BugKu](https://ctf.bugku.com/tool/adfgx) | 德国一战密码 |
| ADFGVX | [Hi编码](http://www.hiencode.com/adfgvx.html) | ADFGX扩展版 |

### 特殊编码

| 编码类型 | 在线工具 | 说明 |
|---------|---------|------|
| A1Z26 | [Hi编码](http://www.hiencode.com/a1z26.html) | A=1, B=2, Z=26 |
| 电报码 | [QQ秀资](https://www.qqxiuzi.cn/bianma/dianbao.php) | 中文电报编码 |
| 百家姓编码 | [Atoolbox](http://www.atoolbox.net/Tool.php?Id=1050) | 百家姓顺序 |
| 博多码 (Baudot) | [Boxentriq](https://www.boxentriq.com/code-breaking/baudot-code) | 5位二进制 |
| 同音替代 | [Atoolbox](http://www.atoolbox.net/Tool.php?Id=919) | 一对多映射 |

### 趣味编码

| 编码名称 | 在线工具 | 特点 |
|---------|---------|------|
| 与佛论禅 | [佛曰](http://hi.pcmoe.net/buddha.html) | 佛经文字编码 |
| 与佛论禅 | [Atoolbox](http://www.atoolbox.net/Tool.php?Id=1027) | 另一版本 |
| 土豆编码 | [KeyFC](http://www.keyfc.net/bbs/tools/tudoucode.aspx) | 土豆语 |
| 核心价值观 | [Hi编码](http://www.hiencode.com/cvencode.html) | 24字编码 |
| 核心价值观 | [C5R](https://c5r.app/tools/core-values-cipher) | 另一工具 |
| 核心价值观 | [BugKu](https://ctf.bugku.com/tool/cvecode) | CTF版本 |
| 兽音译者 | [roar.iiilab.com](https://roar.iiilab.com/) | 兽语编码 |
| 阴阳怪气 | [jiji.pro](https://jiji.pro/yygq.js/) | 拼音谐音 |
| 音乐符号 | [QQ秀资](https://www.qqxiuzi.cn/bianma/wenbenjiami.php?s=yinyue) | 音乐符号 |

### 密码分析工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Quipqiup | [https://quipqiup.com](https://quipqiup.com) | AI自动破解替换密码 |
| dCode | [https://www.dcode.fr/](https://www.dcode.fr/) | 综合密码识别分析 |

## 离线工具

### Python实现

**凯撒密码**:
```python
def caesar_encrypt(text, shift):
    """凯撒加密"""
    result = ""
    for char in text:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            result += chr((ord(char) - base + shift) % 26 + base)
        else:
            result += char
    return result

def caesar_decrypt(text, shift):
    """凯撒解密"""
    return caesar_encrypt(text, -shift)

def caesar_bruteforce(ciphertext):
    """凯撒爆破"""
    for shift in range(26):
        print(f"Shift {shift}: {caesar_decrypt(ciphertext, shift)}")

# ROT13（移位13）
def rot13(text):
    return caesar_encrypt(text, 13)

# 使用
plaintext = "HELLO"
encrypted = caesar_encrypt(plaintext, 3)  # KHOOR
print(f"加密: {encrypted}")

# 爆破密文
caesar_bruteforce("KHOOR")
```

**维吉尼亚密码**:
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
plaintext = "HELLO"
key = "KEY"
encrypted = vigenere_encrypt(plaintext, key)
print(f"加密: {encrypted}")
decrypted = vigenere_decrypt(encrypted, key)
print(f"解密: {decrypted}")
```

**栅栏密码**:
```python
def railfence_encrypt(text, rails):
    """栅栏加密（Z字形）"""
    if rails == 1:
        return text
    
    fence = [[] for _ in range(rails)]
    rail = 0
    direction = 1
    
    for char in text:
        fence[rail].append(char)
        rail += direction
        if rail == 0 or rail == rails - 1:
            direction = -direction
    
    return ''.join([''.join(rail) for rail in fence])

def railfence_decrypt(ciphertext, rails):
    """栅栏解密"""
    if rails == 1:
        return ciphertext
    
    # 计算每行字符数
    fence = [[] for _ in range(rails)]
    rail = 0
    direction = 1
    
    for i in range(len(ciphertext)):
        fence[rail].append(None)
        rail += direction
        if rail == 0 or rail == rails - 1:
            direction = -direction
    
    # 填充密文
    index = 0
    for rail in fence:
        for i in range(len(rail)):
            rail[i] = ciphertext[index]
            index += 1
    
    # 读取明文
    result = []
    rail = 0
    direction = 1
    for i in range(len(ciphertext)):
        result.append(fence[rail].pop(0))
        rail += direction
        if rail == 0 or rail == rails - 1:
            direction = -direction
    
    return ''.join(result)

# 栅栏爆破
def railfence_bruteforce(ciphertext):
    for rails in range(2, len(ciphertext)):
        print(f"Rails {rails}: {railfence_decrypt(ciphertext, rails)}")

# 使用
plaintext = "HELLO WORLD"
encrypted = railfence_encrypt(plaintext, 3)
print(f"加密: {encrypted}")
```

**培根密码**:
```python
# 标准培根编码表
BACON_ALPHABET = {
    'A': 'AAAAA', 'B': 'AAAAB', 'C': 'AAABA', 'D': 'AAABB',
    'E': 'AABAA', 'F': 'AABAB', 'G': 'AABBA', 'H': 'AABBB',
    'I': 'ABAAA', 'J': 'ABAAB', 'K': 'ABABA', 'L': 'ABABB',
    'M': 'ABBAA', 'N': 'ABBAB', 'O': 'ABBBA', 'P': 'ABBBB',
    'Q': 'BAAAA', 'R': 'BAAAB', 'S': 'BAABA', 'T': 'BAABB',
    'U': 'BABAA', 'V': 'BABAB', 'W': 'BABBA', 'X': 'BABBB',
    'Y': 'BBAAA', 'Z': 'BBAAB'
}

def bacon_encrypt(text):
    """培根加密"""
    result = []
    for char in text.upper():
        if char in BACON_ALPHABET:
            result.append(BACON_ALPHABET[char])
    return ''.join(result)

def bacon_decrypt(code):
    """培根解密"""
    # 反转字典
    decode = {v: k for k, v in BACON_ALPHABET.items()}
    result = []
    
    for i in range(0, len(code), 5):
        chunk = code[i:i+5]
        if chunk in decode:
            result.append(decode[chunk])
    
    return ''.join(result)

# 使用
plaintext = "HELLO"
encrypted = bacon_encrypt(plaintext)
print(f"加密: {encrypted}")
decrypted = bacon_decrypt(encrypted)
print(f"解密: {decrypted}")
```

### GitHub工具库

**下载链接**:
```
# 维吉尼亚破解工具
https://github.com/20142995/vigenere-solver

# 自动密钥破解
https://github.com/hotzzzzy/breakautokey

# 替换密码求解器
https://github.com/alexbers/substitution_cipher_solver
```

**安装使用**:
```bash
# vigenere-solver
git clone https://github.com/20142995/vigenere-solver
cd vigenere-solver
python vigenere_solver.py <ciphertext>

# substitution_cipher_solver
git clone https://github.com/alexbers/substitution_cipher_solver
cd substitution_cipher_solver
python3 solver.py "CIPHERTEXT HERE"
```

## 密码识别技巧

### 字符特征识别

| 密码类型 | 字符特征 | 示例 |
|---------|---------|------|
| 凯撒/ROT13 | 纯字母，看起来像乱码单词 | URYYB |
| 维吉尼亚 | 纯字母，频率分析无效 | RIJVS |
| 栅栏 | 纯字母，有规律性 | HLOOL ELWRD |
| 培根 | 只有A和B | AAAABAABAAAA |
| 摩尔斯 | 点和横线 | .... . .-.. .-.. --- |
| 敲击码 | 数字对 | 1,1 2,3 3,4 |
| Base64 | 包含+/=，大小写数字 | SGVsbG8= |

### 识别流程

```
1. 检查字符集
   ├─ 只有A-Z → 可能是替换密码
   ├─ 只有A和B → 培根密码
   ├─ 点和横线 → 摩尔斯
   ├─ 数字对 → 敲击码
   └─ 包含特殊字符 → Base64或其他编码

2. 统计分析
   ├─ 字符频率分布
   ├─ 重复模式
   └─ 字符串长度特征

3. 尝试常见密码
   ├─ 凯撒（26种）
   ├─ ROT13
   ├─ 栅栏（不同栏数）
   └─ Atbash

4. 使用自动识别工具
   └─ dCode, Quipqiup
```

## CTF解题技巧

!!! tip "快速识别"
    1. **看字符集**: 纯字母/数字/符号
    2. **看长度**: 培根是5的倍数，Base64是4的倍数
    3. **看规律**: 重复字符、特殊模式
    4. **题目提示**: 标题、描述中的关键词

!!! tip "破解思路"
    **凯撒/ROT**:
    - 直接爆破26种可能
    - ROT13是移位13
    
    **维吉尼亚**:
    - 需要密钥（可能在题目中）
    - 密钥长度分析 → 频率分析
    - 使用在线爆破工具
    
    **栅栏**:
    - 尝试不同栏数（2到n/2）
    - 注意W形和Z形变体
    
    **培根**:
    - 5位一组AAABA
    - 可能隐藏在大小写中
    
    **组合加密**:
    - 先Base64 → 再凯撒
    - 先凯撒 → 再栅栏
    - 多次尝试不同顺序

!!! warning "常见陷阱"
    - **多重加密**: 可能经过2-3次不同加密
    - **变种算法**: 改进的加密方式
    - **密钥隐藏**: 在图片、注释、文件名中
    - **预处理**: 需要去空格、转大写等
    - **零宽字符**: 隐藏的不可见字符
    - **混合编码**: 中英文混合、趣味编码

!!! tip "工具组合拳"
    ```python
    # 1. CyberChef Recipe（推荐）
    From Base64 → ROT13 → Rail Fence (3) → From Hex
    
    # 2. 在线工具批量尝试
    - Hi编码：遍历所有古典密码
    - dCode：自动识别密码类型
    - Quipqiup：自动破解替换密码
    
    # 3. Python脚本爆破
    for shift in range(26):  # 凯撒
        for rails in range(2, 10):  # 栅栏
            result = decrypt(shift, rails)
            if is_readable(result):
                print(result)
    ```

!!! tip "频率分析"
    英文字母频率（从高到低）:
    ```
    E > T > A > O > I > N > S > H > R > D > L > C > U
    ```
    
    如果密文频率与此相近 → 可能是简单替换  
    如果密文频率均匀分布 → 可能是多表替换（维吉尼亚）

## 相关资源

- **综合工具**: Hi编码、CTFever包含所有常用古典密码
- **密码识别**: dCode可自动识别密码类型
- **自动破解**: Quipqiup用于破解英文替换密码
- **CyberChef**: 可组合多种操作，适合多重加密
