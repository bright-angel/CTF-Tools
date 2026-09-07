# 哈希函数与破解工具

哈希函数及其破解工具，包含在线查询和离线破解方案。

## 在线工具

### MD5在线破解

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| CMD5 | [https://www.cmd5.com/](https://www.cmd5.com/) | 老牌MD5解密站 |
| CMD5.la | [https://cmd5.la/](https://cmd5.la/) | 备用站点 |
| PMD5 | [https://pmd5.com/](https://pmd5.com/) | 快速查询 |
| ChaMD5 | [https://www.chamd5.org/](https://www.chamd5.org/) | 付费，成功率高 |
| SoMD5 | [https://www.somd5.com/](https://www.somd5.com/) | 综合查询 |
| CrackStation | [https://crackstation.net/](https://crackstation.net/) | 15GB+字典库 |

### 多算法哈希破解

| 工具名称 | 链接 | 支持算法 |
|---------|------|----------|
| Hashes.com | [https://hashes.com/en/decrypt/hash](https://hashes.com/en/decrypt/hash) | MD5/SHA1/SHA256/NTLM等 |
| OnlineHashCrack | [https://www.onlinehashcrack.com/](https://www.onlinehashcrack.com/) | 40+种算法 |
| CrackStation | [https://crackstation.net/](https://crackstation.net/) | MD5/SHA1/SHA256/NTLM |

### 哈希计算（在线）

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| MD5 Online | [https://md5.gromweb.com/](https://md5.gromweb.com/) | MD5计算 |
| SHA256 Online | [https://emn178.github.io/online-tools/sha256.html](https://emn178.github.io/online-tools/sha256.html) | SHA256计算 |
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 全能工具 |

## 离线工具

### Hashcat

**下载**:
```
https://hashcat.net/hashcat/
```

**安装**:
```bash
# Linux
apt install hashcat

# macOS
brew install hashcat

# Windows
下载二进制文件解压即用
```

**基础用法**:
```bash
# MD5破解
hashcat -m 0 -a 0 hash.txt wordlist.txt

# SHA1破解
hashcat -m 100 -a 0 hash.txt wordlist.txt

# SHA256破解
hashcat -m 1400 -a 0 hash.txt wordlist.txt

# NTLM破解
hashcat -m 1000 -a 0 hash.txt wordlist.txt

# 暴力破解（纯数字，长度6）
hashcat -m 0 -a 3 hash.txt ?d?d?d?d?d?d

# 使用规则
hashcat -m 0 -a 0 hash.txt wordlist.txt -r rules/best64.rule

# GPU加速（自动使用）
hashcat -m 0 -a 0 hash.txt wordlist.txt -O
```

**常用参数**:
```bash
-m    # 哈希类型（0=MD5, 100=SHA1, 1400=SHA256）
-a    # 攻击模式（0=字典, 3=掩码/暴力）
-o    # 输出文件
-O    # 优化内核（更快但有限制）
--show  # 显示已破解的
--username  # 忽略用户名
```

**掩码攻击字符集**:
```
?l = 小写字母 a-z
?u = 大写字母 A-Z
?d = 数字 0-9
?s = 特殊字符
?a = 所有可打印字符
?b = 所有字节（0x00-0xff）
```

### John the Ripper

**下载**:
```
https://www.openwall.com/john/
```

**安装**:
```bash
# Linux
apt install john

# macOS
brew install john

# 从源码编译
git clone https://github.com/openwall/john
cd john/src
./configure && make
```

**基础用法**:
```bash
# 自动破解
john hash.txt

# 指定字典
john --wordlist=rockyou.txt hash.txt

# 查看已破解
john --show hash.txt

# 增量模式（暴力）
john --incremental hash.txt

# 使用规则
john --wordlist=dict.txt --rules hash.txt

# 指定格式
john --format=raw-md5 hash.txt
john --format=raw-sha1 hash.txt
john --format=raw-sha256 hash.txt

# 恢复中断的会话
john --restore
```

**提取哈希**:
```bash
# ZIP密码哈希
zip2john file.zip > hash.txt

# RAR密码哈希
rar2john file.rar > hash.txt

# PDF密码哈希
pdf2john file.pdf > hash.txt

# Office文档哈希
office2john file.docx > hash.txt

# SSH私钥密码
ssh2john id_rsa > hash.txt
```

### Python hashlib

**安装**: Python内置

**基础用法**:
```python
import hashlib

# MD5
md5 = hashlib.md5("Hello World".encode()).hexdigest()
print(md5)  # b10a8db164e0754105b7a99be72e3fe5

# SHA1
sha1 = hashlib.sha1("Hello World".encode()).hexdigest()
print(sha1)

# SHA256
sha256 = hashlib.sha256("Hello World".encode()).hexdigest()
print(sha256)

# SHA512
sha512 = hashlib.sha512("Hello World".encode()).hexdigest()
print(sha512)

# 文件哈希
def file_hash(filepath, algorithm='md5'):
    h = hashlib.new(algorithm)
    with open(filepath, 'rb') as f:
        while chunk := f.read(8192):
            h.update(chunk)
    return h.hexdigest()

# 使用
print(file_hash('file.txt', 'md5'))
```

**暴力破解示例**:
```python
import hashlib
import itertools
import string

def md5_crack(target_hash, charset, max_length):
    """暴力破解MD5"""
    for length in range(1, max_length + 1):
        for attempt in itertools.product(charset, repeat=length):
            password = ''.join(attempt)
            if hashlib.md5(password.encode()).hexdigest() == target_hash:
                return password
    return None

# 使用（仅数字，长度4）
target = "81dc9bdb52d04dc20036dbd8313ed055"  # MD5("1234")
result = md5_crack(target, string.digits, 4)
print(f"Found: {result}")
```

## 哈希算法对照

| 算法 | 长度 | 示例 | Hashcat模式 | John格式 |
|------|------|------|-------------|----------|
| MD5 | 32 | 5d41402abc4b2a76b9719d911017c592 | 0 | raw-md5 |
| SHA1 | 40 | aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d | 100 | raw-sha1 |
| SHA256 | 64 | 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824 | 1400 | raw-sha256 |
| SHA512 | 128 | 长128位十六进制 | 1700 | raw-sha512 |
| NTLM | 32 | 8846f7eaee8fb117ad06bdd830b7586c | 1000 | nt |
| MD4 | 32 | 31d6cfe0d16ae931b73c59d7e0c089c0 | 900 | raw-md4 |

## 彩虹表

### RainbowCrack

**下载**:
```
http://project-rainbowcrack.com/
```

**特点**:
- 预计算哈希表
- 空间换时间
- 支持GPU加速

**使用**:
```bash
# 生成彩虹表
rtgen md5 loweralpha 1 7 0 3800 33554432 0

# 排序
rtsort *.rt

# 破解
rcrack *.rt -h 5d41402abc4b2a76b9719d911017c592
```

## 字典资源

### 常用字典

**下载**:
```
# RockYou（最常用）
https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt

# SecLists
https://github.com/danielmiessler/SecLists

# CrackStation字典
https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm
```

**常见密码列表**:
```
password
123456
12345678
qwerty
abc123
monkey
1234567
letmein
trustno1
dragon
baseball
iloveyou
master
sunshine
ashley
```

## CTF解题技巧

!!! tip "快速识别哈希类型"
    根据长度判断：
    - 32位 → MD5/NTLM/MD4
    - 40位 → SHA1
    - 56位 → SHA224
    - 64位 → SHA256
    - 96位 → SHA384
    - 128位 → SHA512

!!! tip "破解思路"
    1. **在线查询**: 先用CrackStation等站点查询
    2. **字典攻击**: 使用RockYou等常用字典
    3. **规则攻击**: 添加规则变换（大小写、数字）
    4. **掩码攻击**: 已知部分信息时使用
    5. **暴力破解**: 最后手段，限定长度和字符集

!!! warning "爆破时间估算"
    ```
    字符集大小 = n
    密码长度 = l
    可能组合 = n^l
    
    示例：纯数字6位 = 10^6 = 1,000,000
         字母数字8位 = 62^8 = 218万亿
    ```

!!! tip "CTF常见技巧"
    - MD5碰撞（fastcoll）
    - 哈希长度扩展攻击
    - 弱密码（admin/123456）
    - 题目描述中的提示
    - 自定义字典（题目相关词汇）

## 相关工具

### Hash识别工具

**hashID**:
```bash
# 安装
pip install hashid

# 使用
hashid 5d41402abc4b2a76b9719d911017c592
```

**hash-identifier**:
```bash
# 下载
wget https://gitlab.com/kalilinux/packages/hash-identifier/-/raw/kali/master/hash-id.py

# 使用
python hash-id.py
```
