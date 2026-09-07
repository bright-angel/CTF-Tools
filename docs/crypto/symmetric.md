# 对称加密工具

对称加密使用相同的密钥进行加密和解密。

## 在线工具

### AES加密解密

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| DevGlan AES | [https://www.devglan.com/online-tools/aes-encryption-decryption](https://www.devglan.com/online-tools/aes-encryption-decryption) | 支持AES-128/192/256 |
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 全能工具，支持多种模式 |
| SoJSON AES | [https://www.sojson.com/encrypt_aes.html](https://www.sojson.com/encrypt_aes.html) | 中文界面 |

### DES/3DES加密解密

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| 茶凑 3DES | [http://tool.chacuo.net/crypt3des](http://tool.chacuo.net/crypt3des) | 3DES在线加解密 |
| SoJSON DES | [https://www.sojson.com/encrypt_des.html](https://www.sojson.com/encrypt_des.html) | DES/3DES支持 |
| BugKu 3DES | [https://ctf.bugku.com/tool/tripledes](https://ctf.bugku.com/tool/tripledes) | CTF专用 |

### 多算法加密工具

| 工具名称 | 链接 | 支持算法 |
|---------|------|----------|
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | AES/DES/3DES/RC4/Blowfish等 |

## 离线工具

### OpenSSL

**安装**:
```bash
# Linux
apt install openssl

# macOS (预装)
brew install openssl

# Windows
从官网下载或使用Git Bash
```

**AES加密解密**:
```bash
# AES-256-CBC 加密（文件）
openssl enc -aes-256-cbc -salt -in plain.txt -out encrypted.bin -k password

# AES-256-CBC 解密
openssl enc -d -aes-256-cbc -in encrypted.bin -out decrypted.txt -k password

# 使用密钥文件
openssl enc -aes-256-cbc -in plain.txt -out encrypted.bin -pass file:keyfile

# Base64输出
openssl enc -aes-256-cbc -a -salt -in plain.txt -out encrypted.txt -k password

# 指定IV（初始化向量）
openssl enc -aes-256-cbc -in plain.txt -out encrypted.bin -K <hex_key> -iv <hex_iv>
```

**DES/3DES加密解密**:
```bash
# DES加密
openssl enc -des-cbc -in plain.txt -out encrypted.bin -k password

# 3DES加密
openssl enc -des3 -in plain.txt -out encrypted.bin -k password

# 3DES解密
openssl enc -d -des3 -in encrypted.bin -out decrypted.txt -k password
```

**支持的算法列表**:
```bash
# 查看所有支持的加密算法
openssl enc -list

# 常用算法
aes-128-cbc, aes-192-cbc, aes-256-cbc
aes-128-ecb, aes-256-ecb
des-cbc, des-ecb, des3
rc4, rc2
blowfish
```

### Python Cryptography库

**安装**:
```bash
pip install cryptography
```

**AES加密示例**:
```python
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import padding
import os

def aes_encrypt(plaintext, key):
    """AES-CBC加密"""
    # 生成随机IV
    iv = os.urandom(16)
    
    # Padding
    padder = padding.PKCS7(128).padder()
    padded_data = padder.update(plaintext.encode()) + padder.finalize()
    
    # 加密
    cipher = Cipher(
        algorithms.AES(key),
        modes.CBC(iv),
        backend=default_backend()
    )
    encryptor = cipher.encryptor()
    ciphertext = encryptor.update(padded_data) + encryptor.finalize()
    
    return iv + ciphertext  # IV + 密文

def aes_decrypt(ciphertext, key):
    """AES-CBC解密"""
    # 分离IV和密文
    iv = ciphertext[:16]
    actual_ciphertext = ciphertext[16:]
    
    # 解密
    cipher = Cipher(
        algorithms.AES(key),
        modes.CBC(iv),
        backend=default_backend()
    )
    decryptor = cipher.decryptor()
    padded_plaintext = decryptor.update(actual_ciphertext) + decryptor.finalize()
    
    # 去除padding
    unpadder = padding.PKCS7(128).unpadder()
    plaintext = unpadder.update(padded_plaintext) + unpadder.finalize()
    
    return plaintext.decode()

# 使用
key = b'Sixteen byte key'  # 16字节密钥（AES-128）
plaintext = "Hello World"
encrypted = aes_encrypt(plaintext, key)
decrypted = aes_decrypt(encrypted, key)
print(f"解密结果: {decrypted}")
```

**DES加密示例**:
```python
from Crypto.Cipher import DES
from Crypto.Util.Padding import pad, unpad

def des_encrypt(plaintext, key):
    """DES-CBC加密"""
    cipher = DES.new(key, DES.MODE_CBC)
    ct_bytes = cipher.encrypt(pad(plaintext.encode(), DES.block_size))
    return cipher.iv + ct_bytes

def des_decrypt(ciphertext, key):
    """DES-CBC解密"""
    iv = ciphertext[:8]
    ct = ciphertext[8:]
    cipher = DES.new(key, DES.MODE_CBC, iv)
    pt = unpad(cipher.decrypt(ct), DES.block_size)
    return pt.decode()

# 使用
key = b'8bytekey'  # DES密钥必须8字节
plaintext = "Hello World"
encrypted = des_encrypt(plaintext, key)
decrypted = des_decrypt(encrypted, key)
```

## 加密模式详解

### 常见加密模式

| 模式 | 全称 | 特点 | 是否需要IV |
|------|------|------|-----------|
| ECB | Electronic Codebook | 最简单，不安全 | 否 |
| CBC | Cipher Block Chaining | 最常用 | 是 |
| CFB | Cipher Feedback | 流加密模式 | 是 |
| OFB | Output Feedback | 流加密模式 | 是 |
| CTR | Counter | 可并行处理 | 是（Nonce） |
| GCM | Galois/Counter Mode | 提供认证 | 是 |

### ECB模式（不推荐）

**特点**:
- 相同明文块产生相同密文块
- 不安全，会泄露模式
- 企鹅图片测试可见

**识别方法**:
```
如果加密两个相同的明文块，得到相同的密文块 → ECB模式
```

### CBC模式（推荐）

**特点**:
- 每个块依赖前一个块
- 第一个块使用IV
- 最常用的模式

**IV的重要性**:
- IV必须随机
- 相同密钥+相同IV = 不安全
- IV可以公开，但必须不可预测

### Padding方式

| Padding | 说明 | 示例（块大小8） |
|---------|------|----------------|
| PKCS7 | 填充字节值=填充长度 | `...03 03 03` |
| PKCS5 | PKCS7限定块大小8 | 同上 |
| ZeroPadding | 填充0x00 | `...00 00 00` |
| NoPadding | 不填充（需对齐） | 原文 |

## 算法对比

| 算法 | 密钥长度 | 块大小 | 安全性 | 速度 |
|------|---------|--------|--------|------|
| DES | 56位 | 64位 | ❌ 已破解 | 快 |
| 3DES | 168位 | 64位 | ⚠️ 较弱 | 慢 |
| AES-128 | 128位 | 128位 | ✅ 安全 | 很快 |
| AES-192 | 192位 | 128位 | ✅ 安全 | 很快 |
| AES-256 | 256位 | 128位 | ✅ 非常安全 | 很快 |
| RC4 | 40-2048位 | 流密码 | ❌ 有漏洞 | 很快 |
| Blowfish | 32-448位 | 64位 | ⚠️ 较旧 | 快 |

## CTF解题技巧

!!! tip "密钥获取"
    1. 题目描述中隐藏
    2. 图片、注释、文件名
    3. 弱密钥爆破（常见密码）
    4. 密钥长度推测（根据算法）

!!! tip "加密模式识别"
    - **ECB**: 相同明文块→相同密文块
    - **CBC**: 需要IV，第一个块依赖IV
    - **查看密文**: 是否有重复模式

!!! warning "常见陷阱"
    - Padding方式错误导致解密失败
    - IV缺失或错误
    - 密钥编码问题（hex/base64/raw）
    - 输入输出格式不匹配

!!! tip "快速解题"
    ```python
    # CyberChef常用操作流程
    1. From Hex (如果密文是十六进制)
    2. AES Decrypt
       - 设置密钥（可能需要From Hex）
       - 选择模式（通常CBC）
       - 设置IV（如果有）
    3. 查看结果
    ```

## 相关资源

- **在线工具集合**: CyberChef包含所有常用对称加密
- **密钥长度**: AES密钥必须16/24/32字节
- **IV长度**: 通常等于块大小（AES=16字节，DES=8字节）
