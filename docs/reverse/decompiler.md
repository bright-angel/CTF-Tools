# 反编译工具

将二进制文件或字节码还原为高级语言代码。

## Java反编译

### JD-GUI Online
**链接**: [http://www.javadecompilers.com/](http://www.javadecompilers.com/)

**功能**: 在线Java反编译

**支持格式**:
- .class文件
- .jar文件

**特点**:
- 无需安装
- 快速反编译
- 支持导出源码

### CFR
**链接**: [https://www.benf.org/other/cfr/](https://www.benf.org/other/cfr/)

**功能**: Java反编译器

**特点**:
- 支持Java新特性
- Lambda表达式
- 在线试用版本

### Procyon
**链接**: [https://github.com/mstrobel/procyon](https://github.com/mstrobel/procyon)

**功能**: Java反编译器

**特点**:
- 支持Java 8+
- 处理复杂代码
- 命令行工具

## Python反编译

### Python在线反编译
**链接**: [https://pylingual.io/](https://pylingual.io/)

**功能**: Python字节码反编译

**支持**:
- .pyc文件
- .pyo文件

### Uncompyle6
**安装**: `pip install uncompyle6`

**功能**: Python反编译工具

**用法**:
```bash
uncompyle6 file.pyc
```

**支持版本**: Python 2.7 - 3.8

### PyInstaller Extractor
**链接**: [https://github.com/extremecoders-re/pyinstxtractor](https://github.com/extremecoders-re/pyinstxtractor)

**功能**: 提取PyInstaller打包的程序

**用法**:
```bash
python pyinstxtractor.py program.exe
```

## .NET反编译

### ILSpy Online
**链接**: [https://sharplab.io/](https://sharplab.io/)

**功能**: C#/.NET在线反编译

**特点**:
- 查看IL代码
- 多种语言输出
- 实时编译

### dnSpy
**链接**: [https://github.com/dnSpy/dnSpy](https://github.com/dnSpy/dnSpy)

**功能**: .NET调试和反编译

**特点**:
- 反编译
- 调试
- 修改程序集
- Windows工具

### dotPeek
**链接**: [https://www.jetbrains.com/decompiler/](https://www.jetbrains.com/decompiler/)

**功能**: JetBrains出品的.NET反编译器

**特点**:
- 免费
- 高质量反编译
- 支持最新.NET

## Android反编译

### JADX
**链接**: [https://github.com/skylot/jadx](https://github.com/skylot/jadx)

**功能**: Android APK反编译

**特点**:
- DEX转Java
- 支持APK、DEX、JAR
- GUI和命令行

**在线版**: [http://www.javadecompilers.com/apk](http://www.javadecompilers.com/apk)

### APKTool
**链接**: [https://ibotpeaches.github.io/Apktool/](https://ibotpeaches.github.io/Apktool/)

**功能**: APK反编译和重打包

**用法**:
```bash
apktool d app.apk        # 反编译
apktool b app -o new.apk # 重新打包
```

### GDA (GJoy Dex Analyzer)
**链接**: [http://www.gda.wiki:9090/](http://www.gda.wiki:9090/)

**功能**: Android应用分析工具

**特点**:
- 静态分析
- 动态调试
- 中文界面

## Web反编译

### JavaScript Beautifier
**链接**: [https://beautifier.io/](https://beautifier.io/)

**功能**: JavaScript代码美化

**特点**:
- 格式化混淆代码
- 提高可读性

### JS Nice
**链接**: [http://www.jsnice.org/](http://www.jsnice.org/)

**功能**: JavaScript反混淆

**特点**:
- AI驱动
- 变量名预测
- 类型推断

### WebAssembly反编译
**链接**: [https://webassembly.github.io/wabt/demo/wasm2wat/](https://webassembly.github.io/wabt/demo/wasm2wat/)

**功能**: WASM转WAT文本格式

## 其他语言

### Ghidra
**链接**: [https://ghidra-sre.org/](https://ghidra-sre.org/)

**功能**: NSA开源的逆向工程框架

**特点**:
- 反汇编
- 反编译
- 支持多种架构
- 脚本自动化

### IDA Pro
**链接**: [https://hex-rays.com/ida-pro/](https://hex-rays.com/ida-pro/)

**功能**: 专业级反汇编器

**特点**:
- 业界标准
- 强大的反汇编能力
- 支持插件
- 免费版(IDA Free)功能受限

### Hopper
**链接**: [https://www.hopperapp.com/](https://www.hopperapp.com/)

**功能**: macOS/Linux反汇编器

**特点**:
- 用户友好
- 支持ARM/x86
- 伪代码生成

### Cutter
**链接**: [https://cutter.re/](https://cutter.re/)

**功能**: 基于Rizin的逆向工程平台

**特点**:
- 开源免费
- 现代化界面
- Ghidra反编译器集成

## CTF解题技巧

!!! tip "Java/Android"
    - 检查混淆保护(ProGuard/DexGuard)
    - 寻找硬编码密钥
    - 注意native方法(.so文件)
    - 动态调试验证逻辑

!!! tip "Python"
    - .pyc文件注意版本匹配
    - marshal模块序列化
    - 可能存在反调试
    - PyArmor等加密工具

!!! tip ".NET"
    - 检查混淆器(ConfuserEx等)
    - 资源文件可能藏数据
    - IL代码直接分析
    - dnSpy可直接修改调试

!!! warning "反编译局限"
    - 变量名丢失
    - 注释消失
    - 代码结构可能不同
    - 混淆后难以理解
    - 部分逻辑可能错误
