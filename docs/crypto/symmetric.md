# 对称加密

对称加密使用相同的密钥进行加密和解密。

## 在线工具

### CyberChef
**链接**: [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/)

**功能**: 全能型加密解密工具

**支持算法**:
- AES (128/192/256)
- DES / 3DES
- RC4
- Blowfish
- 等等

**特点**:
- 支持多种加密模式(ECB, CBC, CFB, OFB, CTR等)
- 可视化操作流程
- 支持多种输入输出格式

### AES在线加密解密
**链接**: [https://www.devglan.com/online-tools/aes-encryption-decryption](https://www.devglan.com/online-tools/aes-encryption-decryption)

**功能**: AES专用工具

**特点**:
- 支持AES-128/192/256
- 支持ECB/CBC模式
- 简单易用

### DES在线加密解密
**链接**: [https://www.sojson.com/encrypt_des.html](https://www.sojson.com/encrypt_des.html)

**功能**: DES/3DES加密解密

## 常见对称加密算法

### AES (Advanced Encryption Standard)
**密钥长度**: 128/192/256位

**加密模式**:
- **ECB** (电子密码本): 最简单，不推荐用于实际应用
- **CBC** (密码块链接): 需要IV，最常用
- **CFB** (密码反馈): 流加密模式
- **OFB** (输出反馈): 流加密模式
- **CTR** (计数器): 可并行处理
- **GCM** (伽罗瓦计数器): 提供认证

**CTF中的特点**:
- 需要注意填充方式(PKCS7/PKCS5/ZeroPadding)
- IV(初始化向量)的获取
- 密钥长度的判断

### DES (Data Encryption Standard)
**密钥长度**: 56位(实际64位，8位校验)

**特点**:
- 已被认为不安全
- CTF中仍常出现
- 加密速度快

### 3DES (Triple DES)
**密钥长度**: 168位

**特点**:
- 三次DES操作(加密-解密-加密)
- 比DES安全但速度慢
- 逐渐被AES取代

### RC4
**密钥长度**: 40-2048位

**特点**:
- 流加密算法
- 实现简单
- 已发现多个安全漏洞

## CTF解题技巧

!!! tip "密钥相关"
    1. 密钥可能在题目中隐藏（图片、注释、文件名等）
    2. 弱密钥爆破（常见密码字典）
    3. 密钥长度推测（根据密文和算法）

!!! tip "加密模式识别"
    - ECB模式：相同明文块产生相同密文块（企鹅图片测试）
    - CBC模式：需要IV，第一个块依赖IV
    - 其他模式根据IV使用方式判断

!!! warning "常见陷阱"
    - Padding方式错误导致解密失败
    - IV缺失或错误
    - 密钥编码问题(hex/base64/raw)
    - 输入输出格式不匹配
