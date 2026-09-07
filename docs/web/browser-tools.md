# 浏览器插件与工具

Web渗透测试常用的浏览器插件和辅助工具。

## 浏览器插件

### Wappalyzer
**链接**: [https://www.wappalyzer.com/](https://www.wappalyzer.com/)

**功能**: 页面技术识别软件

**特点**:
- 快速识别网页技术栈
- 检测框架和库
- CMS识别
- 服务器信息
- 支持Chrome/Firefox

**用途**:
- 快速了解目标站点技术
- 寻找已知漏洞
- 确定攻击方向

### Proxy SwitchyOmega
**GitHub**: [https://github.com/FelisCatus/SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)

**功能**: 代理管理插件

**特点**:
- 快速切换代理
- 支持多个代理配置
- 自动切换规则
- 配合Burp Suite使用

**用法**:
1. 配置代理：127.0.0.1:8080（Burp默认端口）
2. 点击图标快速切换
3. 设置规则自动代理

### HackBar
**GitHub**: [https://github.com/Mr-xn/hackbar2.1.3](https://github.com/Mr-xn/hackbar2.1.3)

**功能**: 浏览器渗透测试工具栏

**特点**:
- 直接编辑请求/响应
- 快速编码解码
- SQL/XSS Payload
- POST数据修改
- 自定义请求头

**常用功能**:
- Base64/URL/MD5等编码
- SQL注入测试
- XSS Payload生成
- 修改Referer/Cookie

## 网络分析

### Wireshark
**下载**: [https://www.wireshark.org/download.html](https://www.wireshark.org/download.html)

**功能**: 开源网络协议分析器

**特点**:
- 实时检测网络通讯
- 深度包检测
- 协议解析
- 流追踪
- 强大的过滤器

**CTF应用**:
- PCAP文件分析
- 网络流量取证
- 协议分析
- 数据提取

**常用过滤器**:
```
http.request.method == "POST"
tcp.port == 80
ip.addr == 192.168.1.1
http contains "flag"
```

**用法**:
1. 打开PCAP文件
2. 使用过滤器定位
3. 追踪TCP/HTTP流
4. 导出对象

## WiFi安全

### Elcomsoft Wireless Security Auditor
**下载**: [百度网盘](https://pan.baidu.com/s/1jTYz_MvxoSzcYql09b6Hcg)

**功能**: WiFi密码破解器

**特点**:
- WPA/WPA2破解
- GPU加速
- 字典攻击
- 无线网络审计

**用途**:
- 无线渗透测试
- WiFi密码恢复
- 安全审计

**注意**: 仅用于授权测试

## 栅栏加解密工具

### 栅栏加解密工具
**下载**: [百度网盘](https://pan.baidu.com/s/1wudTeg7QyntBNkxy5fFQ0A)

**功能**: 栅栏密码加解密

**特点**:
- GUI界面
- 支持多栏数
- 自动尝试
- Windows工具

**用途**: 快速处理栅栏密码

## 使用建议

### 浏览器插件配置
1. **Wappalyzer** - 始终启用，自动识别
2. **SwitchyOmega** - 配置Burp代理，需要时切换
3. **HackBar** - 渗透测试时使用

### 工具组合
```
浏览器 + HackBar → 快速测试
浏览器 + SwitchyOmega + Burp Suite → 深度分析
Wireshark → 流量分析
```

### CTF解题流程
1. **Wappalyzer** 识别技术栈
2. **HackBar** 快速测试注入点
3. **Burp Suite** 深入挖掘
4. **Wireshark** 分析流量包

## 常见问题

### 插件安装
- Chrome: 访问Chrome Web Store
- Firefox: 访问Firefox Add-ons
- Edge: 支持Chrome插件

### HackBar失效
- 尝试不同版本
- 检查浏览器兼容性
- 使用开发者版本

### Burp代理不生效
1. 检查SwitchyOmega配置
2. 确认Burp监听端口
3. 导入Burp证书（HTTPS）

## 浏览器选择

### 推荐组合
- **Chrome/Edge** - 插件丰富，性能好
- **Firefox** - 开发者工具强大
- **多浏览器** - 不同场景使用不同浏览器

## CTF解题技巧

!!! tip "快速识别"
    安装Wappalyzer后打开目标站点，立即可以看到：
    - Web服务器类型
    - 编程语言
    - 框架版本
    - CMS系统

!!! tip "代理配置"
    SwitchyOmega设置多个场景：
    - Burp: 127.0.0.1:8080
    - 直连: DIRECT
    - 自动切换: 根据域名规则

!!! warning "注意事项"
    - 插件可能影响性能
    - 及时更新版本
    - 注意隐私保护
    - 仅在授权环境使用
