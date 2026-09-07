# Java逆向工具

Java程序的反编译和分析工具。

## 在线工具

### 在线反编译

| 工具名称 | 链接 | 支持格式 |
|---------|------|----------|
| Java Decompilers | [http://www.javadecompilers.com/](http://www.javadecompilers.com/) | .class/.jar |
| CFR Online | [https://www.benf.org/other/cfr/](https://www.benf.org/other/cfr/) | 在线试用 |

## 离线工具

### 反编译器

#### JD-GUI

**下载链接**:
```
https://github.com/java-decompiler/jd-gui/releases
```

**基本使用**:
```bash
# GUI启动
java -jar jd-gui.jar

# 命令行
jd-cli app.jar -od output/
```

#### CFR

**下载链接**:
```
https://www.benf.org/other/cfr/
```

**使用**:
```bash
# 单个class文件
java -jar cfr.jar MyClass.class

# Jar文件
java -jar cfr.jar app.jar --outputdir output/

# 处理混淆
java -jar cfr.jar obfuscated.jar --renamedupmembers true --removeboilerplate true
```

**特点**: 支持Java 14+、Lambda表达式、Switch表达式

#### Procyon

**下载链接**:
```
https://github.com/mstrobel/procyon/releases
```

**使用**:
```bash
java -jar procyon-decompiler.jar Example.class
java -jar procyon-decompiler.jar -jar app.jar -o output/
```

#### Bytecode Viewer

**下载链接**:
```
https://github.com/Konloch/bytecode-viewer/releases
```

**功能**: 集成多个反编译器的综合工具

**特点**:
- 同时使用JD-GUI、CFR、Procyon等
- 字节码查看
- 支持JAR/APK/CLASS
- 插件系统
- 搜索功能

**使用**:
```bash
java -jar BytecodeViewer.jar
```

#### Jar Analyzer

**下载链接**:
```
https://github.com/jar-analyzer/jar-analyzer
```

**功能**: Jar静态分析工具

**特点**:
- 依赖分析
- 方法调用链
- 字节码分析
- Spring分析

### Android逆向

#### JADX

**下载链接**:
```
https://github.com/skylot/jadx/releases
```

**GUI使用**:
```
1. 启动jadx-gui
2. 打开APK/DEX/JAR
3. 自动反编译为Java代码
4. File -> Save as gradle project
```

**命令行**:
```bash
# 反编译APK
jadx app.apk -d output/

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

**使用**:
```bash
# 反编译（得到smali代码）
apktool d app.apk -o output/

# 重新打包
apktool b output/ -o new.apk

# 查看资源
apktool d -s app.apk  # 不反编译smali
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

# 然后用JD-GUI打开jar
```

#### GDA

**下载链接**:
```
http://www.gda.wiki:9090/
```

**特点**: 
- 中文界面
- 静态分析
- 动态调试
- 专业Android分析工具

### 其他工具

#### JavaDecompile-GUI

**下载链接**:
```
https://github.com/MountCloud/JavaDecompileTool-GUI
```

**功能**: 集成多个反编译器的GUI工具

#### CodeReviewTools

**下载链接**:
```
https://github.com/Ppsoft1991/CodeReviewTools
```

**功能**: Java代码审计工具

## 混淆识别

### 常见混淆器

| 混淆器 | 特征 | 强度 |
|--------|------|------|
| ProGuard | 类名变a/b/c | 中 |
| DexGuard | ProGuard商业版 | 高 |
| Allatori | 字符串加密 | 中高 |
| Zelix KlassMaster | 控制流混淆 | 高 |
| yGuard | 开源混淆 | 中 |

### 识别特征

```java
// ProGuard混淆后
class a {
    void a(String a) {
        a.a();
    }
}

// 字符串加密
String s = decrypt("\x1a\x2b\x3c\x4d");

// 控制流平坦化
switch(state) {
    case 0: ...
    case 1: ...
}
```

## CTF解题技巧

!!! tip "快速分析"
    ```
    1. 确定入口点
       - jar: MANIFEST.MF中的Main-Class
       - apk: AndroidManifest.xml中的MainActivity
    
    2. 搜索关键字
       - "flag" / "password" / "key"
       - Base64编码的字符串
       - 加密函数名
    
    3. 理解算法
       - 定位加密/验证函数
       - 提取算法逻辑
       - Python重写验证
    ```

!!! tip "Jar文件分析"
    ```bash
    # 1. 解压查看
    unzip app.jar -d extracted/
    
    # 2. 查看清单
    cat META-INF/MANIFEST.MF
    
    # 3. 反编译
    java -jar cfr.jar app.jar --outputdir src/
    
    # 4. 搜索字符串
    grep -r "flag" src/
    
    # 5. 运行测试
    java -jar app.jar
    ```

!!! tip "APK分析流程"
    ```bash
    # 1. 基本信息
    aapt dump badging app.apk
    
    # 2. 反编译Java代码
    jadx app.apk -d output/
    
    # 3. 反编译smali代码
    apktool d app.apk -o smali_output/
    
    # 4. 查看资源
    ls smali_output/res/
    ls smali_output/assets/
    
    # 5. 提取native库
    unzip app.apk "lib/*"
    ```

!!! tip "处理混淆"
    ```
    1. 重命名变量
       - 根据用途重命名类和方法
       - N键在IDE中重命名
    
    2. 理解控制流
       - 画出流程图
       - 识别真实逻辑
    
    3. 动态调试
       - 在关键位置打断点
       - 观察实际数据
    
    4. 字符串解密
       - 找到解密函数
       - 批量解密所有字符串
    ```

!!! tip "常见算法识别"
    ```java
    // Base64
    Base64.getDecoder().decode(...)
    Base64.getEncoder().encode(...)
    
    // AES
    Cipher.getInstance("AES/...")
    KeyGenerator.getInstance("AES")
    
    // MD5/SHA
    MessageDigest.getInstance("MD5")
    MessageDigest.getInstance("SHA-256")
    
    // RSA
    Cipher.getInstance("RSA")
    KeyPairGenerator.getInstance("RSA")
    ```

!!! warning "注意事项"
    ```
    - 检查native方法（需分析.so文件）
    - 资源文件可能藏有关键信息
    - 某些混淆难以静态分析
    - 可修改代码重新编译运行
    - 注意反调试和完整性检查
    ```

!!! tip "工具选择"
    ```
    快速查看: JD-GUI
    复杂代码: CFR
    对比分析: Bytecode Viewer（多反编译器）
    Android: JADX（Java代码）+ APKTool（smali）
    深度分析: Bytecode Viewer + 动态调试
    ```

## 相关资源

- **CFR**: 支持最新Java特性的反编译器
- **JADX**: Android APK反编译首选
- **Bytecode Viewer**: 集成多个反编译器，方便对比
- **APKTool**: APK反编译和重打包标准工具
