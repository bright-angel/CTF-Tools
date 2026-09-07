# Base系列编码工具

Base系列编码是CTF中最常见的编码方式之一。

## 在线工具

### Base64 编码解码

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| CyberChef | [https://gchq.github.io/CyberChef/](https://gchq.github.io/CyberChef/) | 功能最全，支持链式操作 |
| Base64 Decode | [https://www.base64decode.org/](https://www.base64decode.org/) | 界面简洁，支持文件 |
| BugKu Base64 | [https://ctf.bugku.com/tool/base64](https://ctf.bugku.com/tool/base64) | CTF专用，中文友好 |

### Base系列全家桶 (BugKu)

| 编码类型 | 在线工具链接 | 字符集 |
|---------|-------------|--------|
| Base16 | [https://ctf.bugku.com/tool/base16](https://ctf.bugku.com/tool/base16) | 0-9, A-F |
| Base32 | [https://ctf.bugku.com/tool/base32](https://ctf.bugku.com/tool/base32) | A-Z, 2-7 |
| Base58 | [https://ctf.bugku.com/tool/base58](https://ctf.bugku.com/tool/base58) | 去除易混淆字符 |
| Base62 | [https://ctf.bugku.com/tool/base62](https://ctf.bugku.com/tool/base62) | A-Z, a-z, 0-9 |
| Base64 | [https://ctf.bugku.com/tool/base64](https://ctf.bugku.com/tool/base64) | A-Z, a-z, 0-9, +, / |
| Base85 | [https://ctf.bugku.com/tool/base85](https://ctf.bugku.com/tool/base85) | ASCII可见字符 |
| Base91 | [https://ctf.bugku.com/tool/base91](https://ctf.bugku.com/tool/base91) | 91个字符 |
| Base92 | [https://ctf.bugku.com/tool/base92](https://ctf.bugku.com/tool/base92) | 92个字符 |
| Base100 | [https://ctf.bugku.com/tool/base100](https://ctf.bugku.com/tool/base100) | Emoji编码 |

### Base64图片编码

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Base64 Image | [https://www.base64-image.de/](https://www.base64-image.de/) | 图片与Base64互转 |

## 离线工具

### Python base64模块

**安装**: Python内置，无需安装

**基础用法**:
```python
import base64

# 编码
data = "Hello World"
encoded = base64.b64encode(data.encode()).decode()
print(encoded)  # SGVsbG8gV29ybGQ=

# 解码
decoded = base64.b64decode(encoded).decode()
print(decoded)  # Hello World

# Base32
b32_encoded = base64.b32encode(data.encode()).decode()
print(b32_encoded)

# Base16
b16_encoded = base64.b16encode(data.encode()).decode()
print(b16_encoded)
```

**多次解码**:
```python
import base64

def multi_base64_decode(data, max_times=10):
    """尝试多次Base64解码"""
    for i in range(max_times):
        try:
            data = base64.b64decode(data).decode()
            print(f"第{i+1}次解码: {data}")
        except:
            print(f"解码{i}次后停止")
            break
    return data

# 使用
encoded = "U0dWc2JHOGdWMjl5YkdRPQ=="  # 三次Base64编码
result = multi_base64_decode(encoded)
```

### CyberChef 离线版

**下载**:
```
https://github.com/gchq/CyberChef/releases
```

**安装**:
1. 下载zip文件
2. 解压到本地
3. 打开`CyberChef_vX.X.X.html`

**使用方法**:
- 从左侧拖拽操作到中间Recipe区域
- 在Input区域输入数据
- 自动在Output区域显示结果
- 可保存Recipe供后续使用

## 编码对照表

| 编码类型 | 字符集 | 编码长度 | 用途 |
|---------|--------|----------|------|
| Base16 | 0-9, A-F | 原长度×2 | 十六进制表示 |
| Base32 | A-Z, 2-7 | 原长度×1.6 | 某些加密场景 |
| Base58 | 去除0OIl | 原长度×1.37 | 比特币地址 |
| Base64 | A-Z, a-z, 0-9, +, / | 原长度×1.33 | 最常用，数据传输 |
| Base85 | ASCII 33-117 | 原长度×1.25 | 压缩率更高 |
| Base100 | Emoji | 原长度×4-8 | 趣味编码 |

## 识别技巧

### 字符特征

| Base类型 | 特征 |
|---------|------|
| Base64 | 包含大小写字母、数字、+、/，可能以=结尾 |
| Base32 | 全大写字母A-Z + 数字2-7，可能以=结尾 |
| Base16 | 只包含0-9和A-F（或a-f） |
| Base58 | 不包含0、O、I、l，只有大小写字母和数字 |
| Base100 | 全是Emoji表情符号 |

### 长度规律

```python
# Base64长度计算
原始长度 = n字节
Base64长度 = ⌈n/3⌉ × 4 字符
# 长度一定是4的倍数（含padding）

# 示例
原始: "A" (1字节) → Base64: "QQ==" (4字符)
原始: "AB" (2字节) → Base64: "QUI=" (4字符)
原始: "ABC" (3字节) → Base64: "QUJD" (4字符)
```

## CTF解题技巧

!!! tip "快速识别"
    1. 看字符集：是否只包含特定字符
    2. 看长度：Base64长度能被4整除
    3. 看结尾：Base64/32可能有=填充
    4. 看规律：尝试解码，看是否可读

!!! tip "常见考点"
    - **多层编码**: 连续多次Base64编码
    - **混合编码**: Base64+URL+Hex组合
    - **自定义表**: 修改标准Base64字符表
    - **无padding**: 去掉=填充符
    - **URL safe**: 用-和_替换+和/

!!! warning "变种处理"
    ```python
    # 标准Base64字符表
    standard = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    
    # 自定义字符表示例
    custom = "ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210+/"
    
    # 转换函数
    def custom_base64_decode(data, custom_table):
        import base64
        trans_table = str.maketrans(custom_table, standard)
        standard_data = data.translate(trans_table)
        return base64.b64decode(standard_data)
    ```

## 相关资源

- **RFC 4648**: Base编码标准文档
- **CyberChef食谱**: [https://github.com/mattnotmax/cyberchef-recipes](https://github.com/mattnotmax/cyberchef-recipes)
