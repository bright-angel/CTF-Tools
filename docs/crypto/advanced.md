# 密码学高级工具

包含RSA、AES、DES等现代密码学算法和工具。

## 在线工具

### RSA加密解密

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| RSA Calculator | [https://www.cs.drexel.edu/~jpopyack/IntroCS/RSA/RSAWorksheet.html](https://www.cs.drexel.edu/~jpopyack/IntroCS/RSA/RSAWorksheet.html) | RSA计算器 |
| RSA Encrypt | [https://www.devglan.com/online-tools/rsa-encryption-decryption](https://www.devglan.com/online-tools/rsa-encryption-decryption) | RSA在线加解密 |
| CTFever RSA | [https://ctfever.uniiem.com/tools/rsa](https://ctfever.uniiem.com/tools/rsa) | RSA工具 |

### AES/DES加密

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| AES Encryption | [https://www.devglan.com/online-tools/aes-encryption-decryption](https://www.devglan.com/online-tools/aes-encryption-decryption) | AES在线加解密 |
| DES Encrypt | [https://the-x.cn/cryptography/Des.aspx](https://the-x.cn/cryptography/Des.aspx) | DES在线加解密 |
| CryptoJS | [https://cryptojs.gitbook.io/docs/](https://cryptojs.gitbook.io/docs/) | JS加密库 |

### RC4加密

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| RC4 Online | [https://www.boxentriq.com/code-breaking/rc4-encryption](https://www.boxentriq.com/code-breaking/rc4-encryption) | RC4加解密 |
| CTFever RC4 | [https://ctfever.uniiem.com/tools/rc4](https://ctfever.uniiem.com/tools/rc4) | RC4工具 |

### ECC椭圆曲线

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| ECC Calculator | [https://andrea.corbellini.name/ecc/interactive/reals-add.html](https://andrea.corbellini.name/ecc/interactive/reals-add.html) | ECC可视化 |

### 密钥生成

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Key Generator | [https://travistidwell.com/jsencrypt/demo/](https://travistidwell.com/jsencrypt/demo/) | RSA密钥生成 |
| OpenSSL CSR | [https://www.selfsignedcertificate.com/](https://www.selfsignedcertificate.com/) | 证书生成 |

## 离线工具

### Python加密库 (PyCryptodome)

**安装**:
```bash
pip install pycryptodome
```

#### AES加密

**实现**:
```python
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
from Crypto.Random import get_random_bytes
import base64

# AES-ECB模式
def aes_ecb_encrypt(plaintext, key):
    """AES ECB加密"""
    cipher = AES.new(key, AES.MODE_ECB)
    padded = pad(plaintext.encode(), AES.block_size)
    ciphertext = cipher.encrypt(padded)
    return base64.b64encode(ciphertext).decode()

def aes_ecb_decrypt(ciphertext, key):
    """AES ECB解密"""
    cipher = AES.new(key, AES.MODE_ECB)
    decrypted = cipher.decrypt(base64.b64decode(ciphertext))
    return unpad(decrypted, AES.block_size).decode()

# AES-CBC模式
def aes_cbc_encrypt(plaintext, key, iv):
    """AES CBC加密"""
    cipher = AES.new(key, AES.MODE_CBC, iv)
    padded = pad(plaintext.encode(), AES.block_size)
    ciphertext = cipher.encrypt(padded)
    return base64.b64encode(ciphertext).decode()

def aes_cbc_decrypt(ciphertext, key, iv):
    """AES CBC解密"""
    cipher = AES.new(key, AES.MODE_CBC, iv)
    decrypted = cipher.decrypt(base64.b64decode(ciphertext))
    return unpad(decrypted, AES.block_size).decode()

# AES-CTR模式
def aes_ctr_encrypt(plaintext, key, nonce):
    """AES CTR加密"""
    cipher = AES.new(key, AES.MODE_CTR, nonce=nonce)
    ciphertext = cipher.encrypt(plaintext.encode())
    return base64.b64encode(ciphertext).decode()

def aes_ctr_decrypt(ciphertext, key, nonce):
    """AES CTR解密"""
    cipher = AES.new(key, AES.MODE_CTR, nonce=nonce)
    decrypted = cipher.decrypt(base64.b64decode(ciphertext))
    return decrypted.decode()

# 使用示例
key = b'Sixteen byte key'  # 16字节密钥 (AES-128)
# key = b'This is a 24-byte key!!!'  # 24字节 (AES-192)
# key = b'This is a 32-byte key for AES!!'  # 32字节 (AES-256)

plaintext = "Hello World"

# ECB模式
encrypted = aes_ecb_encrypt(plaintext, key)
print(f"AES-ECB加密: {encrypted}")
print(f"AES-ECB解密: {aes_ecb_decrypt(encrypted, key)}")

# CBC模式
iv = get_random_bytes(16)  # 16字节IV
encrypted = aes_cbc_encrypt(plaintext, key, iv)
print(f"AES-CBC加密: {encrypted}")
print(f"AES-CBC解密: {aes_cbc_decrypt(encrypted, key, iv)}")

# CTR模式
nonce = get_random_bytes(8)  # 8字节nonce
encrypted = aes_ctr_encrypt(plaintext, key, nonce)
print(f"AES-CTR加密: {encrypted}")
print(f"AES-CTR解密: {aes_ctr_decrypt(encrypted, key, nonce)}")
```

#### DES/3DES加密

**实现**:
```python
from Crypto.Cipher import DES, DES3
from Crypto.Util.Padding import pad, unpad
import base64

# DES加密
def des_encrypt(plaintext, key):
    """DES加密"""
    cipher = DES.new(key, DES.MODE_ECB)
    padded = pad(plaintext.encode(), DES.block_size)
    ciphertext = cipher.encrypt(padded)
    return base64.b64encode(ciphertext).decode()

def des_decrypt(ciphertext, key):
    """DES解密"""
    cipher = DES.new(key, DES.MODE_ECB)
    decrypted = cipher.decrypt(base64.b64decode(ciphertext))
    return unpad(decrypted, DES.block_size).decode()

# 3DES加密
def triple_des_encrypt(plaintext, key):
    """3DES加密"""
    cipher = DES3.new(key, DES3.MODE_ECB)
    padded = pad(plaintext.encode(), DES3.block_size)
    ciphertext = cipher.encrypt(padded)
    return base64.b64encode(ciphertext).decode()

def triple_des_decrypt(ciphertext, key):
    """3DES解密"""
    cipher = DES3.new(key, DES3.MODE_ECB)
    decrypted = cipher.decrypt(base64.b64decode(ciphertext))
    return unpad(decrypted, DES3.block_size).decode()

# 使用
key_des = b'8bytekey'  # DES: 8字节密钥
key_3des = b'This is 24 bytes key!!!!'  # 3DES: 16或24字节密钥

plaintext = "Hello World"

encrypted = des_encrypt(plaintext, key_des)
print(f"DES加密: {encrypted}")
print(f"DES解密: {des_decrypt(encrypted, key_des)}")

encrypted = triple_des_encrypt(plaintext, key_3des)
print(f"3DES加密: {encrypted}")
print(f"3DES解密: {triple_des_decrypt(encrypted, key_3des)}")
```

#### RSA加密

**实现**:
```python
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_v1_5, PKCS1_OAEP
from Crypto.Signature import pkcs1_15
from Crypto.Hash import SHA256
import base64

# 生成RSA密钥对
def generate_rsa_keypair(bits=2048):
    """生成RSA密钥对"""
    key = RSA.generate(bits)
    
    private_key = key.export_key()
    public_key = key.publickey().export_key()
    
    return private_key, public_key

# RSA加密解密
def rsa_encrypt(plaintext, public_key_pem):
    """RSA公钥加密"""
    public_key = RSA.import_key(public_key_pem)
    cipher = PKCS1_OAEP.new(public_key)
    ciphertext = cipher.encrypt(plaintext.encode())
    return base64.b64encode(ciphertext).decode()

def rsa_decrypt(ciphertext, private_key_pem):
    """RSA私钥解密"""
    private_key = RSA.import_key(private_key_pem)
    cipher = PKCS1_OAEP.new(private_key)
    plaintext = cipher.decrypt(base64.b64decode(ciphertext))
    return plaintext.decode()

# RSA签名验证
def rsa_sign(message, private_key_pem):
    """RSA签名"""
    private_key = RSA.import_key(private_key_pem)
    h = SHA256.new(message.encode())
    signature = pkcs1_15.new(private_key).sign(h)
    return base64.b64encode(signature).decode()

def rsa_verify(message, signature, public_key_pem):
    """RSA验证签名"""
    public_key = RSA.import_key(public_key_pem)
    h = SHA256.new(message.encode())
    try:
        pkcs1_15.new(public_key).verify(h, base64.b64decode(signature))
        return True
    except (ValueError, TypeError):
        return False

# CTF中的RSA攻击
def rsa_basic_attack(n, e, c):
    """基础RSA攻击（小指数、小模数等）"""
    
    # 1. 小指数攻击 (e=3)
    if e == 3:
        # 尝试直接开立方根
        import gmpy2
        m = gmpy2.iroot(c, 3)
        if m[1]:  # 完全立方数
            return int(m[0])
    
    # 2. 分解n（小模数）
    from sympy import factorint
    factors = factorint(n)
    
    if len(factors) == 2:
        p, q = list(factors.keys())
        phi = (p - 1) * (q - 1)
        d = pow(e, -1, phi)
        m = pow(c, d, n)
        return m
    
    return None

# 使用示例
private_key, public_key = generate_rsa_keypair(2048)

print("公钥:")
print(public_key.decode())
print("\n私钥:")
print(private_key.decode())

plaintext = "Hello World"

# 加密解密
encrypted = rsa_encrypt(plaintext, public_key)
print(f"\nRSA加密: {encrypted}")
decrypted = rsa_decrypt(encrypted, private_key)
print(f"RSA解密: {decrypted}")

# 签名验证
signature = rsa_sign(plaintext, private_key)
print(f"\nRSA签名: {signature}")
is_valid = rsa_verify(plaintext, signature, public_key)
print(f"签名验证: {is_valid}")
```

#### RC4加密

**实现**:
```python
def rc4_crypt(data, key):
    """RC4加密/解密（同一函数）"""
    # 初始化S盒
    S = list(range(256))
    j = 0
    
    # KSA密钥调度算法
    for i in range(256):
        j = (j + S[i] + key[i % len(key)]) % 256
        S[i], S[j] = S[j], S[i]
    
    # PRGA伪随机生成算法
    i = j = 0
    result = []
    
    for byte in data:
        i = (i + 1) % 256
        j = (j + S[i]) % 256
        S[i], S[j] = S[j], S[i]
        K = S[(S[i] + S[j]) % 256]
        result.append(byte ^ K)
    
    return bytes(result)

# 使用
key = b'SecretKey'
plaintext = b'Hello World'

encrypted = rc4_crypt(plaintext, key)
print(f"RC4加密: {encrypted.hex()}")

decrypted = rc4_crypt(encrypted, key)
print(f"RC4解密: {decrypted.decode()}")
```

#### 密码学工具函数

**实现**:
```python
import gmpy2
from sympy import nextprime, prevprime
from Crypto.Util.number import getPrime, inverse, long_to_bytes, bytes_to_long

# 扩展欧几里得算法
def egcd(a, b):
    """扩展欧几里得算法"""
    if b == 0:
        return a, 1, 0
    else:
        g, x, y = egcd(b, a % b)
        return g, y, x - (a // b) * y

# 模逆元
def modinv(a, m):
    """计算模逆元"""
    g, x, _ = egcd(a, m)
    if g != 1:
        raise Exception('Modular inverse does not exist')
    return x % m

# 中国剩余定理
def crt(remainders, moduli):
    """中国剩余定理"""
    total = 0
    prod = 1
    for m in moduli:
        prod *= m
    
    for r, m in zip(remainders, moduli):
        p = prod // m
        total += r * modinv(p, m) * p
    
    return total % prod

# RSA常见攻击参数
def rsa_common_attacks(n, e, c):
    """RSA常见攻击"""
    
    # 1. Wiener's Attack (小私钥指数)
    def wiener_attack(e, n):
        from sympy import continued_fraction
        cf = continued_fraction(e / n)
        convergents = cf.convergents()
        
        for conv in convergents:
            k = conv.p
            d = conv.q
            
            if k == 0:
                continue
            
            phi = (e * d - 1) // k
            
            # 求解方程 x^2 - (n - phi + 1)x + n = 0
            import math
            b = n - phi + 1
            delta = b * b - 4 * n
            
            if delta >= 0:
                sqrt_delta = int(math.sqrt(delta))
                if sqrt_delta * sqrt_delta == delta:
                    return d
        
        return None
    
    # 2. 费马分解（p和q接近）
    def fermat_factorization(n):
        import gmpy2
        a = gmpy2.isqrt(n) + 1
        b2 = a * a - n
        
        while not gmpy2.is_square(b2):
            a += 1
            b2 = a * a - n
        
        b = gmpy2.isqrt(b2)
        p = a - b
        q = a + b
        
        return int(p), int(q)
    
    # 3. 共模攻击
    def common_modulus_attack(n, e1, e2, c1, c2):
        """共模攻击（同一明文，同一模数，不同指数）"""
        gcd, s, t = egcd(e1, e2)
        
        if gcd != 1:
            return None
        
        if s < 0:
            c1 = modinv(c1, n)
            s = -s
        if t < 0:
            c2 = modinv(c2, n)
            t = -t
        
        m = (pow(c1, s, n) * pow(c2, t, n)) % n
        return m
    
    return None

# 使用示例
# 计算模逆元
print(modinv(3, 11))  # 4

# 中国剩余定理
remainders = [2, 3, 2]
moduli = [3, 5, 7]
result = crt(remainders, moduli)
print(f"CRT结果: {result}")  # 23
```

### OpenSSL命令行

**基本使用**:
```bash
# AES加密
openssl enc -aes-256-cbc -in plaintext.txt -out encrypted.bin -k password

# AES解密
openssl enc -d -aes-256-cbc -in encrypted.bin -out decrypted.txt -k password

# Base64编码
openssl enc -base64 -in file.txt -out file.b64

# 生成RSA密钥对
openssl genrsa -out private.pem 2048
openssl rsa -in private.pem -pubout -out public.pem

# RSA加密
openssl rsautl -encrypt -pubin -inkey public.pem -in plaintext.txt -out encrypted.bin

# RSA解密
openssl rsautl -decrypt -inkey private.pem -in encrypted.bin -out decrypted.txt

# 查看证书信息
openssl x509 -in cert.pem -text -noout

# MD5/SHA哈希
openssl dgst -md5 file.txt
openssl dgst -sha256 file.txt
```

## CTF解题技巧

!!! tip "AES模式识别"
    ```
    ECB模式:
    - 相同明文块加密结果相同
    - 不需要IV
    - 不安全，但CTF常见
    
    CBC模式:
    - 需要16字节IV
    - 前一块密文作为下一块的IV
    - Padding Oracle攻击
    
    CTR模式:
    - 流加密模式
    - 需要nonce
    - 密文可XOR攻击
    
    识别方法:
    - 查看密文长度
    - 是否有IV参数
    - 尝试不同模式解密
    ```

!!! tip "RSA常见攻击"
    ```
    1. 小指数攻击 (e=3)
       - 直接开立方根
    
    2. 小模数分解
       - yafu, factordb.com
    
    3. Wiener攻击 (d很小)
       - 连分数攻击
    
    4. 共模攻击
       - 同一n，不同e
    
    5. 低加密指数广播攻击
       - 同一明文，不同n
       - 使用中国剩余定理
    
    6. 费马分解
       - p和q接近时
    
    7. 已知部分明文
       - Franklin-Reiter攻击
    ```

!!! tip "密钥长度"
    ```
    AES:
    - 128位: 16字节密钥
    - 192位: 24字节密钥
    - 256位: 32字节密钥
    
    DES:
    - 56位有效位: 8字节密钥
    
    3DES:
    - 112位: 16字节密钥
    - 168位: 24字节密钥
    
    RSA:
    - 常见: 1024, 2048, 4096位
    
    RC4:
    - 可变长度: 1-256字节
    ```

!!! tip "Padding攻击"
    ```
    PKCS#7 Padding:
    - 填充字节值=填充长度
    - 例: ...03 03 03
    
    Padding Oracle攻击:
    - CBC模式下的攻击
    - 利用padding验证错误
    - 逐字节爆破明文
    
    工具:
    - PadBuster
    - padbuster.py
    ```

!!! warning "常见错误"
    ```
    1. 密钥格式错误
       - Base64编码/十六进制
       - 字符串/字节串转换
    
    2. Padding错误
       - 密文长度必须是块大小倍数
       - 检查padding方式
    
    3. IV缺失
       - CBC/CFB/OFB模式需要IV
       - IV通常在密文前面
    
    4. 模式选择错误
       - 尝试所有常见模式
       - ECB最简单，优先尝试
    
    5. 字节序问题
       - Big-endian vs Little-endian
    ```

!!! tip "工具选择"
    ```
    Python库:
    - PyCryptodome (推荐)
    - cryptography
    - gmpy2 (RSA攻击)
    
    命令行:
    - OpenSSL
    - RsaCtfTool
    - yafu (分解)
    
    在线工具:
    - CyberChef
    - factordb.com
    - Alpertron (分解)
    ```

## 相关资源

- **PyCryptodome**: Python密码学库
- **OpenSSL**: 命令行加密工具
- **RsaCtfTool**: RSA攻击工具集
- **factordb.com**: 大整数分解数据库
- **CyberChef**: 在线加密解密
