# 压缩包分析工具

ZIP、RAR等压缩文件的分析、破解、修复工具。

## 在线工具

### 在线解压

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| ezyZip | [https://www.ezyzip.com/](https://www.ezyzip.com/) | 在线解压ZIP |
| Online Converter | [https://www.online-convert.com/](https://www.online-convert.com/) | 格式转换 |
| Archive Extractor | [https://extract.me/](https://extract.me/) | 多格式解压 |

### 密码破解

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Password Recovery | [https://www.password-online.com/](https://www.password-online.com/) | 在线密码恢复 |

## 离线工具

### 7-Zip

**下载链接**:
```
https://www.7-zip.org/
```

**安装**:
```bash
# Windows: 下载安装包
# Ubuntu: sudo apt install p7zip-full
# macOS: brew install p7zip
```

**命令行使用**:
```bash
# 解压
7z x archive.zip
7z x archive.rar
7z x archive.7z

# 列出内容
7z l archive.zip

# 测试完整性
7z t archive.zip

# 带密码解压
7z x -p"password" archive.zip

# 创建压缩包
7z a output.zip file1.txt file2.txt

# 指定压缩级别
7z a -mx=9 output.7z folder/  # 最高压缩

# 分卷压缩
7z a -v100m output.7z large_file.iso  # 每卷100MB
```

### ZIP伪加密检测与修复

**原理**:
- ZIP文件有两处加密标志位
- 本地文件头和中央目录记录
- 伪加密：标志位被修改但实际未加密

**检测**:
```python
def check_zip_fake_encryption(zip_path):
    """检测ZIP伪加密"""
    with open(zip_path, 'rb') as f:
        data = f.read()
    
    # 查找本地文件头 50 4B 03 04
    local_header = data.find(b'PK\x03\x04')
    if local_header == -1:
        return "非ZIP文件"
    
    # 查找中央目录 50 4B 01 02
    central_dir = data.find(b'PK\x01\x02')
    if central_dir == -1:
        return "文件损坏"
    
    # 检查加密标志位（偏移+8，2字节）
    local_flag = data[local_header + 6:local_header + 8]
    central_flag = data[central_dir + 8:central_dir + 10]
    
    local_encrypted = int.from_bytes(local_flag, 'little') & 0x01
    central_encrypted = int.from_bytes(central_flag, 'little') & 0x01
    
    print(f"本地文件头加密标志: {local_encrypted}")
    print(f"中央目录加密标志: {central_encrypted}")
    
    if local_encrypted != central_encrypted:
        return "检测到伪加密"
    elif local_encrypted and central_encrypted:
        return "真实加密"
    else:
        return "未加密"

def fix_zip_fake_encryption(zip_path, output_path):
    """修复ZIP伪加密"""
    with open(zip_path, 'rb') as f:
        data = bytearray(f.read())
    
    # 查找并修复本地文件头
    pos = 0
    while True:
        pos = data.find(b'PK\x03\x04', pos)
        if pos == -1:
            break
        
        # 清除加密标志位
        flag_pos = pos + 6
        flag = int.from_bytes(data[flag_pos:flag_pos+2], 'little')
        flag &= ~0x01  # 清除第0位
        data[flag_pos:flag_pos+2] = flag.to_bytes(2, 'little')
        
        pos += 4
    
    # 查找并修复中央目录
    pos = 0
    while True:
        pos = data.find(b'PK\x01\x02', pos)
        if pos == -1:
            break
        
        flag_pos = pos + 8
        flag = int.from_bytes(data[flag_pos:flag_pos+2], 'little')
        flag &= ~0x01
        data[flag_pos:flag_pos+2] = flag.to_bytes(2, 'little')
        
        pos += 4
    
    with open(output_path, 'wb') as f:
        f.write(data)
    
    print(f"已修复并保存到: {output_path}")

# 使用
result = check_zip_fake_encryption('file.zip')
print(result)

if "伪加密" in result:
    fix_zip_fake_encryption('file.zip', 'fixed.zip')
```

### ZIP密码破解

#### fcrackzip

**安装**:
```bash
# Ubuntu/Debian
sudo apt install fcrackzip

# macOS
brew install fcrackzip
```

**使用**:
```bash
# 字典攻击
fcrackzip -u -D -p rockyou.txt file.zip

# 暴力破解（纯数字）
fcrackzip -b -c '1' -l 4-6 -u file.zip

# 暴力破解（小写字母）
fcrackzip -b -c 'a' -l 4-6 -u file.zip

# 暴力破解（字母+数字）
fcrackzip -b -c 'aA1' -l 4-6 -u file.zip

# 参数说明:
# -u: 使用unzip测试密码（更可靠）
# -D: 字典攻击
# -p: 指定字典文件
# -b: 暴力破解
# -c: 字符集（1:数字 a:小写 A:大写）
# -l: 密码长度范围
```

#### John the Ripper

**下载链接**:
```
https://www.openwall.com/john/
```

**使用**:
```bash
# 提取hash
zip2john file.zip > hash.txt

# 破解
john hash.txt
john --wordlist=rockyou.txt hash.txt

# 查看结果
john --show hash.txt

# RAR文件
rar2john file.rar > hash.txt
john hash.txt
```

#### Hashcat

**下载链接**:
```
https://hashcat.net/hashcat/
```

**使用**:
```bash
# ZIP (PKZIP)
hashcat -m 17200 hash.txt wordlist.txt

# ZIP (WinZip AES)
hashcat -m 13600 hash.txt wordlist.txt

# RAR3
hashcat -m 12500 hash.txt wordlist.txt

# RAR5
hashcat -m 13000 hash.txt wordlist.txt

# 7z
hashcat -m 11600 hash.txt wordlist.txt

# 使用规则
hashcat -m 17200 hash.txt wordlist.txt -r rules/best64.rule

# GPU加速
hashcat -m 17200 hash.txt wordlist.txt -d 1
```

### CRC32碰撞

**原理**:
- ZIP文件记录每个文件的CRC32值
- 如果文件很小，可以通过CRC32反推内容

#### crc32-tools

**下载链接**:
```
https://github.com/theonlypwner/crc32
```

**使用**:
```bash
# 克隆仓库
git clone https://github.com/theonlypwner/crc32
cd crc32

# 已知CRC32反推
python crc32.py reverse 0x12345678

# 已知部分内容
python crc32.py append "known_text" 0x12345678
```

**Python实现**:
```python
import zlib
import itertools
import string

def crc32_reverse(target_crc, length, charset=string.printable):
    """CRC32爆破"""
    target_crc = target_crc & 0xFFFFFFFF
    
    for attempt in itertools.product(charset, repeat=length):
        text = ''.join(attempt)
        if zlib.crc32(text.encode()) & 0xFFFFFFFF == target_crc:
            return text
    
    return None

# 使用
# result = crc32_reverse(0x12345678, 4)
# print(result)

def extract_zip_crc(zip_path):
    """提取ZIP文件中的CRC32值"""
    import zipfile
    
    with zipfile.ZipFile(zip_path, 'r') as zf:
        for info in zf.filelist:
            print(f"文件: {info.filename}")
            print(f"CRC32: 0x{info.CRC:08X}")
            print(f"大小: {info.file_size} 字节")
            print()

# 使用
extract_zip_crc('file.zip')
```

### ZIP嵌套提取

**Python脚本**:
```python
import zipfile
import os

def extract_nested_zip(zip_path, output_dir, level=0):
    """递归提取嵌套的ZIP文件"""
    print("  " * level + f"解压: {zip_path}")
    
    with zipfile.ZipFile(zip_path, 'r') as zf:
        zf.extractall(output_dir)
    
    # 查找解压出的ZIP文件
    for root, dirs, files in os.walk(output_dir):
        for file in files:
            if file.endswith('.zip'):
                nested_zip = os.path.join(root, file)
                nested_output = os.path.join(root, file[:-4])
                os.makedirs(nested_output, exist_ok=True)
                
                try:
                    extract_nested_zip(nested_zip, nested_output, level + 1)
                except:
                    print("  " * (level + 1) + f"无法解压: {nested_zip}")

# 使用
extract_nested_zip('nested.zip', 'output/')
```

### RAR文件处理

#### unrar

**安装**:
```bash
# Ubuntu/Debian
sudo apt install unrar

# macOS
brew install unrar
```

**使用**:
```bash
# 解压
unrar x file.rar

# 测试
unrar t file.rar

# 列出内容
unrar l file.rar

# 带密码解压
unrar x -p"password" file.rar
```

#### RAR密码破解

**工具**: 
- John the Ripper
- Hashcat
- RarCrack (Linux)

```bash
# RarCrack
rarcrack file.rar --threads 4 --type rar
```

### 其他压缩格式

#### tar/gz

**使用**:
```bash
# 解压tar.gz
tar -xzf file.tar.gz

# 解压tar.bz2
tar -xjf file.tar.bz2

# 解压tar.xz
tar -xJf file.tar.xz

# 查看内容
tar -tzf file.tar.gz

# 创建
tar -czf output.tar.gz folder/
```

#### gzip

**使用**:
```bash
# 压缩
gzip file.txt

# 解压
gunzip file.txt.gz
gzip -d file.txt.gz

# 保留原文件
gzip -k file.txt
```

## CTF解题技巧

!!! tip "ZIP文件分析流程"
    ```bash
    1. 基本信息
       file file.zip
       7z l file.zip
    
    2. 检查伪加密
       Python脚本检测
       十六进制查看标志位
    
    3. 尝试解压
       7z x file.zip
       unzip file.zip
    
    4. 如果有密码
       - 检查题目描述
       - 尝试常见密码
       - 字典破解
       - 暴力破解
    
    5. CRC32爆破（小文件）
       - 提取CRC32值
       - 爆破内容
    
    6. 检查嵌套
       - 递归解压
       - 查看所有文件
    ```

!!! tip "ZIP伪加密识别"
    ```
    使用十六进制编辑器:
    
    1. 查找 50 4B 03 04 (本地文件头)
       偏移+6处，2字节为加密标志
       xx09 表示加密
       xx00 表示未加密
    
    2. 查找 50 4B 01 02 (中央目录)
       偏移+8处，2字节为加密标志
    
    3. 如果不一致 → 伪加密
       修改为 00 即可
    ```

!!! tip "密码破解策略"
    ```
    1. 弱密码尝试
       - 空密码
       - 123456, password, admin
       - 题目相关词汇
    
    2. 字典攻击
       - rockyou.txt
       - 自定义字典
       - fcrackzip -D
    
    3. 暴力破解
       - 4-6位数字
       - 小写字母
       - fcrackzip -b
    
    4. 掩码攻击（Hashcat）
       - ?l?l?l?l (4位小写)
       - ?d?d?d?d (4位数字)
    
    5. GPU加速
       - Hashcat
       - 速度快数倍
    ```

!!! tip "CRC32碰撞"
    ```
    适用场景:
    - 文件小于6字节
    - 已知CRC32值
    - 内容可预测（数字、字母）
    
    工具:
    - crc32-tools
    - Python脚本爆破
    
    优化:
    - 限定字符集
    - 已知部分内容
    - 并行计算
    ```

!!! tip "嵌套ZIP处理"
    ```bash
    # 方法1: 脚本递归解压
    Python递归解压脚本
    
    # 方法2: 命令行循环
    while [ -f *.zip ]; do
        unzip *.zip
        rm *.zip
    done
    
    # 方法3: 7z递归
    7z x -r file.zip
    ```

!!! warning "常见问题"
    ```
    1. 文件头损坏
       - 修复魔数 50 4B 03 04
       - 尝试7z强制解压
    
    2. 密码错误
       - 检查大小写
       - 检查特殊字符
       - 尝试URL编码
    
    3. 加密方式不支持
       - WinZip AES加密
       - 需要特定工具
    
    4. 文件过大
       - 分卷压缩
       - 需要所有卷
    
    5. CRC错误
       - 文件损坏
       - 传输错误
       - 故意修改（CTF）
    ```

!!! tip "高级技巧"
    ```
    1. 明文攻击
       - 已知部分明文
       - bkcrack工具
       - 适用于ZipCrypto
    
    2. 字典生成
       - crunch生成字典
       - 基于规则变换
    
    3. 内存中解压
       - Python zipfile模块
       - 不写入磁盘
    
    4. 损坏文件修复
       - ZIP repair工具
       - 手动重建结构
    ```

## 相关资源

- **7-Zip**: 万能解压工具
- **fcrackzip**: ZIP密码破解
- **John the Ripper**: 多格式密码破解
- **Hashcat**: GPU加速密码破解
- **crc32-tools**: CRC32碰撞工具
