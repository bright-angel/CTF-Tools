# 编程语言在线运行工具

各种编程语言的在线编译运行环境。

## 在线工具

### 多语言平台

| 工具名称 | 链接 | 支持语言 |
|---------|------|---------|
| OnlineGDB | [https://www.onlinegdb.com/](https://www.onlinegdb.com/) | C/C++/Python/Java等20+ |
| Repl.it | [https://replit.com/](https://replit.com/) | 50+种语言 |
| JDoodle | [https://www.jdoodle.com/](https://www.jdoodle.com/) | 多语言IDE |
| Ideone | [https://ideone.com/](https://ideone.com/) | 60+种语言 |
| Programiz | [https://www.programiz.com/](https://www.programiz.com/) | Python/C/C++/Java |

### Python

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Online Python | [https://www.online-python.com/](https://www.online-python.com/) | 简洁快速 |
| Python Tutor | [https://pythontutor.com/](https://pythontutor.com/) | 可视化调试 |
| Google Colab | [https://colab.research.google.com/](https://colab.research.google.com/) | Jupyter Notebook |

### JavaScript

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| JSFiddle | [https://jsfiddle.net/](https://jsfiddle.net/) | HTML/CSS/JS |
| CodePen | [https://codepen.io/](https://codepen.io/) | 前端开发 |
| JS Bin | [https://jsbin.com/](https://jsbin.com/) | 实时预览 |

### C/C++

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Compiler Explorer | [https://godbolt.org/](https://godbolt.org/) | 查看汇编代码 |
| OnlineGDB C++ | [https://www.onlinegdb.com/online_c++_compiler](https://www.onlinegdb.com/online_c++_compiler) | GDB调试 |

### Java

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Online Java Compiler | [https://www.programiz.com/java-programming/online-compiler/](https://www.programiz.com/java-programming/online-compiler/) | 简单易用 |
| JDoodle Java | [https://www.jdoodle.com/online-java-compiler/](https://www.jdoodle.com/online-java-compiler/) | 支持多版本 |

### Shell/Bash

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| JSLinux | [https://bellard.org/jslinux/](https://bellard.org/jslinux/) | 浏览器中的Linux |
| OnlineGDB Bash | [https://www.onlinegdb.com/online_bash_shell](https://www.onlinegdb.com/online_bash_shell) | Bash终端 |

### SQL

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| SQLite Online | [https://sqliteonline.com/](https://sqliteonline.com/) | SQLite数据库 |
| SQL Fiddle | [http://sqlfiddle.com/](http://sqlfiddle.com/) | 多数据库支持 |
| DB Fiddle | [https://www.db-fiddle.com/](https://www.db-fiddle.com/) | MySQL/PostgreSQL |

### PHP

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| PHPFiddle | [http://phpfiddle.org/](http://phpfiddle.org/) | PHP在线运行 |
| 3v4l.php | [https://3v4l.org/](https://3v4l.org/) | 多版本PHP |
| Online PHP | [https://onlinephp.io/](https://onlinephp.io/) | 简洁界面 |

### Ruby

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| TryRuby | [https://try.ruby-lang.org/](https://try.ruby-lang.org/) | Ruby教程 |
| Repl.it Ruby | [https://replit.com/languages/ruby](https://replit.com/languages/ruby) | 完整环境 |

### Go

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Go Playground | [https://go.dev/play/](https://go.dev/play/) | 官方工具 |
| Repl.it Go | [https://replit.com/languages/go](https://replit.com/languages/go) | 在线IDE |

### Rust

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| Rust Playground | [https://play.rust-lang.org/](https://play.rust-lang.org/) | 官方工具 |

### 其他语言

| 语言 | 在线工具链接 |
|------|------------|
| Perl | [https://www.tutorialspoint.com/execute_perl_online.php](https://www.tutorialspoint.com/execute_perl_online.php) |
| Lua | [https://www.lua.org/cgi-bin/demo](https://www.lua.org/cgi-bin/demo) |
| Swift | [https://online.swiftplayground.run/](https://online.swiftplayground.run/) |
| Kotlin | [https://play.kotlinlang.org/](https://play.kotlinlang.org/) |
| Scala | [https://scastie.scala-lang.org/](https://scastie.scala-lang.org/) |
| Haskell | [https://www.tutorialspoint.com/compile_haskell_online.php](https://www.tutorialspoint.com/compile_haskell_online.php) |

## CTF应用场景

!!! tip "在线运行工具在CTF中的作用"
    ```
    1. 快速测试代码
       - 不需要本地环境
       - 快速验证想法
    
    2. 调试脚本
       - 逐步执行
       - 查看变量值
    
    3. 代码混淆/反混淆
       - JavaScript混淆代码
       - 在线运行查看结果
    
    4. 逆向工程辅助
       - 测试算法逻辑
       - 重写代码验证
    
    5. 多版本测试
       - PHP不同版本行为
       - Python 2 vs 3
    ```

!!! tip "常见使用场景"
    ```
    场景1: JavaScript混淆代码
    - 复制到JSFiddle
    - 添加console.log()
    - 运行查看输出
    
    场景2: Python算法还原
    - 理解逻辑后用Python重写
    - Online Python测试
    - 生成flag
    
    场景3: SQL注入测试
    - SQLite Online
    - 测试SQL语句
    - 验证注入payload
    
    场景4: 编译型语言逆向
    - Compiler Explorer
    - 查看汇编代码
    - 理解程序逻辑
    ```

!!! tip "实用技巧"
    ```python
    # Python在线调试技巧
    
    # 1. 打印中间结果
    def decode(data):
        step1 = base64.b64decode(data)
        print(f"Step 1: {step1}")  # 查看中间结果
        
        step2 = step1.decode()
        print(f"Step 2: {step2}")
        
        return step2
    
    # 2. 使用try-except捕获错误
    try:
        result = decode(data)
    except Exception as e:
        print(f"Error: {e}")
    
    # 3. 分步执行
    # 不要一次写完所有代码
    # 逐步测试每个部分
    ```

!!! tip "工具选择"
    ```
    简单脚本: Online Python/JSFiddle
    - 快速测试
    - 无需注册
    
    复杂项目: Repl.it
    - 保存项目
    - 多文件支持
    - 协作功能
    
    可视化调试: Python Tutor
    - 查看变量变化
    - 理解程序流程
    
    汇编分析: Compiler Explorer
    - C/C++代码
    - 查看优化后的汇编
    ```

!!! warning "注意事项"
    ```
    1. 隐私问题
       - 不要提交敏感信息
       - flag/密码等
    
    2. 代码限制
       - 执行时间限制
       - 内存限制
       - 网络访问限制
    
    3. 版本差异
       - Python 2 vs 3
       - 不同编译器行为
    
    4. 在线工具稳定性
       - 可能有downtime
       - 保存重要代码到本地
    ```

## 离线替代方案

### 快速本地环境

**Python**:
```bash
# 直接运行
python script.py

# 交互模式
python
>>> import base64
>>> base64.b64decode('...')
```

**JavaScript (Node.js)**:
```bash
# 安装Node.js后
node script.js

# 交互模式
node
> console.log('Hello')
```

**在线IDE本地部署**:
```bash
# VS Code (免费)
# JetBrains IDEs (学生免费)
# Sublime Text
# Vim/Emacs
```

### Docker快速环境

```bash
# Python
docker run -it python:3.9

# Node.js
docker run -it node:16

# Go
docker run -it golang:1.19

# 编译C代码
docker run -v $PWD:/src -w /src gcc gcc -o output main.c
```

## 相关资源

- **OnlineGDB**: 支持最多语言的在线IDE
- **Repl.it**: 功能最全面的在线开发平台
- **Python Tutor**: Python可视化学习工具
- **Compiler Explorer**: 查看编译器生成的汇编代码
- **JSFiddle**: 前端开发首选在线工具
