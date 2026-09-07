# 在线调试工具

在线或远程调试相关的工具。

## 在线IDE和调试器

### Compiler Explorer (Godbolt)
**链接**: [https://godbolt.org/](https://godbolt.org/)

**功能**: 在线编译器和汇编查看器

**支持语言**:
- C/C++
- Rust
- Go
- Python
- 等等

**特点**:
- 查看编译结果
- 汇编代码对照
- 多编译器对比
- 优化级别选择

### OnlineGDB
**链接**: [https://www.onlinegdb.com/](https://www.onlinegdb.com/)

**功能**: 在线调试器

**支持语言**:
- C/C++
- Python
- Java
- 等多种语言

**特点**:
- 断点调试
- 变量查看
- 单步执行
- 完全免费

### Replit
**链接**: [https://replit.com/](https://replit.com/)

**功能**: 在线IDE和协作平台

**特点**:
- 多语言支持
- 实时协作
- 版本控制
- 简单部署

## 反汇编工具

### ODA (Online Disassembler)
**链接**: [https://onlinedisassembler.com/](https://onlinedisassembler.com/)

**功能**: 在线反汇编器

**支持架构**:
- x86/x64
- ARM
- MIPS
- PowerPC

**特点**:
- 无需安装
- 快速分析
- 交互式查看

### Dogbolt
**链接**: [https://dogbolt.org/](https://dogbolt.org/)

**功能**: 多反编译器对比平台

**特点**:
- 同时使用多个反编译器
- 结果对比
- 支持多种架构
- 完全免费

## x86/x64调试

### 调试命令速查

#### GDB常用命令
```bash
# 运行
run [args]
start

# 断点
break main
break *0x400000
delete 1

# 查看
info registers
info breakpoints
disassemble main

# 执行
continue
step (单步进入)
next (单步跳过)
finish (运行到返回)

# 查看内存
x/10x $esp
x/s 0x400000

# 查看变量
print var
print $eax
```

#### PEDA/GEF/Pwndbg
**增强GDB的插件**

**PEDA**: [https://github.com/longld/peda](https://github.com/longld/peda)

**GEF**: [https://github.com/hugsy/gef](https://github.com/hugsy/gef)

**Pwndbg**: [https://github.com/pwndbg/pwndbg](https://github.com/pwndbg/pwndbg)

**特点**:
- 彩色输出
- 更好的寄存器显示
- 自动反汇编
- 安全检查识别

## Windows调试

### x64dbg
**链接**: [https://x64dbg.com/](https://x64dbg.com/)

**功能**: Windows调试器

**特点**:
- 开源免费
- x64和x32支持
- 现代化界面
- 插件支持

### WinDbg
**链接**: [Microsoft官方](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/)

**功能**: Windows官方调试器

**特点**:
- 强大的命令系统
- 内核调试支持
- 崩溃转储分析

### OllyDbg
**链接**: [http://www.ollydbg.de/](http://www.ollydbg.de/)

**功能**: 经典Windows调试器

**特点**:
- 32位程序调试
- 社区插件丰富
- 逆向工程常用

## 动态分析

### ltrace
**功能**: Linux库函数调用跟踪

**用法**:
```bash
ltrace ./program
ltrace -c ./program  # 统计调用次数
```

### strace
**功能**: 系统调用跟踪

**用法**:
```bash
strace ./program
strace -e open,read,write ./program
```

### Process Monitor (Procmon)
**链接**: [Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon)

**功能**: Windows进程监控

**特点**:
- 文件系统活动
- 注册表活动
- 进程/线程活动
- 网络活动

### Frida
**链接**: [https://frida.re/](https://frida.re/)

**功能**: 动态插桩框架

**特点**:
- 跨平台(Windows/Linux/macOS/iOS/Android)
- JavaScript编写hook
- 运行时修改
- 强大的API

**示例**:
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
  }
});
```

## 脚本调试

### Python Debugger (pdb)
**用法**:
```python
import pdb
pdb.set_trace()  # 设置断点

# 或者
python -m pdb script.py
```

**常用命令**:
```
l      # 列出代码
n      # 下一行
s      # 进入函数
c      # 继续执行
p var  # 打印变量
```

### Node.js调试
**Chrome DevTools**:
```bash
node --inspect script.js
```

然后在Chrome中打开 `chrome://inspect`

## CTF解题技巧

!!! tip "调试策略"
    1. 静态分析了解大致逻辑
    2. 动态调试验证猜测
    3. 关键点下断点
    4. 观察输入输出变化
    5. 修改内存/寄存器测试

!!! tip "常见断点位置"
    - main函数入口
    - 字符串比较函数(strcmp, memcmp)
    - 加密函数调用前后
    - 关键跳转指令
    - 系统调用

!!! warning "反调试检测"
    - ptrace检测
    - 时间检测
    - 异常处理
    - 调试器特征检测
    - 需要绕过或patch

!!! tip "动态分析优势"
    - 绕过复杂控制流
    - 观察运行时数据
    - 理解混淆代码
    - 提取解密后数据
    - 验证逆向结果
