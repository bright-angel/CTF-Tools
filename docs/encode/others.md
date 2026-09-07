# 其他编码

其他常见的编码格式和在线工具。

## 在线工具

### Encoding Converter
**链接**: [https://dencode.com/](https://dencode.com/)

**功能**: 多种编码格式转换

**特点**:
- 支持ASCII、Unicode、HTML实体等
- 一次性显示多种编码结果
- 适合快速识别编码类型

### Unicode转换
**链接**: [https://www.branah.com/unicode-converter](https://www.branah.com/unicode-converter)

**功能**: Unicode编码转换

**特点**:
- Unicode与文本互转
- 支持各种Unicode格式

### HTML Entity Encoder
**链接**: [https://mothereff.in/html-entities](https://mothereff.in/html-entities)

**功能**: HTML实体编码

**特点**:
- HTML实体与文本互转
- 支持十进制和十六进制格式

## 常见编码类型

### ASCII编码
将字符转换为对应的ASCII码值。

**示例**: 
```
A -> 65
a -> 97
0 -> 48
```

### 十六进制(Hex)
**链接**: [https://www.convertstring.com/](https://www.convertstring.com/)

**示例**:
```
Hello -> 48656c6c6f
```

### HTML实体编码
将特殊字符转换为HTML实体。

**示例**:
```
< -> &lt; 或 &#60;
> -> &gt; 或 &#62;
" -> &quot; 或 &#34;
```

### Unicode编码
**格式**:
- `\uXXXX` - JavaScript格式
- `\UXXXXXXXX` - Python格式
- `&#xXXXX;` - HTML格式

**示例**:
```
中 -> 中 或 &#x4e2d;
```

### Punycode
用于国际化域名编码(IDN)。

**链接**: [https://www.punycoder.com/](https://www.punycoder.com/)

**示例**:
```
中国.com -> xn--fiqs8s.com
```

### Quoted-Printable
常用于邮件编码。

**特点**:
- 用 `=XX` 表示特殊字符
- 可读性较好

### Morse Code
**链接**: [https://morsecode.world/international/translator.html](https://morsecode.world/international/translator.html)

**示例**:
```
SOS -> ... --- ...
```

!!! tip "识别技巧"
    - 看到 `%XX` 格式 → URL编码
    - 看到 `\xXX` 格式 → 十六进制转义
    - 看到 `&xxx;` 格式 → HTML实体
    - 看到 `\uXXXX` 格式 → Unicode
    - 看到 `.` 和 `-` 组合 → 摩尔斯电码
