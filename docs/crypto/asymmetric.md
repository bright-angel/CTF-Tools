# 非对称加密工具

非对称加密使用公钥加密、私钥解密（或相反）。

## 在线工具

### RSA加密解密

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| DevGlan RSA | [https://www.devglan.com/online-tools/rsa-encryption-decryption](https://www.devglan.com/online-tools/rsa-encryption-decryption) | 支持密钥生成和数字签名 |
| RSA Calculator | [https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html](https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html) | 教学用途，显示运算过程 |
| CTF在线 RSA | [https://ctf.ssleye.com/ciphey.html](https://ctf.ssleye.com/ciphey.html) | CTF专用 |
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 全能工具 |

### 大数分解工具

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| FactorDB | [http://factordb.com/](http://factordb.com/) | 大数分解数据库 |
| Alpertron | [https://www.alpertron.com.ar/ECM.HTM](https://www.alpertron.com.ar/ECM.HTM) | 在线因数分解 |

### DH密钥交换

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| CrypTool | [https://www.cryptool.org/en/cto/dh](https://www.cryptool.org/en/cto/dh) | DH密钥交换演示 |

## 离线工具

### RsaCtfTool

**下载链接**:
```
https://github.com/RsaCtfTool/RsaCtfTool
```

**安装**:
```bash
git clone https://github.com/RsaCtfTool/RsaCtfTool.git
cd RsaCtfTool
pip install -r requirements.txt
```

**基本使用**:
```bash
# 从公钥文件攻击
python RsaCtfTool.py --publickey public.pem --private

# 已知n和e
python RsaCtfTool.py -n 123456789 -e 65537 --private

# 解密密文
python RsaCtfTool.py --publickey public.pem --uncipherfile cipher.txt

# 自动尝试所有攻击
python RsaCtfTool.py --publickey public.pem --uncipherfile cipher.txt --attack all

# 指定攻击方法
python RsaCtfTool.py -n 123456789 -e 65537 --attack factordb
python RsaCtfTool.py -n 123456789 -e 65537 --attack wiener
python RsaCtfTool.py -n 123456789 -e 65537 --attack fermat

# 多个密文（共模攻击）
python RsaCtfTool.py --publickey pub1.pem --publickey pub2.pem --uncipherfile c1.txt --uncipherfile c2.txt
```

**支持的攻击类型**:
- factordb: 从FactorDB查询n的分解
- wiener: Wiener小私钥指数攻击
- fermat: 费马分解（p和q接近时）
- noveltyprimes: 特殊形式的质数
- smallq: 小q攻击
- pastctfprimes: 历史CTF题目中的质数
- commonfactors: 多个n的公因数攻击
- hastads: Håstad广播攻击
- smallfraction: 小分数攻击
- boneh_durfee: Boneh-Durfee攻击（d较小）
- comfact_cn: 中国剩余定理攻击

### OpenSSL

**RSA密钥生成**:
```bash
# 生成私钥
openssl genrsa -out private.pem 2048

# 从私钥提取公钥
openssl rsa -in private.pem -pubout -out public.pem

# 查看私钥内容
openssl rsa -in private.pem -text -noout

# 查看公钥内容（提取n和e）
openssl rsa -pubin -in public.pem -text -noout
```

**RSA加密解密**:
```bash
# 公钥加密
openssl rsautl -encrypt -pubin -inkey public.pem -in plain.txt -out cipher.bin

# 私钥解密
openssl rsautl -decrypt -inkey private.pem -in cipher.bin -out plain.txt

# 私钥签名
openssl rsautl -sign -inkey private.pem -in message.txt -out signature.bin

# 公钥验证签名
openssl rsautl -verify -pubin -inkey public.pem -in signature.bin
```

**格式转换**:
```bash
# PEM转DER
openssl rsa -in private.pem -outform DER -out private.der

# DER转PEM
openssl rsa -in private.der -inform DER -out private.pem

# 从证书提取公钥
openssl x509 -in cert.pem -pubkey -noout > public.pem
```

### Python实现

**安装依赖**:
```bash
pip install pycryptodome
```

**RSA加密解密**:
```python
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP
from Crypto.Signature import pkcs1_15
from Crypto.Hash import SHA256

# 生成密钥对
key = RSA.generate(2048)
private_key = key.export_key()
public_key = key.publickey().export_key()

# 保存密钥
with open('private.pem', 'wb') as f:
    f.write(private_key)
with open('public.pem', 'wb') as f:
    f.write(public_key)

# 加密
public_key = RSA.import_key(open('public.pem').read())
cipher = PKCS1_OAEP.new(public_key)
ciphertext = cipher.encrypt(b"Hello World")

# 解密
private_key = RSA.import_key(open('private.pem').read())
cipher = PKCS1_OAEP.new(private_key)
plaintext = cipher.decrypt(ciphertext)
print(plaintext.decode())
```

**手动实现RSA攻击**:
```python
import gmpy2
from Crypto.Util.number import long_to_bytes, bytes_to_long

# 小公钥指数攻击（e=3, m^3 < n）
def small_e_attack(c, e, n):
    """当e很小且m^e < n时，直接开e次方根"""
    m, exact = gmpy2.iroot(c, e)
    if exact:
        return long_to_bytes(int(m))
    return None

# 费马分解（p和q接近）
def fermat_factorization(n):
    """费马分解，适用于p和q接近的情况"""
    a = gmpy2.isqrt(n) + 1
    b2 = a * a - n
    while not gmpy2.is_square(b2):
        a += 1
        b2 = a * a - n
    b = gmpy2.isqrt(b2)
    p = a + b
    q = a - b
    return int(p), int(q)

# 共模攻击
def common_modulus_attack(c1, c2, e1, e2, n):
    """相同n，不同e加密相同消息"""
    # 扩展欧几里得算法求s和t使得 e1*s + e2*t = gcd(e1,e2) = 1
    gcd, s, t = gmpy2.gcdext(e1, e2)
    if gcd != 1:
        return None
    
    # 处理负指数
    if s < 0:
        c1 = gmpy2.invert(c1, n)
        s = -s
    if t < 0:
        c2 = gmpy2.invert(c2, n)
        t = -t
    
    m = (pow(c1, s, n) * pow(c2, t, n)) % n
    return long_to_bytes(int(m))

# Wiener攻击（d较小）
def wiener_attack(e, n):
    """使用连分数攻击小私钥指数d"""
    from fractions import Fraction
    
    # 连分数展开
    convergents = []
    frac = Fraction(e, n)
    
    while frac.denominator != 1:
        convergents.append(frac)
        whole = int(frac)
        frac = frac - whole
        if frac != 0:
            frac = 1 / frac
    
    # 测试每个收敛项
    for frac in convergents:
        k = frac.numerator
        d = frac.denominator
        
        if k == 0:
            continue
            
        phi = (e * d - 1) // k
        
        # 解方程 x^2 - ((n-phi+1))x + n = 0
        b = n - phi + 1
        discriminant = b * b - 4 * n
        
        if discriminant >= 0:
            sqrt_d = gmpy2.isqrt(discriminant)
            if sqrt_d * sqrt_d == discriminant:
                return d
    
    return None

# 使用示例
n = 123456789
e = 3
c = 98765432

# 尝试小e攻击
plaintext = small_e_attack(c, e, n)
if plaintext:
    print(f"解密成功: {plaintext}")
```

## RSA算法详解

### 基本原理

**密钥生成**:
1. 选择两个大质数 p 和 q
2. 计算 n = p × q
3. 计算 φ(n) = (p-1)(q-1)
4. 选择公钥指数 e，满足 1 < e < φ(n) 且 gcd(e, φ(n)) = 1
5. 计算私钥指数 d，满足 d × e ≡ 1 (mod φ(n))

**公钥**: (n, e)  
**私钥**: (n, d)

**加密**: c = m^e mod n  
**解密**: m = c^d mod n

### 常见攻击方法

| 攻击方法 | 适用条件 | 工具 |
|---------|---------|------|
| FactorDB查询 | n较小或已知 | RsaCtfTool |
| 小公钥指数攻击 | e小(如3)且m^e<n | 手动开方 |
| Wiener攻击 | d < n^0.25 | RsaCtfTool |
| 费马分解 | \|p-q\|较小 | RsaCtfTool, yafu |
| 公因数攻击 | 多个n有公因数 | gcd |
| 共模攻击 | 相同n不同e | 扩展欧几里得 |
| Håstad广播攻击 | 小e多次加密 | 中国剩余定理 |
| Boneh-Durfee | d < n^0.292 | RsaCtfTool |

### 小公钥指数攻击 (e=3)

**原理**: 当e很小且m^e < n时，密文c = m^e就是普通整数，直接开e次方根即可。

**示例**:
```python
import gmpy2
from Crypto.Util.number import long_to_bytes

c = 123456789  # 密文
e = 3

# 直接开立方根
m, exact = gmpy2.iroot(c, e)
if exact:
    print(long_to_bytes(int(m)))
```

### 共模攻击

**原理**: 相同的n，不同的e加密相同的消息m。已知c1=m^e1 mod n和c2=m^e2 mod n，可以恢复m。

**条件**: gcd(e1, e2) = 1

### 费马分解

**原理**: 当p和q接近时，n = p×q ≈ p²，从√n开始搜索。

**适用**: |p-q| 较小

### Wiener攻击

**原理**: 当d较小（d < N^0.25）时，可以用连分数算法恢复d。

**检测**: e/n的连分数收敛项

## ECC（椭圆曲线加密）

### 常用曲线

| 曲线名称 | 位数 | 应用 |
|---------|------|------|
| secp256k1 | 256 | 比特币、以太坊 |
| secp256r1 (P-256) | 256 | TLS、通用 |
| Curve25519 | 255 | Signal、SSH |
| Ed25519 | 255 | 签名专用 |

### Python实现

```bash
pip install ecdsa
```

```python
from ecdsa import SigningKey, SECP256k1

# 生成密钥对
private_key = SigningKey.generate(curve=SECP256k1)
public_key = private_key.get_verifying_key()

# 签名
message = b"Hello World"
signature = private_key.sign(message)

# 验证
assert public_key.verify(signature, message)
```

## Diffie-Hellman密钥交换

### 原理

允许双方在不安全信道上建立共享密钥。

**步骤**:
1. 协商公共参数 g, p（p为质数）
2. A选择私钥a，计算并发送 A = g^a mod p
3. B选择私钥b，计算并发送 B = g^b mod p
4. A计算共享密钥: K = B^a mod p = g^(ab) mod p
5. B计算共享密钥: K = A^b mod p = g^(ab) mod p

**安全性**: 基于离散对数问题的困难性

### Python实现

```python
import random

# 公共参数
p = 23  # 质数
g = 5   # 原根

# Alice
a = random.randint(1, p-1)  # 私钥
A = pow(g, a, p)            # 公开值

# Bob  
b = random.randint(1, p-1)  # 私钥
B = pow(g, b, p)            # 公开值

# 计算共享密钥
K_alice = pow(B, a, p)  # Alice计算
K_bob = pow(A, b, p)    # Bob计算

assert K_alice == K_bob  # 密钥相同
print(f"共享密钥: {K_alice}")
```

## CTF解题技巧

!!! tip "RSA题目思路"
    1. **检查n的大小**: 小于2048位可能能直接分解
    2. **检查e**: 
       - e=3: 小公钥指数攻击
       - e很大: 可能是Wiener攻击
    3. **检查d**: 题目给出d时注意d大小
    4. **多个密文**: 共模攻击或广播攻击
    5. **使用RsaCtfTool**: 自动尝试所有方法

!!! tip "参数提取"
    ```bash
    # 从公钥PEM提取n和e
    openssl rsa -pubin -in public.pem -text -noout
    
    # 从私钥PEM提取所有参数
    openssl rsa -in private.pem -text -noout
    
    # Python读取
    from Crypto.PublicKey import RSA
    key = RSA.import_key(open('public.pem').read())
    print(f"n = {key.n}")
    print(f"e = {key.e}")
    ```

!!! tip "快速检查"
    ```python
    # 检查n是否在FactorDB中
    import requests
    r = requests.get(f"http://factordb.com/api?query={n}")
    
    # 检查p和q是否接近（费马分解）
    import gmpy2
    if abs(p - q) < n**0.25:
        print("可能适用费马分解")
    
    # 检查e和phi(n)
    if e > 0.5 * n:
        print("e较大，可能是Wiener攻击")
    ```

!!! warning "常见陷阱"
    - **大数精度**: Python 3的int可以任意大，但要注意运算效率
    - **模逆不存在**: gcd(a, n) ≠ 1时模逆不存在
    - **填充方案**: PKCS#1 v1.5、OAEP等影响密文格式
    - **编码问题**: long_to_bytes转换时注意字节序

!!! tip "工具组合"
    ```bash
    # 1. 先用RsaCtfTool自动尝试
    python RsaCtfTool.py --publickey pub.pem --uncipherfile cipher.txt --attack all
    
    # 2. 手动检查FactorDB
    http://factordb.com/index.php?query=<n>
    
    # 3. 用yafu分解
    yafu "factor(<n>)"
    
    # 4. 特殊攻击脚本
    # GitHub搜索: rsa ctf attack
    ```

## 相关资源

- **RsaCtfTool**: 自动化RSA攻击工具集
- **FactorDB**: 大数分解数据库，收录历史分解结果
- **yafu**: 强大的因数分解工具
- **SageMath**: 数学计算环境，适合实现复杂攻击
