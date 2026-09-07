# 反编译工具

将二进制文件或字节码还原为高级语言代码。

## 在线工具

### Java反编译

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| JD-GUI Online | [http://www.javadecompilers.com/](http://www.javadecompilers.com/) | 在线反编译.class/.jar |
| CFR Online | [https://www.benf.org/other/cfr/](https://www.benf.org/other/cfr/) | 支持Java新特性、Lambda |
| Procyon Online | 部分网站提供 | 支持Java 8+ |

### Python反编译

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Pylingual | [https://pylingual.io/](https://pylingual.io/) | .pyc在线反编译 |

### .NET反编译

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| SharpLab | [https://sharplab.io/](https://sharplab.io/) | C#在线反编译、查看IL |

### Android反编译

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| APK在线反编译 | [http://www.javadecompilers.com/apk](http://www.javadecompilers.com/apk) | APK在线反编译 |

### JavaScript工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| JS Beautifier | [https://beautifier.io/](https://beautifier.io/) | JavaScript格式化 |
| JS Nice | [http://www.jsnice.org/](http://www.jsnice.org/) | AI反混淆、变量名预测 |
| WASM反编译 | [https://webassembly.github.io/wabt/demo/wasm2wat/](https://webassembly.github.io/wabt/demo/wasm2wat/) | WebAssembly转WAT |

## 离线工具

### Java反编译

#### JD-GUI

**下载链接**:
```
https://github.com/java-decompiler/jd-gui/releases
```

**基本使用**:
```bash
# 启动GUI
java -jar jd-gui.jar

# 打开.class或.jar文件
File -> Open -> 选择文件

# 保存反编译结果
File -> Save All Sources
```

#### CFR

**下载链接**:
```
https://www.benf.org/other/cfr/
```

**命令行使用**:
```bash
# 反编译单个class文件
java -jar cfr.jar Example.class

# 反编译jar文件
java -jar cfr.jar app.jar --outputdir output/

# 指定输出目录
java -jar cfr.jar app.jar --outputpath output/decompiled.java

# 处理混淆代码
java -jar cfr.jar obfuscated.jar --renamedupmembers true
```

**特点**: 支持Java 14+新特性、Lambda、Switch表达式

#### Procyon

**下载链接**:
```
https://github.com/mstrobel/procyon
```

**使用**:
```bash
java -jar procyon-decompiler.jar Example.class

# 反编译jar
java -jar procyon-decompiler.jar -jar app.jar -o output/
```

### Python反编译

#### uncompyle6

**下载链接**:
```bash
pip install uncompyle6
```

**基本使用**:
```bash
# 反编译.pyc文件
uncompyle6 file.pyc

# 输出到文件
uncompyle6 file.pyc > output.py

# 反编译整个目录
uncompyle6 -o output_dir/ input_dir/*.pyc

# 指定Python版本
uncompyle6 --py 3.8 file.pyc
```

**支持版本**: Python 2.7, 3.0-3.8

#### pycdc

**下载链接**:
```
https://github.com/zrax/pycdc
```

**编译安装**:
```bash
git clone https://github.com/zrax/pycdc
cd pycdc
cmake .
make

# 使用
./pycdc file.pyc
./pycdas file.pyc  # 反汇编
```

**支持版本**: Python 1.5-3.9+

#### PyInstaller Extractor

**下载链接**:
```
https://github.com/extremecoders-re/pyinstxtractor
```

**使用**:
```bash
python pyinstxtractor.py program.exe

# 提取后得到.pyc文件
# 需要添加magic number和时间戳
python -c "import marshal; exec(marshal.loads(open('file.pyc','rb').read()[16:]))"

# 或使用uncompyle6继续反编译
uncompyle6 extracted.pyc
```

**PyArmor加密破解**:
```bash
# PyArmor是Python代码混淆加密工具
# 破解需要分析运行时
# 参考: https://github.com/dashingsoft/pyarmor
```

### .NET反编译

#### dnSpy

**下载链接**:
```
https://github.com/dnSpy/dnSpy/releases
```

**功能**:
```
1. 打开.exe或.dll文件
2. 查看IL代码和C#代码
3. 设置断点调试
4. 修改代码并保存
5. 导出源码
```

**快捷键**:
```
F5: 调试运行
F9: 设置断点
F10: 单步跳过
F11: 单步进入
Ctrl+Shift+K: 编辑类/方法
```

**修改程序集**:
```
1. 右键方法 -> Edit Method
2. 修改代码
3. Compile
4. File -> Save Module
```

#### ILSpy

**下载链接**:
```
https://github.com/icsharpcode/ILSpy/releases
```

**使用**:
```
1. 打开.exe/.dll
2. 选择反编译语言（C#/VB/IL）
3. 导出项目：File -> Save Code
```

#### dotPeek

**下载链接**:
```
https://www.jetbrains.com/decompiler/
```

**特点**: JetBrains出品，免费，高质量反编译

### Android反编译

#### JADX

**下载链接**:
```
https://github.com/skylot/jadx/releases
```

**GUI使用**:
```
1. 启动jadx-gui
2. 打开APK/DEX/JAR文件
3. 查看反编译后的Java代码
4. File -> Save as gradle project
```

**命令行使用**:
```bash
# 反编译APK
jadx app.apk -d output/

# 反编译DEX
jadx classes.dex -d output/

# 不反混淆
jadx app.apk --no-deobf

# 保留行号
jadx app.apk --show-bad-code
```

#### APKTool

**下载链接**:
```
https://ibotpeaches.github.io/Apktool/
```

**安装使用**:
```bash
# Windows
下载apktool.bat和apktool.jar

# Linux/Mac
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.x.x.jar
mv apktool_2.x.x.jar apktool.jar
chmod +x apktool apktool.jar

# 反编译APK（得到smali代码）
apktool d app.apk -o output/

# 重新打包
apktool b output/ -o new.apk

# 签名（需要jarsigner）
keytool -genkey -v -keystore my.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my.keystore new.apk alias_name
```

#### dex2jar

**下载链接**:
```
https://github.com/pxb1988/dex2jar
```

**使用**:
```bash
# DEX转JAR
d2j-dex2jar app.apk
d2j-dex2jar classes.dex

# 然后用JD-GUI打开jar文件
```

#### GDA

**下载链接**:
```
http://www.gda.wiki:9090/
```

**特点**: 中文界面，静态分析+动态调试

### 通用反编译工具

#### Ghidra

**下载链接**:
```
https://ghidra-sre.org/
```

**安装**:
```bash
# 需要JDK 11+
# 下载解压后
cd ghidra_10.x.x
./ghidraRun  # Linux/Mac
ghidraRun.bat  # Windows
```

**基本使用**:
```
1. File -> New Project
2. File -> Import File（选择二进制文件）
3. 双击文件分析
4. 查看反汇编代码和反编译代码
5. Window -> Decompile查看伪C代码
```

**脚本自动化**:
```python
# Ghidra Python脚本
from ghidra.app.decompiler import DecompInterface

# 获取当前函数
func = getFunctionContaining(currentAddress)
if func:
    # 反编译
    decompiler = DecompInterface()
    decompiler.openProgram(currentProgram)
    result = decompiler.decompileFunction(func, 30, monitor)
    print(result.getDecompiledFunction().getC())
```

#### IDA Pro / IDA Free

**下载链接**:
```
https://hex-rays.com/ida-free/
```

**IDA Free限制**:
- 仅支持x86/x64
- 无反编译器
- 无团队协作功能

**IDA Pro功能**:
```
F5: 反编译（需要Hex-Rays插件）
G: 跳转到地址
N: 重命名
X: 交叉引用
Space: 切换图形/文本视图
```

#### Cutter

**下载链接**:
```
https://cutter.re/
```

**特点**: 基于Rizin，开源免费，集成Ghidra反编译器

**使用**:
```
1. 打开二进制文件
2. 自动分析
3. 查看反汇编和反编译代码
4. Graph视图查看控制流
```

#### Hopper

**下载链接**:
```
https://www.hopperapp.com/
```

**平台**: macOS/Linux

**特点**: 界面友好，支持ARM/x86/x64

## CTF解题技巧

!!! tip "Java/Android反编译"
    ```
    1. 反编译APK流程
       - apktool d app.apk（获取资源和smali）
       - jadx app.apk（获取Java代码）
       - 查看AndroidManifest.xml
    
    2. 寻找关键信息
       - 硬编码密钥/密码
       - 算法逻辑
       - native方法（需分析.so）
       - 网络API端点
    
    3. 混淆识别
       - ProGuard: 类名变成a/b/c
       - DexGuard: 更强混淆
       - 字符串加密
    
    4. 动态调试
       - dnSpy直接调试.NET
       - Android Studio调试smali
       - Frida动态Hook
    ```

!!! tip "Python反编译"
    ```
    1. .pyc文件处理
       - 检查Python版本（magic number）
       - uncompyle6反编译
       - 版本不匹配尝试pycdc
    
    2. PyInstaller程序
       - pyinstxtractor提取
       - 找到主.pyc文件
       - 添加magic number
       - uncompyle6反编译
    
    3. PyArmor加密
       - 运行时解密
       - 内存dump
       - 动态分析
    ```

!!! tip ".NET反编译"
    ```
    1. dnSpy使用技巧
       - 反编译查看逻辑
       - 修改代码重新编译
       - 调试运行观察
       - 搜索字符串/方法
    
    2. 混淆处理
       - ConfuserEx混淆
       - de4dot去混淆工具
       - 手动分析IL代码
    
    3. 资源文件
       - 图片、配置可能藏flag
       - 使用ResourceHacker提取
    ```

!!! tip "通用技巧"
    ```
    1. 字符串搜索
       - 搜索"flag"/"password"/"key"
       - Base64编码的字符串
       - 硬编码的URL/IP
    
    2. 算法识别
       - 加密算法特征（AES/RSA/DES）
       - 哈希函数（MD5/SHA1/SHA256）
       - 自定义加密逻辑
    
    3. 控制流分析
       - 关键判断逻辑
       - 输入验证
       - 反调试检测
    
    4. 动态分析结合
       - 静态分析找到关键函数
       - 动态调试验证逻辑
       - Hook关键函数
    ```

!!! warning "反编译局限"
    ```
    - 变量名丢失（除非有调试信息）
    - 注释全部消失
    - 代码结构可能重组
    - 混淆代码难以理解
    - 部分逻辑可能不准确
    - 优化可能导致代码差异
    ```

!!! tip "工具选择建议"
    ```
    Java:
    - 快速查看: JD-GUI
    - 复杂代码: CFR
    - 命令行: Procyon
    
    Python:
    - 标准: uncompyle6
    - 新版本: pycdc
    - PyInstaller: pyinstxtractor
    
    .NET:
    - 调试修改: dnSpy
    - 纯反编译: ILSpy/dotPeek
    
    Android:
    - Java代码: JADX
    - Smali代码: APKTool
    - 综合分析: GDA
    
    通用:
    - 开源首选: Ghidra
    - 专业级: IDA Pro
    - 轻量级: Cutter
    ```

## 相关资源

- **Ghidra**: NSA开源，免费强大，支持多架构
- **dnSpy**: .NET反编译调试神器，可直接修改
- **JADX**: Android APK反编译首选
- **uncompyle6**: Python反编译标准工具
- **IDA Free**: 免费版IDA，适合学习
- **Cutter**: 现代化开源逆向平台
