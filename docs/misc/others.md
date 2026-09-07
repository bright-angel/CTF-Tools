# 其他杂项工具

其他实用的CTF工具和资源。

## 在线工具

### 密码学与编码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| dCode | [https://www.dcode.fr/](https://www.dcode.fr/) | 古典密码、编码识别 |
| Cipher Identifier | [https://www.dcode.fr/cipher-identifier](https://www.dcode.fr/cipher-identifier) | 自动识别密码类型 |
| Cipher Tools | [https://rumkin.com/tools/cipher/](https://rumkin.com/tools/cipher/) | 古典密码工具集 |

### 文本处理

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Text Mechanic | [https://textmechanic.com/](https://textmechanic.com/) | 文本批处理 |
| Diff Checker | [https://www.diffchecker.com/](https://www.diffchecker.com/) | 文本对比 |

### 正则表达式

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Regex101 | [https://regex101.com/](https://regex101.com/) | 正则测试、详细解释 |
| RegExr | [https://regexr.com/](https://regexr.com/) | 正则学习工具 |

### 数据格式

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| JSON Formatter | [https://jsonformatter.org/](https://jsonformatter.org/) | JSON格式化验证 |
| JSON Path Finder | [https://jsonpathfinder.com/](https://jsonpathfinder.com/) | JSON路径查找 |
| XML Viewer | [https://codebeautify.org/xmlviewer](https://codebeautify.org/xmlviewer) | XML格式化查看 |

### 在线编程环境

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Online Python | [https://www.online-python.com/](https://www.online-python.com/) | Python在线运行 |
| OnlineGDB | [https://www.onlinegdb.com/](https://www.onlinegdb.com/) | 多语言在线编译 |
| JSFiddle | [https://jsfiddle.net/](https://jsfiddle.net/) | HTML/CSS/JS在线编辑 |

### 实用工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| WolframAlpha | [https://www.wolframalpha.com/](https://www.wolframalpha.com/) | 计算引擎 |
| Epoch Converter | [https://www.epochconverter.com/](https://www.epochconverter.com/) | Unix时间戳转换 |
| Unit Converter | [https://www.unitconverters.net/](https://www.unitconverters.net/) | 单位转换 |
| Number Base | [https://www.rapidtables.com/convert/number/](https://www.rapidtables.com/convert/number/) | 进制转换 |
| Color Picker | [https://htmlcolorcodes.com/color-picker/](https://htmlcolorcodes.com/color-picker/) | 颜色工具 |

### Unicode工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Unicode Table | [https://unicode-table.com/](https://unicode-table.com/) | Unicode字符查询 |
| Unicode Converter | [https://www.branah.com/unicode-converter](https://www.branah.com/unicode-converter) | Unicode编码转换 |

### 搜索引擎

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Shodan | [https://www.shodan.io/](https://www.shodan.io/) | 物联网设备搜索 |
| Google Hacking | [https://www.exploit-db.com/google-hacking-database](https://www.exploit-db.com/google-hacking-database) | Google搜索技巧库 |

### 安全检测

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Have I Been Pwned | [https://haveibeenpwned.com/](https://haveibeenpwned.com/) | 邮箱泄露检测 |

## 离线工具

### PWN工具库

#### Pwntools

**下载链接**:
```
https://github.com/Gallopsled/pwntools
```

**安装**:
```bash
pip install pwntools
```

**基本使用**:
```python
from pwn import *

# 连接远程
conn = remote('host', port)

# 连接本地
p = process('./binary')

# ELF解析
elf = ELF('./binary')
print(hex(elf.symbols['main']))
print(hex(elf.got['puts']))

# 发送数据
p.sendline(b'A' * 100)

# 接收数据
data = p.recv()
p.recvuntil(b'flag')

# Shellcode
shellcode = asm(shellcraft.sh())

# ROP链
rop = ROP(elf)
rop.call('system', [next(elf.search(b'/bin/sh'))])

# 打包数据
payload = flat([
    b'A' * 64,
    p64(0xdeadbeef)
])

# 交互模式
p.interactive()
```

**常用功能**:
- ELF/PE解析
- Shellcode生成与汇编
- ROP链自动构建
- 远程/本地进程交互
- 数据打包与解包
- 日志记录

#### ROPgadget

**下载链接**:
```
https://github.com/JonathanSalwan/ROPgadget
```

**安装**:
```bash
pip install ROPgadget
```

**使用**:
```bash
# 查找gadgets
ROPgadget --binary binary

# 查找特定指令
ROPgadget --binary binary --only "pop|ret"

# 生成ROP链
ROPgadget --binary binary --ropchain

# 搜索字符串
ROPgadget --binary binary --string "/bin/sh"
```

#### one_gadget

**下载链接**:
```
https://github.com/david942j/one_gadget
```

**安装**:
```bash
gem install one_gadget
```

**使用**:
```bash
# 查找one_gadget
one_gadget libc.so.6

# 指定约束条件
one_gadget libc.so.6 --level 1
```

**说明**: 在libc中查找execve("/bin/sh", NULL, NULL)的gadget

### 图表工具

#### Graphviz

**下载链接**:
```
https://graphviz.org/download/
```

**安装**:
```bash
# Ubuntu/Debian
apt install graphviz

# macOS
brew install graphviz

# Windows: 下载安装包
```

**使用**:
```bash
# DOT语言生成图表
dot -Tpng graph.dot -o output.png
```

#### Mermaid CLI

**安装**:
```bash
npm install -g @mermaid-js/mermaid-cli
```

**使用**:
```bash
mmdc -i input.mmd -o output.png
```

### 随机数工具

#### Python secrets

**内置模块**:
```python
import secrets

# 安全随机数
secrets.randbelow(100)

# 随机字节
secrets.token_bytes(16)

# 随机十六进制
secrets.token_hex(16)

# 随机URL安全字符串
secrets.token_urlsafe(16)
```

### CTF工具安装脚本

#### ctf-tools

**下载链接**:
```
https://github.com/zardus/ctf-tools
```

**使用**:
```bash
git clone https://github.com/zardus/ctf-tools
cd ctf-tools

# 安装所有工具
./bin/manage-tools setup

# 安装特定工具
./bin/manage-tools install pwntools
./bin/manage-tools install binwalk

# 列出工具
./bin/manage-tools list
```

**包含工具**: 200+种CTF工具自动安装脚本

### 靶场环境

#### WebGoat

**下载链接**:
```
https://github.com/WebGoat/WebGoat
```

**运行**:
```bash
# Docker运行
docker run -p 8080:8080 webgoat/webgoat

# Jar运行
java -jar webgoat-server.jar
```

**功能**: OWASP Web安全教学平台

#### DVWA

**下载链接**:
```
https://github.com/digininja/DVWA
```

**安装**:
```bash
git clone https://github.com/digininja/DVWA.git
cd DVWA

# Docker运行
docker run -d -p 80:80 vulnerables/web-dvwa
```

**功能**: 故意存在漏洞的Web应用，练习各种攻击技术

#### Vulhub

**下载链接**:
```
https://github.com/vulhub/vulhub
```

**使用**:
```bash
git clone https://github.com/vulhub/vulhub.git
cd vulhub/[vulnerability-name]
docker-compose up -d
```

**功能**: 基于Docker的漏洞环境集合

## 古典密码

### Caesar密码（凯撒密码）

**原理**: 字母表移位

**Python实现**:
```python
def caesar_decrypt(ciphertext, shift):
    result = ""
    for char in ciphertext:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            result += chr((ord(char) - base - shift) % 26 + base)
        else:
            result += char
    return result

# 暴力破解
for shift in range(26):
    print(f"Shift {shift}: {caesar_decrypt(ciphertext, shift)}")
```

**在线工具**: https://www.dcode.fr/caesar-cipher

### Vigenère密码（维吉尼亚密码）

**原理**: 使用密钥的多表代换密码

**密钥长度分析**: Kasiski测试、重合指数法

**在线工具**: https://www.dcode.fr/vigenere-cipher

### 栅栏密码 (Rail Fence)

**原理**: 将明文以Z字形写在栅栏上

**Python实现**:
```python
def rail_fence_decrypt(ciphertext, rails):
    fence = [['' for _ in range(len(ciphertext))] for _ in range(rails)]
    direction = 1
    row, col = 0, 0
    
    # 标记位置
    for i in range(len(ciphertext)):
        fence[row][col] = '*'
        col += 1
        row += direction
        if row == 0 or row == rails - 1:
            direction *= -1
    
    # 填充字符
    index = 0
    for i in range(rails):
        for j in range(len(ciphertext)):
            if fence[i][j] == '*':
                fence[i][j] = ciphertext[index]
                index += 1
    
    # 读取
    result = ""
    row, col = 0, 0
    direction = 1
    for i in range(len(ciphertext)):
        result += fence[row][col]
        col += 1
        row += direction
        if row == 0 or row == rails - 1:
            direction *= -1
    
    return result
```

### 培根密码 (Bacon Cipher)

**原理**: 使用A和B两个字母的组合表示每个字母

**映射**:
```
A = AAAAA    N = ABBAA
B = AAAAB    O = ABBAB
C = AAABA    P = ABBBA
...
```

**变种**: 可使用大小写、粗体斜体等表示A/B

**在线工具**: https://www.dcode.fr/bacon-cipher

### 摩斯电码 (Morse Code)

**在线工具**: https://morsecode.world/international/decoder.html

**特点**: 点(.)和划(-)的组合

## CTF解题技巧

!!! tip "古典密码识别"
    ```
    特征识别:
    - 全字母: Caesar, Vigenère, 仿射密码
    - 仅A-B: 培根密码, 二进制变种
    - 点划符号: 摩斯电码
    - 数字: 数字密码本
    - 特殊模式: 栅栏密码
    
    识别工具:
    - dCode Cipher Identifier
    - 频率分析
    - 重合指数
    ```

!!! tip "频率分析"
    ```
    英文字母频率:
    E > T > A > O > I > N > S > H > R
    
    中文使用:
    - 的、一、是、在、了、不、和
    
    应用:
    - 单表代换密码
    - Caesar密码确认
    - Vigenère密钥长度
    ```

!!! tip "Pwntools技巧"
    ```python
    # 快速生成payload
    from pwn import *
    
    # 循环发送直到成功
    while True:
        try:
            p = remote('host', port)
            # 攻击代码
            p.interactive()
        except:
            p.close()
    
    # 日志级别
    context.log_level = 'debug'  # 详细输出
    context.log_level = 'error'  # 仅错误
    
    # 架构设置
    context.arch = 'amd64'
    context.arch = 'i386'
    context.arch = 'arm'
    
    # 生成shellcode
    shellcode = asm(shellcraft.amd64.linux.sh())
    ```

!!! tip "ROP链构建"
    ```bash
    # 1. 查找gadgets
    ROPgadget --binary binary --only "pop|ret"
    
    # 2. 查找字符串
    strings -a -t x binary | grep "/bin/sh"
    
    # 3. 自动ROP
    python -c "from pwn import *; r = ROP('./binary'); print(r.dump())"
    
    # 4. one_gadget (如果有libc)
    one_gadget libc.so.6
    ```

!!! tip "Google Hacking技巧"
    ```
    常用语法:
    site:example.com        # 限定站点
    filetype:pdf            # 文件类型
    intitle:"index of"      # 标题包含
    inurl:admin             # URL包含
    intext:password         # 正文包含
    cache:example.com       # 查看缓存
    
    组合使用:
    site:edu.cn filetype:pdf "ctf"
    intitle:"index of" "flag.txt"
    inurl:admin site:example.com
    ```

!!! tip "正则表达式常用模式"
    ```regex
    # Email
    [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}
    
    # IP地址
    \b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b
    
    # URL
    https?://[^\s]+
    
    # Base64
    ^[A-Za-z0-9+/]{4,}={0,2}$
    
    # MD5
    ^[a-fA-F0-9]{32}$
    
    # SHA256
    ^[a-fA-F0-9]{64}$
    
    # Flag格式
    flag\{[^}]+\}
    ```

!!! tip "调试技巧"
    ```bash
    # Python
    python -m pdb script.py
    import pdb; pdb.set_trace()
    
    # GDB
    gdb -q binary
    (gdb) b main
    (gdb) r
    (gdb) x/20x $rsp
    
    # Strace (追踪系统调用)
    strace -e trace=open,read,write ./binary
    
    # Ltrace (追踪库函数)
    ltrace ./binary
    ```

!!! tip "数据提取技巧"
    ```python
    # 从大量数据中提取flag
    import re
    
    data = open('output.txt').read()
    
    # 标准flag格式
    flags = re.findall(r'flag\{[^}]+\}', data)
    
    # Base64编码
    b64 = re.findall(r'[A-Za-z0-9+/]{20,}={0,2}', data)
    
    # 十六进制
    hexdata = re.findall(r'[0-9a-fA-F]{32,}', data)
    
    # MD5格式
    md5s = re.findall(r'\b[a-fA-F0-9]{32}\b', data)
    ```

!!! warning "安全与道德"
    ```
    CTF学习原则:
    1. 仅在授权环境使用工具
    2. 不攻击未授权的系统
    3. 遵守法律法规和平台规则
    4. 负责任地披露漏洞
    5. 保护用户隐私和数据
    
    合法实践环境:
    - CTF比赛平台
    - 授权的渗透测试
    - 自己搭建的靶场
    - 开源练习平台
    ```

!!! tip "学习路线"
    ```
    入门阶段:
    1. 基础编码 (Base64, URL, Hex)
    2. 古典密码 (Caesar, Vigenère)
    3. 简单隐写 (LSB, Steghide)
    4. 基础Web (SQL注入, XSS)
    
    进阶阶段:
    1. 现代密码学 (RSA, AES)
    2. 二进制分析 (逆向, PWN)
    3. 复杂隐写 (频域, 协议)
    4. 高级Web (反序列化, SSRF)
    
    高级阶段:
    1. 内核利用
    2. 协议分析
    3. 密码分析
    4. 综合渗透
    
    学习资源:
    - CTF Wiki
    - WriteUp阅读
    - 参加比赛
    - 复现经典题目
    ```

!!! tip "比赛策略"
    ```
    时间管理:
    1. 快速浏览所有题目
    2. 先做擅长的类别
    3. 简单题优先
    4. 卡题及时切换
    
    团队协作:
    1. 明确分工
    2. 共享信息
    3. 及时沟通
    4. 记录思路
    
    解题技巧:
    1. 仔细读题
    2. 注意题目提示
    3. 尝试多种方法
    4. 善用搜索引擎
    5. 查阅WriteUp学习
    ```

## 相关资源

- **Pwntools**: PWN题必备Python库
- **ROPgadget**: ROP链自动查找工具
- **dCode**: 最全面的古典密码工具站
- **CTF-Tools**: CTF工具自动化安装脚本集合
- **Vulhub**: Docker漏洞环境快速搭建
