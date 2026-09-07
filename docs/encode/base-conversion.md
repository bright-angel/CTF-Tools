# 进制转换工具

二进制、八进制、十进制、十六进制等进制转换工具。

## 在线工具

### 进制转换

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| RapidTables | [https://www.rapidtables.com/convert/number/](https://www.rapidtables.com/convert/number/) | 多进制互转 |
| BinaryHexConverter | [https://www.binaryhexconverter.com/](https://www.binaryhexconverter.com/) | 二进制十六进制转换 |
| CTFever进制转换 | [https://ctfever.uniiem.com/tools/baseconvert](https://ctfever.uniiem.com/tools/baseconvert) | 2/8/10/16进制 |

### ASCII转换

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| ASCII Converter | [https://www.rapidtables.com/convert/number/ascii-hex-bin-dec-converter.html](https://www.rapidtables.com/convert/number/ascii-hex-bin-dec-converter.html) | ASCII与进制互转 |
| ASCII表查询 | [https://www.ascii-code.com/](https://www.ascii-code.com/) | ASCII码表 |

### 特殊进制

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| 格雷码 | [https://www.dcode.fr/gray-code](https://www.dcode.fr/gray-code) | 格雷码转换 |
| BCD码 | [https://www.rapidtables.com/convert/number/decimal-to-bcd.html](https://www.rapidtables.com/convert/number/decimal-to-bcd.html) | BCD编码 |

### IEEE754浮点数

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| IEEE754转换 | [https://www.h-schmidt.net/FloatConverter/IEEE754.html](https://www.h-schmidt.net/FloatConverter/IEEE754.html) | 浮点数转换 |
| Float Toy | [https://evanw.github.io/float-toy/](https://evanw.github.io/float-toy/) | 可视化浮点数 |

## 离线工具

### Python进制转换

**内置函数**:
```python
# 十进制转其他进制
num = 255

bin_str = bin(num)      # '0b11111111' 二进制
oct_str = oct(num)      # '0o377' 八进制
hex_str = hex(num)      # '0xff' 十六进制

# 去掉前缀
bin_str = bin(num)[2:]  # '11111111'
hex_str = hex(num)[2:]  # 'ff'

# 其他进制转十进制
binary = '11111111'
decimal = int(binary, 2)    # 255

octal = '377'
decimal = int(octal, 8)     # 255

hexadec = 'ff'
decimal = int(hexadec, 16)  # 255

# 任意进制转换（2-36）
def base_convert(num, from_base, to_base):
    """任意进制转换"""
    # 先转为十进制
    decimal = int(str(num), from_base)
    
    # 转为目标进制
    if to_base == 10:
        return decimal
    
    digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    result = ""
    
    while decimal > 0:
        result = digits[decimal % to_base] + result
        decimal //= to_base
    
    return result or "0"

# 使用
print(base_convert('FF', 16, 2))   # 11111111
print(base_convert('377', 8, 10))  # 255
```

### ASCII转换

**Python实现**:
```python
# 字符转ASCII
char = 'A'
ascii_val = ord(char)       # 65
print(f"{char} -> {ascii_val}")

# ASCII转字符
ascii_val = 65
char = chr(ascii_val)       # 'A'
print(f"{ascii_val} -> {char}")

# 字符串转ASCII列表
text = "Hello"
ascii_list = [ord(c) for c in text]
print(ascii_list)  # [72, 101, 108, 108, 111]

# ASCII列表转字符串
ascii_list = [72, 101, 108, 108, 111]
text = ''.join(chr(i) for i in ascii_list)
print(text)  # Hello

# 字符串转十六进制
text = "Hello"
hex_str = text.encode().hex()
print(hex_str)  # 48656c6c6f

# 十六进制转字符串
hex_str = "48656c6c6f"
text = bytes.fromhex(hex_str).decode()
print(text)  # Hello

# 字符串转二进制
text = "Hi"
binary = ' '.join(format(ord(c), '08b') for c in text)
print(binary)  # 01001000 01101001

# 二进制转字符串
binary = "01001000 01101001"
text = ''.join(chr(int(b, 2)) for b in binary.split())
print(text)  # Hi
```

### 批量进制转换

**Python脚本**:
```python
def multi_base_decode(data):
    """尝试多种进制解码"""
    results = {}
    
    # 尝试二进制
    try:
        if all(c in '01 ' for c in data):
            binary = data.replace(' ', '')
            if len(binary) % 8 == 0:
                text = ''.join(chr(int(binary[i:i+8], 2)) 
                              for i in range(0, len(binary), 8))
                results['Binary'] = text
    except:
        pass
    
    # 尝试八进制
    try:
        parts = data.split()
        text = ''.join(chr(int(p, 8)) for p in parts)
        if text.isprintable():
            results['Octal'] = text
    except:
        pass
    
    # 尝试十进制
    try:
        parts = data.split()
        text = ''.join(chr(int(p)) for p in parts)
        if text.isprintable():
            results['Decimal'] = text
    except:
        pass
    
    # 尝试十六进制
    try:
        hex_str = data.replace(' ', '').replace('0x', '')
        text = bytes.fromhex(hex_str).decode()
        results['Hexadecimal'] = text
    except:
        pass
    
    return results

# 使用
data = "48 65 6c 6c 6f"
results = multi_base_decode(data)
for base, text in results.items():
    print(f"{base}: {text}")
```

### 格雷码

**Python实现**:
```python
def gray_encode(binary):
    """二进制转格雷码"""
    gray = binary[0]
    for i in range(1, len(binary)):
        gray += str(int(binary[i-1]) ^ int(binary[i]))
    return gray

def gray_decode(gray):
    """格雷码转二进制"""
    binary = gray[0]
    for i in range(1, len(gray)):
        binary += str(int(binary[i-1]) ^ int(gray[i]))
    return binary

# 使用
binary = "1011"
gray = gray_encode(binary)
print(f"Binary: {binary} -> Gray: {gray}")
print(f"Gray: {gray} -> Binary: {gray_decode(gray)}")

# 十进制与格雷码
def decimal_to_gray(n):
    """十进制转格雷码"""
    return n ^ (n >> 1)

def gray_to_decimal(g):
    """格雷码转十进制"""
    n = 0
    while g:
        n ^= g
        g >>= 1
    return n

# 使用
num = 11
gray = decimal_to_gray(num)
print(f"Decimal {num} -> Gray {gray} ({bin(gray)[2:]})")
```

### BCD码

**Python实现**:
```python
def decimal_to_bcd(decimal):
    """十进制转BCD码"""
    bcd = ""
    for digit in str(decimal):
        bcd += format(int(digit), '04b')
    return bcd

def bcd_to_decimal(bcd):
    """BCD码转十进制"""
    decimal = ""
    for i in range(0, len(bcd), 4):
        digit = int(bcd[i:i+4], 2)
        decimal += str(digit)
    return int(decimal)

# 使用
num = 1234
bcd = decimal_to_bcd(num)
print(f"Decimal: {num} -> BCD: {bcd}")
print(f"BCD: {bcd} -> Decimal: {bcd_to_decimal(bcd)}")
```

### IEEE754浮点数

**Python实现**:
```python
import struct

def float_to_ieee754(f):
    """浮点数转IEEE754十六进制"""
    # 单精度（32位）
    bytes_single = struct.pack('>f', f)
    hex_single = bytes_single.hex()
    
    # 双精度（64位）
    bytes_double = struct.pack('>d', f)
    hex_double = bytes_double.hex()
    
    return hex_single, hex_double

def ieee754_to_float(hex_str, precision='double'):
    """IEEE754十六进制转浮点数"""
    bytes_data = bytes.fromhex(hex_str)
    
    if precision == 'single' or len(bytes_data) == 4:
        return struct.unpack('>f', bytes_data)[0]
    else:  # double
        return struct.unpack('>d', bytes_data)[0]

# 使用
num = 3.14159
single, double = float_to_ieee754(num)
print(f"Float: {num}")
print(f"IEEE754 Single: {single}")
print(f"IEEE754 Double: {double}")

# 反向转换
print(f"Single -> Float: {ieee754_to_float(single, 'single')}")
print(f"Double -> Float: {ieee754_to_float(double, 'double')}")
```

### 大整数处理

**Python实现**:
```python
# Python原生支持大整数
big_num = 123456789012345678901234567890

# 转十六进制
hex_str = hex(big_num)[2:]
print(f"Hex: {hex_str}")

# 转回十进制
decimal = int(hex_str, 16)
print(f"Decimal: {decimal}")

# 转Base64
import base64
hex_bytes = bytes.fromhex(hex_str)
b64 = base64.b64encode(hex_bytes).decode()
print(f"Base64: {b64}")

# 长整数转字节
def long_to_bytes(n):
    """长整数转字节"""
    hex_str = hex(n)[2:]
    if len(hex_str) % 2:
        hex_str = '0' + hex_str
    return bytes.fromhex(hex_str)

def bytes_to_long(b):
    """字节转长整数"""
    return int(b.hex(), 16)

# 使用
num = 123456789012345678901234567890
b = long_to_bytes(num)
print(f"Bytes: {b.hex()}")
print(f"Long: {bytes_to_long(b)}")
```

## CTF解题技巧

!!! tip "进制识别"
    ```
    快速识别:
    1. 0b前缀 → 二进制
    2. 0o前缀 → 八进制
    3. 0x前缀 → 十六进制
    4. 仅0-1 → 可能是二进制
    5. 仅0-7 → 可能是八进制
    6. 32-127范围 → 可能是ASCII十进制
    7. 两位一组的数字/字母 → 可能是十六进制
    ```

!!! tip "ASCII码范围"
    ```
    可打印ASCII: 32-126
    - 32: 空格
    - 48-57: 数字0-9
    - 65-90: 大写字母A-Z
    - 97-122: 小写字母a-z
    
    常用字符:
    - 33: !
    - 63: ?
    - 123: {
    - 125: }
    
    判断方法:
    - 如果数字在32-126范围，尝试ASCII解码
    ```

!!! tip "十六进制识别"
    ```python
    # 常见格式
    formats = [
        "48656c6c6f",           # 纯十六进制
        "48 65 6c 6c 6f",       # 空格分隔
        "0x48 0x65 0x6c",       # 0x前缀
        "\\x48\\x65\\x6c",      # \x格式
    ]
    
    # 统一处理
    hex_str = data.replace('0x', '').replace('\\x', '').replace(' ', '')
    text = bytes.fromhex(hex_str).decode()
    ```

!!! tip "二进制处理"
    ```python
    # CTF中常见的二进制格式
    
    # 1. 纯二进制
    binary = "0100100001100101011011000110110001101111"
    
    # 2. 空格分隔的8位
    binary = "01001000 01100101 01101100 01101100 01101111"
    
    # 3. 其他分隔符
    binary = "01001000-01100101-01101100"
    
    # 统一处理
    binary = binary.replace(' ', '').replace('-', '').replace('_', '')
    text = ''.join(chr(int(binary[i:i+8], 2)) for i in range(0, len(binary), 8))
    ```

!!! tip "自动识别与解码"
    ```python
    def auto_decode(data):
        """自动识别并解码"""
        data = data.strip()
        
        # 尝试十六进制
        try:
            hex_clean = data.replace(' ', '').replace('0x', '').replace('\\x', '')
            if all(c in '0123456789abcdefABCDEF' for c in hex_clean):
                if len(hex_clean) % 2 == 0:
                    result = bytes.fromhex(hex_clean).decode()
                    if result.isprintable():
                        return f"Hex: {result}"
        except:
            pass
        
        # 尝试二进制
        try:
            binary = data.replace(' ', '').replace('-', '')
            if all(c in '01' for c in binary) and len(binary) % 8 == 0:
                result = ''.join(chr(int(binary[i:i+8], 2)) 
                                for i in range(0, len(binary), 8))
                if result.isprintable():
                    return f"Binary: {result}"
        except:
            pass
        
        # 尝试ASCII十进制
        try:
            nums = data.split()
            if all(num.isdigit() for num in nums):
                result = ''.join(chr(int(num)) for num in nums)
                if result.isprintable():
                    return f"ASCII: {result}"
        except:
            pass
        
        return "Unknown encoding"
    
    # 使用
    print(auto_decode("48656c6c6f"))
    print(auto_decode("01001000 01100101"))
    print(auto_decode("72 101 108 108 111"))
    ```

!!! tip "字节序处理"
    ```python
    # 大端序（Big-endian）vs 小端序（Little-endian）
    
    num = 0x12345678
    
    # 大端序（网络字节序）
    big_endian = num.to_bytes(4, 'big')
    print(big_endian.hex())  # 12345678
    
    # 小端序（Intel x86）
    little_endian = num.to_bytes(4, 'little')
    print(little_endian.hex())  # 78563412
    
    # 如果解码结果乱码，尝试转换字节序
    def swap_endian(hex_str):
        bytes_data = bytes.fromhex(hex_str)
        return bytes_data[::-1].hex()
    ```

!!! warning "常见错误"
    ```
    1. 忘记去除进制前缀
       - 0x, 0b, 0o 需要去除或使用int()的base参数
    
    2. 十六进制长度为奇数
       - 在前面补0: '0' + hex_str
    
    3. 二进制长度不是8的倍数
       - 检查是否缺少前导0
       - 或者不是标准ASCII编码
    
    4. ASCII值超出范围
       - 32-126是可打印字符
       - 超出范围可能不是ASCII编码
    
    5. 字节序问题
       - 如果解码结果乱码，尝试反转字节序
    ```

!!! tip "实用技巧"
    ```python
    # 1. 快速查看十六进制
    import binascii
    text = "Hello"
    print(binascii.hexlify(text.encode()))
    
    # 2. 格式化输出
    data = bytes.fromhex("48656c6c6f")
    print(' '.join(f'{b:02x}' for b in data))  # 48 65 6c 6c 6f
    print(' '.join(f'{b:08b}' for b in data))  # 二进制
    
    # 3. 交互式转换
    while True:
        data = input("输入数据: ")
        print(auto_decode(data))
    ```

## 相关资源

- **RapidTables**: 快速进制转换在线工具
- **CyberChef**: From/To Hex/Binary等操作
- **Python struct模块**: 处理二进制数据
- **IEEE754可视化**: 理解浮点数表示
