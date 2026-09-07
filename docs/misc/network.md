# 网络协议分析工具

网络数据包分析、协议解析相关工具。

## 在线工具

### 网络工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| IP查询 | [https://www.ipip.net/](https://www.ipip.net/) | IP地址查询 |
| Whois查询 | [https://whois.chinaz.com/](https://whois.chinaz.com/) | 域名信息查询 |
| DNS查询 | [https://tool.chinaz.com/dns](https://tool.chinaz.com/dns) | DNS解析查询 |
| 端口扫描 | [https://tool.chinaz.com/port/](https://tool.chinaz.com/port/) | 在线端口扫描 |

### 数据包分析

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| PacketTotal | [https://packettotal.com/](https://packettotal.com/) | PCAP在线分析 |
| CloudShark | [https://www.cloudshark.org/](https://www.cloudshark.org/) | PCAP云分析 |

### HTTP工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Webhook | [https://webhook.site/](https://webhook.site/) | HTTP请求接收 |
| RequestBin | [https://requestbin.com/](https://requestbin.com/) | HTTP调试 |
| Postman Web | [https://web.postman.co/](https://web.postman.co/) | API测试 |

## 离线工具

### Wireshark

**下载链接**:
```
https://www.wireshark.org/download.html
```

**安装**:
```bash
# Windows: 下载安装包
# macOS: brew install --cask wireshark
# Ubuntu: sudo apt install wireshark
```

**基本使用**:
```
1. 选择网络接口开始捕获
2. 捕获过滤器 (Capture Filter)
   - host 192.168.1.1
   - port 80
   - tcp

3. 显示过滤器 (Display Filter)
   - http
   - tcp.port == 80
   - ip.addr == 192.168.1.1
   - http.request.method == "POST"
   - frame contains "flag"

4. 跟踪流
   - 右键数据包 -> Follow -> TCP/HTTP Stream
   - 查看完整会话内容

5. 导出对象
   - File -> Export Objects -> HTTP
   - 提取传输的文件

6. 统计分析
   - Statistics -> Protocol Hierarchy
   - Statistics -> Conversations
   - Statistics -> Endpoints
```

**常用过滤器**:
```
# HTTP
http
http.request.method == "GET"
http.request.uri contains "flag"
http.response.code == 200

# TCP
tcp.port == 80
tcp.flags.syn == 1
tcp.stream eq 0

# DNS
dns
dns.qry.name contains "example"

# IP
ip.addr == 192.168.1.1
ip.src == 192.168.1.1
ip.dst == 192.168.1.1

# 字符串搜索
frame contains "password"
frame matches "flag{.*}"

# 组合
http and ip.addr == 192.168.1.1
tcp.port == 80 or tcp.port == 443
```

### tshark (命令行Wireshark)

**使用**:
```bash
# 捕获数据包
tshark -i eth0 -w capture.pcap

# 读取pcap文件
tshark -r capture.pcap

# 显示过滤
tshark -r capture.pcap -Y "http"

# 提取字段
tshark -r capture.pcap -T fields -e ip.src -e ip.dst -e http.request.uri

# 统计
tshark -r capture.pcap -q -z http,tree

# 导出HTTP对象
tshark -r capture.pcap --export-objects http,./output/

# 跟踪TCP流
tshark -r capture.pcap -q -z follow,tcp,ascii,0
```

### Scapy (Python数据包处理)

**安装**:
```bash
pip install scapy
```

**基本使用**:
```python
from scapy.all import *

# 读取pcap文件
packets = rdpcap('capture.pcap')

# 遍历数据包
for pkt in packets:
    if pkt.haslayer(TCP):
        print(f"TCP: {pkt[IP].src} -> {pkt[IP].dst}")

# 过滤特定协议
http_packets = [pkt for pkt in packets if pkt.haslayer(TCP) and pkt[TCP].dport == 80]

# 提取payload
for pkt in packets:
    if pkt.haslayer(Raw):
        payload = pkt[Raw].load
        print(payload)

# 搜索关键字
for pkt in packets:
    if pkt.haslayer(Raw):
        if b'flag' in pkt[Raw].load:
            print(pkt.summary())
            print(pkt[Raw].load)

# TCP流重组
def reassemble_tcp_stream(packets, stream_id):
    """重组TCP流"""
    stream_data = b''
    for pkt in packets:
        if pkt.haslayer(TCP) and pkt.haslayer(Raw):
            if pkt[TCP].sport == stream_id or pkt[TCP].dport == stream_id:
                stream_data += pkt[Raw].load
    return stream_data

# 构造数据包
packet = IP(dst="192.168.1.1")/TCP(dport=80)/"GET / HTTP/1.1\r\n\r\n"
send(packet)

# 保存数据包
wrpcap('output.pcap', packets)
```

**CTF常用脚本**:
```python
from scapy.all import *
import re

def extract_files_from_pcap(pcap_file):
    """从PCAP提取HTTP文件"""
    packets = rdpcap(pcap_file)
    
    files = {}
    current_file = None
    file_data = b''
    
    for pkt in packets:
        if pkt.haslayer(Raw):
            payload = pkt[Raw].load
            
            # 检测HTTP响应
            if b'HTTP/1.' in payload and b'Content-Type:' in payload:
                # 提取文件名
                match = re.search(rb'filename="([^"]+)"', payload)
                if match:
                    current_file = match.group(1).decode()
                    file_data = b''
            
            # 收集数据
            if current_file:
                # 跳过HTTP头
                if b'\r\n\r\n' in payload:
                    file_data += payload.split(b'\r\n\r\n', 1)[1]
                else:
                    file_data += payload
                
                # 检测结束
                if len(file_data) > 0 and pkt[TCP].flags & 0x01:  # FIN flag
                    files[current_file] = file_data
                    current_file = None
    
    return files

def search_pattern_in_pcap(pcap_file, pattern):
    """在PCAP中搜索模式"""
    packets = rdpcap(pcap_file)
    results = []
    
    for i, pkt in enumerate(packets):
        if pkt.haslayer(Raw):
            payload = pkt[Raw].load
            if re.search(pattern.encode(), payload):
                results.append({
                    'packet_num': i,
                    'src': pkt[IP].src if pkt.haslayer(IP) else None,
                    'dst': pkt[IP].dst if pkt.haslayer(IP) else None,
                    'payload': payload
                })
    
    return results

# 使用
files = extract_files_from_pcap('capture.pcap')
for filename, data in files.items():
    with open(filename, 'wb') as f:
        f.write(data)

results = search_pattern_in_pcap('capture.pcap', r'flag{.*?}')
for result in results:
    print(result)
```

### tcpdump

**使用**:
```bash
# 捕获数据包
tcpdump -i eth0 -w capture.pcap

# 读取文件
tcpdump -r capture.pcap

# 过滤
tcpdump -r capture.pcap 'tcp port 80'
tcpdump -r capture.pcap 'host 192.168.1.1'

# 显示ASCII
tcpdump -r capture.pcap -A

# 显示十六进制
tcpdump -r capture.pcap -X

# 不解析主机名
tcpdump -r capture.pcap -n

# 详细输出
tcpdump -r capture.pcap -v
tcpdump -r capture.pcap -vv
tcpdump -r capture.pcap -vvv
```

### NetworkMiner

**下载链接**:
```
https://www.netresec.com/?page=NetworkMiner
```

**功能**:
- 自动提取文件
- 主机信息分析
- 凭证提取
- DNS查询分析
- 图形化界面

**使用**:
```
1. File -> Open -> 选择PCAP文件
2. 查看各个标签页:
   - Hosts (主机信息)
   - Files (提取的文件)
   - Images (图片)
   - Messages (消息)
   - Credentials (凭证)
   - Sessions (会话)
   - DNS (DNS查询)
   - Parameters (参数)
```

### 其他工具

#### nmap

**下载链接**:
```
https://nmap.org/download.html
```

**使用**:
```bash
# 端口扫描
nmap 192.168.1.1

# 指定端口
nmap -p 80,443 192.168.1.1

# 全端口扫描
nmap -p- 192.168.1.1

# 服务版本检测
nmap -sV 192.168.1.1

# 操作系统检测
nmap -O 192.168.1.1

# 脚本扫描
nmap --script=default 192.168.1.1
nmap --script=vuln 192.168.1.1
```

#### Burp Suite

**下载链接**:
```
https://portswigger.net/burp/communitydownload
```

**功能**:
- HTTP代理
- 拦截请求/响应
- 重放攻击
- 扫描漏洞

## CTF解题技巧

!!! tip "PCAP分析流程"
    ```
    1. 基本信息
       - 文件大小、数据包数量
       - 时间跨度
       - 协议分布
    
    2. 协议分析
       - Statistics -> Protocol Hierarchy
       - 查看主要协议
    
    3. 会话分析
       - Statistics -> Conversations
       - 找可疑通信
    
    4. 字符串搜索
       - Edit -> Find Packet
       - frame contains "flag"
    
    5. 流追踪
       - Follow TCP/HTTP/UDP Stream
       - 重组数据
    
    6. 文件提取
       - File -> Export Objects
       - NetworkMiner自动提取
    ```

!!! tip "HTTP流量分析"
    ```
    常见隐藏位置:
    1. URL参数
       - GET请求的query string
       - ?data=base64...
    
    2. POST数据
       - 表单数据
       - JSON/XML
    
    3. Cookie
       - Set-Cookie header
       - 可能Base64编码
    
    4. HTTP头
       - User-Agent
       - Referer
       - 自定义头
    
    5. 响应内容
       - HTML注释
       - JavaScript代码
       - 图片/文件
    
    过滤器:
    http.request.method == "POST"
    http.cookie contains "flag"
    http contains "password"
    ```

!!! tip "TCP流重组"
    ```
    Wireshark:
    1. 右键数据包
    2. Follow -> TCP Stream
    3. 查看完整会话
    4. 保存原始数据
    
    显示选项:
    - ASCII
    - Hex Dump
    - C Arrays
    - Raw
    
    过滤特定流:
    tcp.stream eq 0
    tcp.stream eq 1
    ```

!!! tip "文件提取"
    ```
    方法1: Wireshark
    File -> Export Objects -> HTTP/SMB/TFTP
    
    方法2: NetworkMiner
    自动提取并分类
    
    方法3: tshark
    tshark -r file.pcap --export-objects http,./output/
    
    方法4: Scapy脚本
    自定义提取逻辑
    
    方法5: binwalk
    binwalk -e file.pcap
    ```

!!! tip "DNS隧道检测"
    ```
    特征:
    - 大量DNS查询
    - 异常长的域名
    - 频繁子域名查询
    
    过滤:
    dns
    dns.qry.name.len > 50
    
    分析:
    - 提取所有DNS查询
    - 解码子域名
    - 可能是Base64/Hex编码
    ```

!!! tip "USB流量分析"
    ```
    USB键盘流量:
    1. 过滤: usb.capdata
    2. 提取按键数据
    3. 解码为实际按键
    
    USB鼠标流量:
    1. 提取移动坐标
    2. 绘制轨迹
    3. 可能是图案/文字
    
    工具:
    - ctf-usb-keyboard-parser
    - Python脚本解析
    ```

!!! warning "常见问题"
    ```
    1. 数据包太多
       - 使用显示过滤器缩小范围
       - 关注特定协议
    
    2. 找不到关键信息
       - 搜索常见关键词: flag, password, key
       - 检查所有协议层
       - 查看TCP流
    
    3. 乱码数据
       - 可能是编码/加密
       - 尝试Base64/Hex解码
       - 查看是否有密钥交换
    
    4. 文件损坏
       - 检查文件头
       - 手动提取并修复
       - 使用binwalk
    ```

!!! tip "Scapy快速分析"
    ```python
    from scapy.all import *
    
    # 读取文件
    pkts = rdpcap('file.pcap')
    
    # 统计
    print(f"总数据包: {len(pkts)}")
    
    # 查看摘要
    pkts.summary()
    
    # 按协议分类
    tcp_pkts = [p for p in pkts if TCP in p]
    udp_pkts = [p for p in pkts if UDP in p]
    
    # 搜索payload
    for p in pkts:
        if Raw in p:
            if b'flag' in p[Raw].load:
                print(p[Raw].load)
    
    # 提取特定字段
    urls = [p[Raw].load.decode() for p in pkts 
            if TCP in p and Raw in p 
            and p[TCP].dport == 80]
    ```

## 相关资源

- **Wireshark**: 最强大的数据包分析工具
- **Scapy**: Python数据包处理库
- **NetworkMiner**: 自动化文件提取工具
- **tshark**: 命令行数据包分析
- **nmap**: 网络扫描工具
