# Base系列编码

Base系列编码是CTF中最常见的编码方式之一。

## 在线工具

### CyberChef
**链接**: [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/)

**功能**: 强大的数据处理工具，支持几乎所有编码解码操作

**特点**:
- 支持Base16/32/64/85等多种Base编码
- 可以链式处理多个操作
- 提供配方(Recipe)保存功能
- 完全离线可用

### Base64 在线编解码
**链接**: [https://www.base64decode.org/](https://www.base64decode.org/)

**功能**: 简单的Base64编解码

**特点**:
- 界面简洁
- 快速编解码
- 支持文件上传

### BugKu CTF工具 - Base系列
**Base16**: [https://ctf.bugku.com/tool/base16](https://ctf.bugku.com/tool/base16)  
**Base32**: [https://ctf.bugku.com/tool/base32](https://ctf.bugku.com/tool/base32)  
**Base58**: [https://ctf.bugku.com/tool/base58](https://ctf.bugku.com/tool/base58)  
**Base62**: [https://ctf.bugku.com/tool/base62](https://ctf.bugku.com/tool/base62)  
**Base64**: [https://ctf.bugku.com/tool/base64](https://ctf.bugku.com/tool/base64)  
**Base85**: [https://ctf.bugku.com/tool/base85](https://ctf.bugku.com/tool/base85)  
**Base91**: [https://ctf.bugku.com/tool/base91](https://ctf.bugku.com/tool/base91)  
**Base92**: [https://ctf.bugku.com/tool/base92](https://ctf.bugku.com/tool/base92)  
**Base100**: [https://ctf.bugku.com/tool/base100](https://ctf.bugku.com/tool/base100)

**功能**: CTF专用Base系列编解码

**特点**:
- 覆盖Base16到Base100
- 中文界面友好
- CTF场景优化

### Base64 图片编码
**链接**: [https://www.base64-image.de/](https://www.base64-image.de/)

**功能**: 图片与Base64互转

**特点**:
- 支持图片转Base64
- 支持Base64转图片预览

## 常见Base编码对照

| 编码类型 | 字符集 | 用途 |
|---------|--------|------|
| Base16 | 0-9, A-F | 十六进制表示 |
| Base32 | A-Z, 2-7 | 常用于某些加密场景 |
| Base64 | A-Z, a-z, 0-9, +, / | 最常见，用于数据传输 |
| Base85 | ASCII可见字符 | 压缩率更高 |

## 识别技巧

- **Base64**: 通常以 `=` 或 `==` 结尾，字符集包含大小写字母、数字、+、/
- **Base32**: 全大写字母加数字2-7，可能以 `=` 结尾
- **Base16**: 只包含0-9和A-F（或a-f）

!!! tip "快速识别"
    Base64编码后的长度是原始数据的4/3倍，且通常能被4整除。

## CTF解题技巧

!!! tip "多层编码"
    CTF中常见多次Base64编码，可以尝试：
    ```python
    import base64
    data = "密文"
    for i in range(10):  # 尝试解码10次
        try:
            data = base64.b64decode(data).decode()
            print(f"第{i+1}次: {data}")
        except:
            break
    ```

!!! tip "变种Base64"
    注意自定义字符表的Base64变种，可能字符集不同
