# Java逆向工具

Java程序的反编译和分析工具。

## 在线反编译

### Java Decompilers
**链接**: [http://www.javadecompilers.com/](http://www.javadecompilers.com/)

**功能**: 在线Java反编译

**支持格式**:
- .class文件
- .jar文件

**特点**:
- 多种反编译器
- 在线处理
- 无需安装

## 离线反编译器

### JAD
**经典工具**: Java Decompiler

**特点**:
- 老牌反编译器
- 命令行工具
- 速度快

### CFR
**GitHub**: [https://github.com/leibnitz27/cfr](https://github.com/leibnitz27/cfr)

**功能**: 现代Java反编译器

**特点**:
- 支持Java 8+特性
- Lambda表达式
- 命令行使用

**用法**:
```bash
java -jar cfr.jar MyClass.class
java -jar cfr.jar app.jar --outputdir output/
```

### Procyon
**链接**: [https://github.com/mstrobel/procyon](https://github.com/mstrobel/procyon)

**功能**: Java反编译器

**特点**:
- 支持现代Java特性
- 良好的lambda支持
- 活跃维护

### JD-GUI
**下载**: [http://java-decompiler.github.io/](http://java-decompiler.github.io/)

**功能**: 图形化Java反编译器

**特点**:
- 图形界面
- 目录树浏览
- 跨平台

## 综合工具

### Bytecode Viewer
**GitHub**: [https://github.com/Konloch/bytecode-viewer](https://github.com/Konloch/bytecode-viewer)

**功能**: 多合一Java逆向工具

**特点**:
- 集成多个反编译器
- 字节码查看
- APK反编译
- 插件支持

### Jar Analyzer
**GitHub**: [https://github.com/jar-analyzer/jar-analyzer](https://github.com/jar-analyzer/jar-analyzer)

**功能**: Jar文件分析工具

**特点**:
- 依赖分析
- 字节码分析
- 安全检查

## 反编译GUI工具

### JavaDecompileTool-GUI
**GitHub**: [https://github.com/MountCloud/JavaDecompileTool-GUI](https://github.com/MountCloud/JavaDecompileTool-GUI)

**功能**: Java反编译GUI工具

### CodeReviewTools
**GitHub**: [https://github.com/Ppsoft1991/CodeReviewTools](https://github.com/Ppsoft1991/CodeReviewTools)

**功能**: 代码审计工具

**特点**:
- 集成反编译
- 代码审计
- 漏洞检测

## Android逆向

### JADX
**GitHub**: [https://github.com/skylot/jadx](https://github.com/skylot/jadx)

**功能**: APK反编译神器

**特点**:
- DEX转Java源码
- GUI界面
- 搜索功能
- 支持资源查看

**用法**:
```bash
jadx app.apk
jadx -d output classes.dex
```

### APKTool
**链接**: [https://ibotpeaches.github.io/Apktool/](https://ibotpeaches.github.io/Apktool/)

**功能**: APK反编译和重打包

**用法**:
```bash
apktool d app.apk                # 反编译
apktool b app_folder -o new.apk  # 重打包
```

### GDA (GJoy Dex Analyzer)
**链接**: [http://www.gda.wiki:9090/](http://www.gda.wiki:9090/)

**功能**: Android应用分析工具

**特点**:
- 静态分析
- 动态调试
- 中文界面
- 专业级工具

### GameSentry
**GitHub**: [https://github.com/GrowthEase/GameSentry](https://github.com/GrowthEase/GameSentry)

**功能**: Android游戏安全分析

## 代码混淆识别

### 常见混淆器
- **ProGuard**: 最常见
- **DexGuard**: ProGuard商业版
- **Allatori**: 字符串加密
- **Zelix KlassMaster**: 流程混淆

### 识别特征
```java
// ProGuard混淆
class a {
    void a() { }
}

// 字符串加密
String s = decrypt("\x1a\x2b\x3c");
```

## 解题流程

### Jar文件分析
1. **解压查看**: `unzip app.jar`
2. **反编译**: 使用CFR或Procyon
3. **查找入口**: Main-Class in MANIFEST.MF
4. **分析逻辑**: 跟踪关键函数

### APK分析
1. **基本信息**: `aapt dump badging app.apk`
2. **反编译**: `jadx app.apk`
3. **查看资源**: assets/res目录
4. **Native代码**: 提取.so文件分析

### Class文件分析
1. **反编译**: `java -jar cfr.jar MyClass.class`
2. **字节码**: `javap -c MyClass.class`
3. **动态调试**: 使用jdb或IDE调试

## 常见题型

### 字符串加密
```java
// 常见Base64
String flag = new String(Base64.decode("..."));

// 自定义加密
char[] encrypted = {...};
for(int i=0; i<encrypted.length; i++) {
    encrypted[i] ^= key[i % key.length];
}
```

### 算法逆向
1. 理解加密算法
2. 逆向推导或爆破
3. Python重写验证

### 反调试
```java
// 检测调试器
if (ManagementFactory.getRuntimeMXBean()
    .getInputArguments().toString().indexOf("jdwp") >= 0) {
    System.exit(0);
}
```

## CTF解题技巧

!!! tip "快速分析"
    1. 使用JADX查看整体结构
    2. 搜索"flag"、"password"等关键字
    3. 找到加密解密函数
    4. 提取算法用Python重写

!!! tip "处理混淆"
    1. 重命名有意义的变量
    2. 理解控制流
    3. 动态调试观察
    4. 不要被混淆吓倒

!!! warning "注意事项"
    - 检查是否有native代码(.so文件)
    - 注意资源文件中的隐藏信息
    - 某些混淆难以静态分析
    - 可以修改代码后重新运行
