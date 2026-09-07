# 非对称加密

非对称加密使用公钥加密、私钥解密（或相反）。

## 在线工具

### RSA加密解密
**链接**: [https://www.devglan.com/online-tools/rsa-encryption-decryption](https://www.devglan.com/online-tools/rsa-encryption-decryption)

**功能**: RSA在线加解密

**特点**:
- 支持密钥生成
- 支持公钥加密、私钥解密
- 支持数字签名

### RSA Calculator
**链接**: [https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html](https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html)

**功能**: RSA计算器，教学用途

**特点**:
- 显示RSA运算过程
- 适合理解RSA原理

### RsaCtfTool
**链接**: [https://github.com/RsaCtfTool/RsaCtfTool](https://github.com/RsaCtfTool/RsaCtfTool)

**功能**: CTF中RSA攻击工具集

**特点**:
- 自动尝试多种RSA攻击方法
- 支持多种参数输入
- CTF必备工具

## RSA算法

### 基本原理
**公钥**: (n, e)  
**私钥**: (n, d)

**加密**: c = m^e mod n  
**解密**: m = c^d mod n

其中: n = p × q (p和q为大质数)

### 常见攻击方法

#### 1. 小公钥指数攻击 (e=3)
当e很小且m^e < n时，可以直接开e次方根。

#### 2. 共模攻击
相同的n，不同的e加密相同的消息。

#### 3. 小私钥指数攻击 (Wiener's Attack)
当d比较小时，可以用连分数攻击。

#### 4. 费马分解
当p和q接近时，可以用费马方法快速分解n。

#### 5. 公约数攻击
多个n之间可能存在公因数，用GCD可以分解。

#### 6. 低加密指数广播攻击 (Håstad's Attack)
相同的消息用相同的小e发送给多个接收者。

#### 7. 侧信道攻击
通过加密时间、功耗等信息推测密钥。

## ECC (椭圆曲线加密)

### 在线工具
**CyberChef**: [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/)

**特点**:
- 更短的密钥长度
- 相同安全性下性能更好
- 逐渐流行

### 常用曲线
- secp256k1 (比特币使用)
- secp256r1 / P-256
- Curve25519

## Diffie-Hellman密钥交换

### 原理
允许双方在不安全信道上建立共享密钥。

**步骤**:
1. 协商公共参数 g, p
2. A选择私钥a，发送 g^a mod p
3. B选择私钥b，发送 g^b mod p
4. 双方计算共享密钥 K = g^(ab) mod p

### 在线计算
**链接**: [https://www.cryptool.org/en/cto/dh](https://www.cryptool.org/en/cto/dh)

## CTF解题技巧

!!! tip "RSA题目思路"
    1. 检查n的位数是否可以直接分解
    2. 检查e的大小（小e攻击、大e可能是Wiener攻击）
    3. 检查d的大小（小d攻击）
    4. 多个加密消息时考虑共模攻击或广播攻击
    5. 使用RsaCtfTool自动化尝试

!!! tip "参数获取"
    - 从PEM文件提取: `openssl rsa -pubin -in public.pem -text`
    - 从证书提取: `openssl x509 -in cert.pem -text`
    - Python读取: 使用`Crypto.PublicKey.RSA`

!!! warning "常见问题"
    - 注意大数精度问题
    - 模逆运算的前提条件（互质）
    - 填充方案(PKCS1, OAEP)影响攻击方式
