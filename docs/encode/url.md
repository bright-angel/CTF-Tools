# URL编码工具

URL编码用于将特殊字符转换为URL安全格式。

## 在线工具

### URL编码解码

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| URL Encoder | [https://www.urlencoder.org/](https://www.urlencoder.org/) | 支持单次和多次编码 |
| Hi编码 | [http://www.hiencode.com/url.html](http://www.hiencode.com/url.html) | 中文友好，功能全面 |
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 万能工具，支持链式操作 |

## 离线工具

### Python urllib模块

**安装**: Python内置，无需安装

**基础用法**:
```python
from urllib.parse import quote, unquote

# URL编码
text = "Hello World 中文"
encoded = quote(text)
print(encoded)  # Hello%20World%20%E4%B8%AD%E6%96%87

# URL解码
decoded = unquote(encoded)
print(decoded)  # Hello World 中文

# 编码所有字符（包括/等）
encoded_safe = quote(text, safe='')
print(encoded_safe)
```

**双重编码**:
```python
from urllib.parse import quote

text = "' OR '1'='1"
# 一次编码
once = quote(text)
print(once)  # %27%20OR%20%271%27%3D%271

# 二次编码
twice = quote(once)
print(twice)  # %2527%2520OR%2520%25271%2527%253D%25271
```

### JavaScript encodeURI/encodeURIComponent

**浏览器控制台**:
```javascript
// encodeURI - 不编码 : / ? # 等
let url = "https://example.com/search?q=hello world";
console.log(encodeURI(url));
// https://example.com/search?q=hello%20world

// encodeURIComponent - 编码所有特殊字符
let param = "hello world & test";
console.log(encodeURIComponent(param));
// hello%20world%20%26%20test

// 解码
let encoded = "hello%20world";
console.log(decodeURIComponent(encoded));
// hello world
```

### Burp Suite Decoder

**工具**: Burp Suite内置

**使用方法**:
1. 打开Burp Suite
2. 进入Decoder标签
3. 输入文本
4. 选择编码类型（URL/Base64/HTML等）
5. 可多次编码/解码

## 编码规则

### 基本原则
URL编码将特殊字符转换为 `%XX` 格式，其中XX是字符的十六进制ASCII码。

### 常见字符编码对照表

| 字符 | URL编码 | 说明 |
|------|---------|------|
| 空格 | %20 或 + | 空格的两种表示 |
| ! | %21 | 感叹号 |
| " | %22 | 双引号 |
| # | %23 | 井号（锚点） |
| $ | %24 | 美元符号 |
| % | %25 | 百分号自身 |
| & | %26 | 和号（参数分隔） |
| ' | %27 | 单引号 |
| ( | %28 | 左括号 |
| ) | %29 | 右括号 |
| + | %2B | 加号 |
| , | %2C | 逗号 |
| / | %2F | 斜杠 |
| : | %3A | 冒号 |
| ; | %3B | 分号 |
| = | %3D | 等号 |
| ? | %3F | 问号 |
| @ | %40 | at符号 |
| [ | %5B | 左方括号 |
| ] | %5D | 右方括号 |

### 中文编码
中文字符按UTF-8编码，每个字节转为%XX：

```
"中" = E4 B8 AD (UTF-8)
URL编码 = %E4%B8%AD
```

## 双重/多重URL编码

### 用途
在某些绕过场景中，可能需要进行两次或多次URL编码。

### 示例
```
原文: ' OR '1'='1
一次编码: %27%20OR%20%271%27%3D%271
二次编码: %2527%2520OR%2520%25271%2527%253D%25271
```

### Python实现
```python
from urllib.parse import quote

def multi_encode(text, times=2):
    """多重URL编码"""
    result = text
    for i in range(times):
        result = quote(result, safe='')
        print(f"第{i+1}次编码: {result}")
    return result

# 使用
multi_encode("' OR '1'='1", 3)
```

## CTF解题技巧

!!! tip "快速识别"
    - 看到 `%` 符号 → 可能是URL编码
    - `%20` → 空格
    - `%2F` → 斜杠 /
    - `%3D` → 等号 =

!!! tip "常见考点"
    - **SQL注入**: URL编码绕过过滤
    - **XSS**: 双重编码绕过WAF
    - **文件包含**: ..%2F..%2F 目录遍历
    - **命令注入**: 编码特殊字符

!!! warning "注意事项"
    - 区分 `+` 和 `%20`（都表示空格）
    - 注意大小写（%2f 和 %2F相同）
    - 浏览器会自动解码URL
    - Burp等工具可能自动处理编码

!!! tip "WAF绕过"
    ```
    # 标准payload
    ' OR 1=1--
    
    # URL编码
    %27%20OR%201%3D1--
    
    # 双重编码
    %2527%2520OR%25201%253D1--
    
    # 混合编码
    %27%20OR%201=1--
    '%20OR%201=1--
    ```

## 相关工具

### 在线编码转换
- **多种编码**: [https://tool.lu/](https://tool.lu/)
- **编码识别**: [https://dencode.com/](https://dencode.com/)

### 浏览器插件
- **HackBar**: 快速编码解码
- **Proxy SwitchyOmega**: 配合Burp使用
