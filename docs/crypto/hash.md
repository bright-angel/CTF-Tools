# 哈希函数

哈希函数将任意长度的数据映射为固定长度的值。

## 在线工具

### Hash在线计算
**链接**: [https://emn178.github.io/online-tools/](https://emn178.github.io/online-tools/)

**功能**: 多种哈希算法在线计算

**支持算法**:
- MD5
- SHA-1 / SHA-256 / SHA-512
- SHA-3
- RIPEMD-160
- 等等

### CrackStation
**链接**: [https://crackstation.net/](https://crackstation.net/)

**功能**: 哈希值在线破解

**特点**:
- 超大字典库(15GB+)
- 支持MD5、SHA1、SHA256等
- 免费快速

### MD5解密
**链接**: [https://www.cmd5.com/](https://www.cmd5.com/)

**功能**: MD5/SHA1解密查询

**特点**:
- 支持付费服务提高成功率
- 中文友好

### HashCat
**链接**: [https://hashcat.net/hashcat/](https://hashcat.net/hashcat/)

**功能**: 强大的离线密码破解工具

**特点**:
- GPU加速
- 支持数百种哈希算法
- 多种攻击模式

## 常见哈希算法

### MD5 (Message Digest 5)
**长度**: 128位 (32个十六进制字符)

**特点**:
- 速度快
- 已被证明不安全
- 存在碰撞攻击

**示例**:
```
Hello -> 8b1a9953c4611296a827abf8c47804d7
```

### SHA-1 (Secure Hash Algorithm 1)
**长度**: 160位 (40个十六进制字符)

**特点**:
- 比MD5更安全
- 2017年Google实现碰撞攻击
- 逐渐被淘汰

**示例**:
```
Hello -> f7ff9e8b7bb2e09b70935a5d785e0cc5d9d0abf0
```

### SHA-256
**长度**: 256位 (64个十六进制字符)

**特点**:
- SHA-2系列
- 目前安全
- 比特币使用

**示例**:
```
Hello -> 185f8db32271fe25f561a6fc938b2e264306ec304eda518007d1764826381969
```

### SHA-3
**长度**: 224/256/384/512位可选

**特点**:
- 最新标准(2015年)
- 基于Keccak算法
- 与SHA-2完全不同的设计

### bcrypt / scrypt / Argon2
**用途**: 密码存储专用

**特点**:
- 故意设计得慢
- 抵抗暴力破解
- 包含盐值(salt)

## 哈希相关攻击

### 长度扩展攻击
适用于MD5、SHA-1、SHA-256等Merkle-Damgård结构的哈希。

**工具**: [HashPump](https://github.com/bwall/HashPump)

**原理**: 在不知道原始数据的情况下，可以在哈希后的数据基础上追加内容并计算新哈希。

### 哈希碰撞
找到两个不同的输入产生相同的哈希值。

**应用**:
- 文件伪造
- 数字签名伪造
- MD5碰撞工具: FastColl

### 彩虹表攻击
**在线服务**:
- [https://www.rainbowtables.org/](https://www.rainbowtables.org/)
- [https://ophcrack.sourceforge.io/](https://ophcrack.sourceforge.io/)

**原理**: 预先计算大量密码的哈希值，查表即可破解。

**防御**: 使用盐值(Salt)

## CTF解题技巧

!!! tip "识别哈希类型"
    - 32位十六进制 → MD5
    - 40位十六进制 → SHA-1
    - 64位十六进制 → SHA-256
    - 以`$`分隔的格式 → 可能是bcrypt、scrypt等

!!! tip "破解思路"
    1. 先用在线网站查询（免费快速）
    2. 常见密码字典爆破
    3. 根据题目提示构造字典
    4. 使用HashCat GPU加速爆破

!!! warning "常见考点"
    - 弱密码破解
    - 长度扩展攻击
    - Hash碰撞
    - 彩虹表攻击
    - 多次哈希（MD5(MD5(xxx))）
    - 哈希加盐(Salt)
