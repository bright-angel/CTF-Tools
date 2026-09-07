# 浏览器插件与工具

Web渗透测试常用的浏览器插件和辅助工具。

## 浏览器插件

### 技术识别插件

| 插件名称 | 链接 | 功能 |
|---------|------|------|
| Wappalyzer | [https://www.wappalyzer.com/](https://www.wappalyzer.com/) | 识别网站技术栈、框架、CMS |
| BuiltWith | [Chrome商店](https://chrome.google.com/webstore) | 技术栈分析 |
| Whatruns | [Chrome商店](https://chrome.google.com/webstore) | 识别网站技术 |

**Wappalyzer特点**:
- 快速识别网页技术栈
- 检测框架和库
- CMS识别（WordPress、Joomla等）
- 服务器信息
- 支持Chrome/Firefox/Edge

### 代理管理插件

| 插件名称 | 链接 | 功能 |
|---------|------|------|
| Proxy SwitchyOmega | [GitHub](https://github.com/FelisCatus/SwitchyOmega) | 快速切换代理配置 |
| FoxyProxy | [Chrome商店](https://chrome.google.com/webstore) | 代理管理 |

**SwitchyOmega配置**:
```
情景模式: Burp
- 代理协议: HTTP
- 代理服务器: 127.0.0.1
- 代理端口: 8080

情景模式: 直连
- 直接连接
```

### 渗透测试工具栏

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| HackBar | [GitHub](https://github.com/Mr-xn/hackbar2.1.3) | 浏览器渗透工具栏 |
| Tamper Data | Firefox插件 | 修改HTTP请求 |

**HackBar功能**:
- 直接编辑GET/POST参数
- 快速编码解码（Base64/URL/MD5/SHA1等）
- SQL/XSS Payload库
- 修改HTTP头（Referer/User-Agent/Cookie）
- 执行自定义请求

### 开发者工具增强

| 插件名称 | 功能 |
|---------|------|
| EditThisCookie | Cookie编辑器 |
| JSON Viewer | JSON格式化 |
| Web Developer | Web开发工具集 |
| User-Agent Switcher | UA切换 |

## 离线工具

### Wireshark

**下载链接**:
```
https://www.wireshark.org/download.html
```

**安装**:
```bash
# Windows: 下载安装包直接安装

# Linux
sudo apt install wireshark

# macOS
brew install wireshark
```

**基本使用**:
```bash
# 1. 打开PCAP文件
File -> Open -> 选择pcap文件

# 2. 常用过滤器
http.request.method == "POST"     # POST请求
tcp.port == 80                     # 80端口
ip.addr == 192.168.1.1            # 特定IP
http contains "flag"               # 包含flag
http.request.uri contains "admin" # URI包含admin
http.cookie contains "session"    # Cookie包含session

# 3. 追踪流
右键数据包 -> Follow -> TCP Stream / HTTP Stream

# 4. 导出对象
File -> Export Objects -> HTTP -> 选择文件保存

# 5. 统计分析
Statistics -> Protocol Hierarchy   # 协议层次
Statistics -> Conversations        # 会话统计
Statistics -> HTTP -> Requests     # HTTP请求统计
```

**CTF常用操作**:
```bash
# 搜索字符串
Edit -> Find Packet -> String -> "flag"

# 过滤HTTP流量
http

# 提取文件
File -> Export Objects -> HTTP -> Save All

# 查看明文数据
Follow TCP Stream（红色=客户端，蓝色=服务器）

# 过滤特定内容
frame contains "password"
http.request.method == "POST" && frame contains "username"
```

**常用过滤器语法**:
```
# 协议过滤
http / tcp / udp / dns / icmp

# IP过滤
ip.src == 192.168.1.1      # 源IP
ip.dst == 192.168.1.1      # 目标IP
ip.addr == 192.168.1.1     # 任意IP

# 端口过滤
tcp.port == 80             # TCP端口
udp.port == 53             # UDP端口
tcp.srcport == 80          # 源端口
tcp.dstport == 80          # 目标端口

# HTTP过滤
http.request               # HTTP请求
http.response              # HTTP响应
http.request.method == "GET"
http.response.code == 200
http.host == "example.com"
http.cookie
http.user_agent

# 内容过滤
frame contains "string"    # 包含字符串
http.request.uri contains "/admin"

# 逻辑组合
http && tcp.port == 8080
!(http || dns)
(http.request.method == "POST") && (frame contains "password")
```

### Burp Suite

**下载链接**:
```
https://portswigger.net/burp/communitydownload
```

**基本配置**:
```
1. 启动Burp Suite
2. Proxy -> Options -> 确认监听 127.0.0.1:8080
3. 浏览器安装SwitchyOmega，配置代理127.0.0.1:8080
4. 访问 http://burp 下载证书（HTTPS需要）
5. 安装证书到浏览器
```

**常用功能**:
```
Proxy（代理）:
- Intercept: 拦截修改请求
- HTTP history: 查看所有请求
- WebSockets history: WS流量

Repeater（重放器）:
- 右键请求 -> Send to Repeater
- 修改参数后重新发送
- 对比响应

Intruder（入侵器）:
- 爆破工具
- Sniper/Battering ram/Pitchfork/Cluster bomb
- 字典攻击

Decoder（解码器）:
- Base64/URL/HTML/Hex等编解码
- Hash计算

Comparer（比较器）:
- 对比两个请求/响应差异
```

### HackBar使用

**下载链接**:
```
https://github.com/Mr-xn/hackbar2.1.3
```

**安装**:
```
1. 下载crx文件
2. Chrome: 打开 chrome://extensions/
3. 开启开发者模式
4. 拖入crx文件安装
```

**常用快捷功能**:
```
Load URL: 加载当前URL到工具栏
Execute: 执行修改后的请求

Encoding（编码）:
- Base64 Encode/Decode
- URL Encode/Decode
- Hex Encode/Decode
- MD5/SHA1/SHA256

Encryption（加密）:
- MD5
- SHA1/SHA256

SQL（SQL注入）:
- UNION SELECT
- ORDER BY
- 常用Payload

XSS（跨站脚本）:
- <script>alert(1)</script>
- 常用Payload
```

### WiFi安全工具

**Elcomsoft Wireless Security Auditor下载**:
```
百度网盘: https://pan.baidu.com/s/1jTYz_MvxoSzcYql09b6Hcg
```

**功能**: WPA/WPA2密码破解，GPU加速字典攻击

**注意**: 仅用于授权测试环境

**替代工具**:
```bash
# aircrack-ng（Linux）
apt install aircrack-ng

# 捕获握手包
airodump-ng wlan0mon --bssid [BSSID] -c [channel] -w capture

# 破解
aircrack-ng -w wordlist.txt capture-01.cap

# Hashcat破解WPA（更快）
hashcat -m 2500 capture.hccapx wordlist.txt
```

## 工具组合

### 渗透测试标准流程

```
1. 信息收集
   ├─ Wappalyzer: 识别技术栈
   ├─ 查看源代码
   └─ 目录扫描

2. 漏洞发现
   ├─ HackBar: 快速测试注入点
   ├─ Burp Suite: 深度分析
   └─ 手工测试

3. 漏洞利用
   ├─ Burp Repeater: 调试Payload
   ├─ Intruder: 爆破
   └─ 脚本自动化

4. 流量分析
   └─ Wireshark: 分析PCAP
```

### 插件配置建议

**Chrome/Edge推荐插件**:
```
必装:
- Wappalyzer（技术识别）
- Proxy SwitchyOmega（代理管理）
- HackBar（渗透工具栏）
- EditThisCookie（Cookie编辑）

可选:
- JSON Viewer（JSON格式化）
- User-Agent Switcher（UA切换）
- Web Developer（开发工具）
```

**Firefox推荐插件**:
```
必装:
- Wappalyzer
- FoxyProxy（代理管理）
- HackBar

Firefox独有:
- Tamper Data（HTTP修改）
- Firebug（调试工具）
```

## CTF解题技巧

!!! tip "快速识别技术栈"
    打开目标网站后，Wappalyzer图标会显示：
    - Web服务器（Apache/Nginx/IIS）
    - 编程语言（PHP/Python/Java）
    - 框架（Laravel/Django/Spring）
    - CMS（WordPress/Joomla/Drupal）
    - CDN（Cloudflare/Akamai）
    
    根据识别结果搜索已知漏洞。

!!! tip "Burp Suite配置"
    ```
    1. Proxy监听: 127.0.0.1:8080
    2. SwitchyOmega代理: 127.0.0.1:8080
    3. 导入Burp证书（HTTPS）
    4. Proxy -> Options -> Match and Replace添加规则
    5. User Options -> 配置上游代理（如需要）
    ```

!!! tip "Wireshark分析PCAP"
    ```
    1. 文件 -> 打开 -> 选择.pcap文件
    
    2. 快速过滤HTTP流量:
       http
    
    3. 搜索flag:
       Ctrl+F -> String -> "flag"
    
    4. 追踪TCP流:
       右键数据包 -> Follow -> TCP Stream
    
    5. 导出HTTP对象:
       File -> Export Objects -> HTTP
    
    6. 统计分析:
       Statistics -> Protocol Hierarchy
       Statistics -> Conversations
    ```

!!! tip "HackBar快速测试"
    ```
    SQL注入测试:
    1. Load URL
    2. 在参数后加: ' OR 1=1--
    3. Execute
    
    XSS测试:
    1. Load URL
    2. 在参数处插入: <script>alert(1)</script>
    3. Execute
    
    编码转换:
    选中文本 -> 右键 -> Encoding -> Base64 Encode
    ```

!!! warning "常见问题"
    **HackBar不工作**:
    - 检查浏览器版本兼容性
    - 尝试不同版本的HackBar
    - Edge/Chrome可能需要开发者模式安装
    
    **Burp代理HTTPS失败**:
    - 必须导入Burp证书
    - 访问 http://burp 下载证书
    - 安装到浏览器受信任证书
    
    **SwitchyOmega不切换**:
    - 检查代理配置是否正确
    - 确认Burp Suite已启动
    - 查看SwitchyOmega图标状态
    
    **Wireshark看不懂**:
    - 使用过滤器简化显示
    - Follow Stream查看完整对话
    - 导出HTTP对象获取文件

!!! tip "浏览器开发者工具"
    **F12快捷键打开**:
    ```
    Elements/Inspector: 查看修改HTML/CSS
    Console: JavaScript控制台
    Network: 网络请求分析
      - 查看所有请求
      - 右键 -> Copy as cURL
      - 查看请求/响应头
      - 查看Cookie
    Sources/Debugger: JS调试
    Application/Storage: Cookie/LocalStorage/SessionStorage
    ```

!!! tip "Cookie操作"
    ```
    方法1: EditThisCookie插件
    - 点击插件图标
    - 编辑/添加/删除Cookie
    - 导出/导入Cookie
    
    方法2: 开发者工具
    - F12 -> Application -> Cookies
    - 双击编辑值
    
    方法3: JavaScript控制台
    document.cookie = "key=value"
    console.log(document.cookie)
    ```

## 相关资源

- **Wappalyzer**: 必装插件，自动识别技术栈
- **Burp Suite**: Web渗透测试必备，Community版本免费
- **Wireshark**: 流量分析神器，支持所有协议
- **HackBar**: 快速测试工具，提高效率
- **浏览器DevTools**: F12内置工具，功能强大
