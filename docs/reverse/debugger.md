# 调试工具

在线和离线的调试分析工具。

## 在线工具

### 在线调试平台

| 工具名称 | 链接 | 支持语言 |
|---------|------|----------|
| OnlineGDB | [https://www.onlinegdb.com/](https://www.onlinegdb.com/) | C/C++/Python/Java等 |
| Compiler Explorer | [https://godbolt.org/](https://godbolt.org/) | 多语言汇编查看 |
| Replit | [https://replit.com/](https://replit.com/) | 多语言在线IDE |

### 在线反汇编

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| ODA | [https://onlinedisassembler.com/](https://onlinedisassembler.com/) | 在线反汇编x86/ARM/MIPS |
| Dogbolt | [https://dogbolt.org/](https://dogbolt.org/) | 多反编译器对比平台 |

**Compiler Explorer (Godbolt)特点**:
- 查看编译器生成的汇编代码
- 多编译器对比
- 优化级别选择
- 支持C/C++/Rust/Go等

**Dogbolt特点**:
- 同时使用多个反编译器（Ghidra/IDA/Binary Ninja等）
- 结果对比
- 完全免费

## 离线工具

### Linux调试器

#### GDB

**基本命令**:
```bash
# 启动调试
gdb ./program
gdb -q ./program  # 安静模式

# 运行
run [args]
start  # 在main处停止

# 断点
break main
break *0x400000
break file.c:10
delete 1  # 删除断点1
info breakpoints

# 执行控制
continue (c)  # 继续
step (s)      # 单步进入
next (n)      # 单步跳过
finish        # 运行到函数返回
until         # 运行到指定行

# 查看
info registers (i r)
info functions
info variables
disassemble main
disas $pc

# 内存查看
x/10x $esp     # 十六进制查看10个
x/10i $pc      # 反汇编10条指令
x/s 0x400000   # 字符串
x/10gx $rsp    # 64位

# 变量
print var
print $eax
print/x $eax   # 十六进制
set $eax = 0

# 栈帧
backtrace (bt)
frame 0
info frame

# 调试信息
info source
info functions
list
```

#### GDB增强插件

**PEDA**:
```bash
# 安装
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

# 常用命令
checksec     # 安全检查
vmmap        # 内存映射
find         # 搜索内存
pattern_create 100  # 生成模式
pattern_offset 0x41414141  # 计算偏移
```

**GEF**:
```bash
# 安装
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# 常用命令
checksec
vmmap
search-pattern
heap chunks
rop
```

**Pwndbg**:
```bash
# 安装
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# 常用命令
checksec
vmmap
search
heap
cyclic 100
```

### Windows调试器

#### x64dbg

**下载链接**:
```
https://x64dbg.com/
```

**常用快捷键**:
```
F2: 设置断点
F7: 单步进入
F8: 单步跳过
F9: 运行
Ctrl+G: 跳转到地址
Ctrl+F: 搜索
Ctrl+B: 二进制搜索
```

**常用功能**:
- 断点：硬件断点、内存断点
- 脚本：支持自动化脚本
- 插件：丰富的插件生态
- 内存映射：查看进程内存

#### WinDbg

**下载链接**:
```
https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/
```

**常用命令**:
```
# 断点
bp main
bl  # 列出断点
bc 1  # 清除断点

# 执行
g  # 运行
p  # 单步跳过
t  # 单步进入

# 查看
r  # 寄存器
d  # 内存
u  # 反汇编
k  # 调用栈

# 模块
lm  # 列出模块
x *!*  # 列出符号
```

#### OllyDbg

**下载链接**:
```
http://www.ollydbg.de/
```

**特点**: 经典32位调试器，插件丰富

### 动态分析工具

#### ltrace

**功能**: 跟踪库函数调用

**使用**:
```bash
# 基本跟踪
ltrace ./program

# 统计
ltrace -c ./program

# 过滤函数
ltrace -e strcmp,strcpy ./program

# 跟踪子进程
ltrace -f ./program
```

#### strace

**功能**: 跟踪系统调用

**使用**:
```bash
# 基本跟踪
strace ./program

# 统计
strace -c ./program

# 过滤系统调用
strace -e open,read,write ./program
strace -e trace=file ./program  # 文件操作
strace -e trace=network ./program  # 网络操作

# 跟踪已运行进程
strace -p <pid>

# 保存到文件
strace -o output.txt ./program
```

#### Process Monitor (Procmon)

**下载链接**:
```
https://docs.microsoft.com/en-us/sysinternals/downloads/procmon
```

**功能**: Windows进程监控

**监控内容**:
- 文件系统活动
- 注册表操作
- 进程/线程活动
- 网络活动

**使用技巧**:
```
1. 设置过滤器（进程名、操作类型）
2. 捕获活动
3. 分析结果
4. 导出日志
```

### Frida动态插桩

**下载链接**:
```
https://frida.re/
```

**安装**:
```bash
pip install frida-tools
```

**基本使用**:
```bash
# 列出进程
frida-ps

# 附加到进程
frida -p <pid>

# 运行脚本
frida -l script.js -f ./program

# 追踪函数
frida-trace -i "strcmp" ./program
frida-trace -i "open*" ./program
```

**Hook示例**:
```javascript
// hook函数
Interceptor.attach(Module.findExportByName(null, 'strcmp'), {
  onEnter: function(args) {
    console.log('strcmp called');
    console.log('arg1:', Memory.readUtf8String(args[0]));
    console.log('arg2:', Memory.readUtf8String(args[1]));
  },
  onLeave: function(retval) {
    console.log('return:', retval);
    // 修改返回值
    retval.replace(0);
  }
});

// Hook类方法（Java）
Java.perform(function() {
  var MainActivity = Java.use('com.example.MainActivity');
  MainActivity.checkPassword.implementation = function(pwd) {
    console.log('Password:', pwd);
    return true;  // 总是返回true
  };
});
```

## 脚本调试

### Python调试

**pdb使用**:
```python
import pdb

# 设置断点
pdb.set_trace()

# 或使用命令行
# python -m pdb script.py
```

**pdb命令**:
```
l      # 列出代码
n      # 下一行
s      # 进入函数
c      # 继续执行
p var  # 打印变量
b 10   # 在第10行设断点
cl     # 清除断点
q      # 退出
```

**ipdb增强**:
```bash
pip install ipdb

# 使用
import ipdb; ipdb.set_trace()
```

### Node.js调试

**Chrome DevTools**:
```bash
node --inspect script.js
# 浏览器打开 chrome://inspect
```

**VS Code调试**: 配置launch.json即可

## CTF解题技巧

!!! tip "调试策略"
    ```
    1. 静态分析
       - IDA/Ghidra查看整体结构
       - 找到main和关键函数
       - 理解大致逻辑
    
    2. 动态调试
       - 关键位置设断点
       - 单步跟踪执行
       - 观察输入输出变化
       - 修改内存/寄存器测试
    
    3. 结合分析
       - 静态理解逻辑
       - 动态验证猜测
       - 提取算法重写
    ```

!!! tip "常见断点位置"
    ```
    - main函数入口
    - strcmp/memcmp等比较函数
    - 加密/解密函数调用前后
    - 关键跳转指令（je/jne）
    - 系统调用（read/write/open）
    - 异常处理
    ```

!!! tip "GDB调试技巧"
    ```bash
    # 跳过库函数
    skip -gfi /usr/*
    
    # 条件断点
    break main if argc > 1
    
    # 命令断点
    break main
    commands
      print $rdi
      continue
    end
    
    # 监视点
    watch variable
    
    # 捕获信号
    catch signal SIGSEGV
    
    # 跟踪fork
    set follow-fork-mode child
    ```

!!! warning "反调试检测"
    ```
    常见反调试技术:
    1. ptrace检测
       - 检测是否被附加
       - 绕过: LD_PRELOAD劫持ptrace
    
    2. 时间检测
       - 检测单步执行耗时
       - 绕过: patch掉时间检查
    
    3. /proc/self/status
       - 检查TracerPid字段
       - 绕过: hook open/read
    
    4. 调试器特征
       - 检测调试器进程
       - 绕过: 改进程名
    
    5. SIGTRAP异常
       - int3断点检测
       - 绕过: 修改信号处理
    ```

!!! tip "Frida实战技巧"
    ```javascript
    // 1. 绕过SSL Pinning
    Java.perform(function() {
      var CertificatePinner = Java.use('okhttp3.CertificatePinner');
      CertificatePinner.check.overload('java.lang.String', 'java.util.List').implementation = function() {
        console.log('SSL Pinning bypassed');
      };
    });
    
    // 2. Hook加密函数
    Interceptor.attach(Module.findExportByName('libcrypto.so', 'AES_encrypt'), {
      onEnter: function(args) {
        console.log('AES key:', hexdump(args[1]));
        console.log('Plaintext:', hexdump(args[0]));
      }
    });
    
    // 3. 修改返回值
    var check = Module.findExportByName(null, 'checkLicense');
    Interceptor.replace(check, new NativeCallback(function() {
      return 1;  // 总是返回成功
    }, 'int', []));
    ```

!!! tip "动态分析优势"
    ```
    - 绕过复杂控制流混淆
    - 观察运行时数据
    - 理解加密后的代码
    - 提取解密后的数据
    - 验证静态分析结果
    - 快速定位关键代码
    ```

!!! tip "工具选择"
    ```
    Linux调试:
    - 简单程序: GDB
    - Pwn题: GDB + PEDA/Pwndbg
    - 追踪调用: ltrace/strace
    - 动态hook: Frida
    
    Windows调试:
    - 逆向工程: x64dbg
    - 内核调试: WinDbg
    - 经典32位: OllyDbg
    - 进程监控: Process Monitor
    
    移动端:
    - Android: Frida
    - iOS: Frida/lldb
    ```

## 相关资源

- **GDB**: Linux标准调试器，配合PEDA/GEF/Pwndbg更强大
- **x64dbg**: Windows开源调试器，现代化界面
- **Frida**: 跨平台动态插桩框架，功能强大
- **ltrace/strace**: 函数和系统调用跟踪
- **Procmon**: Windows进程监控神器
