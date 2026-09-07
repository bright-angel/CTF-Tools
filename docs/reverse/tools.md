# 逆向辅助工具

IDA插件、查壳工具和其他逆向辅助工具。

## 在线工具

### 查壳识别

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| PPEE | 在线PE分析 | PE文件结构分析 |

## 离线工具

### 查壳工具

#### DIE (Detect It Easy)

**下载链接**:
```
https://github.com/horsicq/DIE-engine/releases
```

**功能**: 文件类型和壳检测

**特点**:
- 识别编译器
- 检测加壳类型
- 签名匹配
- 支持PE/ELF/Mach-O
- 图形界面和命令行

**使用**:
```bash
# GUI: 直接拖入文件分析

# 命令行
diec file.exe
diec -d file.exe  # 详细信息
```

**识别内容**:
- 编译器（MSVC/GCC/MinGW等）
- 链接器
- 加壳软件（UPX/ASPack/Themida等）
- .NET信息
- 资源信息

#### PEiD

**功能**: 经典Windows PE查壳工具

**特点**: 
- 大量签名库
- 插件支持
- 仅32位

### 脱壳工具

#### UPX

**下载链接**:
```
https://github.com/upx/upx/releases
```

**使用**:
```bash
# 查看是否UPX加壳
upx -t file.exe

# 脱壳
upx -d file.exe

# 加壳
upx file.exe
upx --best file.exe  # 最佳压缩
upx --ultra-brute file.exe  # 极限压缩
```

**修改UPX特征**:
```bash
# 修改UPX头部特征以绕过检测
# 使用十六进制编辑器修改"UPX!"签名
```

#### UPX Patcher

**下载链接**:
```
https://github.com/DosX-dev/UPX-Patcher
```

**功能**: 修改UPX壳特征，绕过检测

### IDA插件

#### IDA语言辅助插件

**Rust逆向插件**:
```
https://github.com/cha512/rust-reversing-helper
```

**功能**:
- 识别Rust函数签名
- 恢复符号名称
- 类型推断

**Golang插件**:

| 插件名称 | 链接 | 功能 |
|---------|------|------|
| golang_loader_assist | [GitHub](https://github.com/strazzere/golang_loader_assist) | Go程序加载辅助 |
| IDAGolangHelper | [GitHub](https://github.com/sibears/IDAGolangHelper) | Go函数识别、字符串恢复 |

**使用**:
```python
# IDAGolangHelper
# 安装到IDA plugins目录
# 自动识别Go函数和字符串
```

#### 其他实用插件

**IdaClu** (聚类分析):
```
https://github.com/harlamism/IdaClu
```

**Keypatch** (补丁/汇编):
```
https://github.com/keystone-engine/keypatch
```

**功能**: 在IDA中直接修改汇编代码

**LazyIDA**:
```
https://github.com/L4ys/LazyIDA
```

**功能**: IDA快捷脚本集合

### IDA脚本

#### 常用脚本功能

**批量重命名**:
```python
import idaapi
import idc

# 批量重命名函数
for func_ea in Functions():
    func_name = idc.get_func_name(func_ea)
    if func_name.startswith("sub_"):
        # 根据特征重命名
        new_name = "func_" + hex(func_ea)[2:]
        idc.set_name(func_ea, new_name)
```

**字符串提取**:
```python
import idautils

# 提取所有字符串
for s in idautils.Strings():
    print(f"{hex(s.ea)}: {str(s)}")
```

**查找特定指令**:
```python
import idc
import idautils

# 查找所有call指令
ea = idc.get_inf_attr(idc.INF_MIN_EA)
end_ea = idc.get_inf_attr(idc.INF_MAX_EA)

while ea < end_ea:
    if idc.print_insn_mnem(ea) == "call":
        print(f"Call at: {hex(ea)}")
    ea = idc.next_head(ea)
```

**交叉引用分析**:
```python
import idautils

# 查找函数的所有调用者
func_ea = idc.get_name_ea_simple("target_function")
for xref in idautils.XrefsTo(func_ea):
    print(f"Called from: {hex(xref.frm)}")
```

### 符号恢复工具

#### FLIRT签名

**功能**: IDA的函数库识别技术

**使用**:
```bash
# 生成签名
pcf file.lib
sigmake file.pat file.sig

# 应用签名（IDA中）
# File -> Load File -> FLIRT Signature file
```

#### Rizzo

**下载链接**:
```
https://github.com/devttys0/ida/tree/master/plugins/rizzo
```

**功能**: 基于特征的函数识别

### 反混淆工具

#### de4dot (.NET反混淆)

**下载链接**:
```
https://github.com/de4dot/de4dot
```

**使用**:
```bash
# 自动检测并反混淆
de4dot file.exe

# 指定混淆器类型
de4dot -p un file.exe  # ConfuserEx
de4dot -p go file.exe  # Goliath
```

**支持的混淆器**:
- ConfuserEx
- Dotfuscator
- Eazfuscator.NET
- Goliath.NET
- 等

#### Simplify (Android反混淆)

**下载链接**:
```
https://github.com/CalebFenton/simplify
```

**功能**: 去除Android应用中的混淆

### 代码分析框架

#### angr

**下载链接**:
```
pip install angr
```

**功能**: 符号执行框架

**示例**:
```python
import angr

# 加载二进制
proj = angr.Project('program')

# 符号执行
state = proj.factory.entry_state()
simgr = proj.factory.simulation_manager(state)

# 探索到目标地址
simgr.explore(find=0x400000)

# 获取结果
if simgr.found:
    found_state = simgr.found[0]
    print(found_state.posix.dumps(0))  # stdin
```

#### radare2

**下载链接**:
```
https://github.com/radareorg/radare2
```

**安装**:
```bash
git clone https://github.com/radareorg/radare2
cd radare2
sys/install.sh
```

**基本使用**:
```bash
# 分析二进制
r2 program
aaa  # 分析全部
pdf @ main  # 反汇编main函数
VV  # 图形模式

# 查找字符串
iz
izz  # 包括数据段

# 交叉引用
axt @ sym.main
```

#### Binary Ninja

**下载链接**:
```
https://binary.ninja/
```

**特点**: 商业逆向平台，API友好

### 调试增强

#### GDB插件对比

| 插件 | 特点 | 适用场景 |
|------|------|----------|
| PEDA | 彩色输出、模式生成 | 通用逆向、Pwn |
| GEF | 多架构、堆分析 | ARM/MIPS/综合 |
| Pwndbg | 堆查看、ROP | 漏洞利用 |

**安装**:
```bash
# PEDA
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

# GEF
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# Pwndbg
git clone https://github.com/pwndbg/pwndbg
cd pwndbg && ./setup.sh
```

## 常见壳类型

### 压缩壳

| 壳名称 | 特点 | 脱壳方法 |
|--------|------|----------|
| UPX | 最常见 | upx -d |
| ASPack | 商业壳 | 手动OEP |
| PECompact | 压缩壳 | 工具脱壳 |

### 加密壳

| 壳名称 | 难度 | 特点 |
|--------|------|------|
| Themida | 极高 | 虚拟化保护 |
| VMProtect | 极高 | 虚拟机保护 |
| Code Virtualizer | 高 | 代码虚拟化 |
| Enigma Protector | 高 | 反调试强 |

### 脱壳通用方法

```
1. ESP定律
   - 在入口点设断点
   - 找到pushad指令
   - 在ESP寄存器设硬件断点
   - 运行到popad附近
   - 找到真实OEP

2. 内存镜像法
   - 让程序运行起来
   - dump内存镜像
   - 修复IAT
   - 重建PE

3. 单步跟踪法
   - 跟踪壳的执行流程
   - 识别解密循环
   - 定位OEP
```

## CTF解题技巧

!!! tip "加壳程序处理"
    ```
    1. 识别壳类型
       - 使用DIE/PEiD查壳
       - 观察文件特征
    
    2. 脱壳
       - UPX: upx -d直接脱
       - 其他: 手动找OEP脱壳
       - 无法脱壳: 直接动态调试
    
    3. 分析
       - 脱壳后IDA分析
       - 必要时结合动态调试
    ```

!!! tip "Go/Rust程序分析"
    ```
    Go程序:
    1. 加载IDAGolangHelper插件
    2. 自动恢复函数名
    3. 注意runtime包函数
    4. 字符串在.rodata段
    
    Rust程序:
    1. 识别标准库函数
    2. 理解所有权系统
    3. 注意LLVM优化
    ```

!!! tip "IDA使用技巧"
    ```
    快捷键:
    F5: 反编译
    X: 交叉引用
    N: 重命名
    Y: 修改函数签名
    G: 跳转到地址
    Shift+F12: 所有字符串
    Ctrl+F: 搜索文本
    
    脚本:
    File -> Script file (Alt+F7)
    File -> Script command (Shift+F2)
    
    插件:
    放到 %IDADIR%/plugins/ 目录
    Edit -> Plugins 查看加载的插件
    ```

!!! tip "符号恢复策略"
    ```
    1. 字符串引用
       - 搜索特征字符串
       - 追踪到使用的函数
       - 根据字符串推测功能
    
    2. 导入表分析
       - 查看调用的API
       - 推测函数用途
    
    3. 交叉引用
       - 分析调用关系
       - 找到关键函数
    
    4. 模式匹配
       - FLIRT识别标准库
       - Rizzo匹配已知函数
    
    5. 控制流分析
       - 观察函数结构
       - 识别常见模式
    ```

!!! warning "混淆识别"
    ```
    常见混淆特征:
    - 函数名变成a/b/c/d
    - 大量无意义跳转
    - 字符串加密
    - 控制流平坦化
    - 虚假代码块
    - 间接跳转
    
    应对策略:
    - 使用反混淆工具（de4dot等）
    - 动态调试观察实际行为
    - 编写脚本批量处理
    - 符号执行工具（angr）
    ```

!!! tip "工具组合推荐"
    ```
    静态分析:
    IDA Pro/Ghidra + 语言插件 + 自定义脚本
    
    动态分析:
    GDB/x64dbg + 增强插件 + Frida
    
    符号恢复:
    FLIRT签名 + Rizzo + 手动分析
    
    反混淆:
    de4dot (.NET) + Simplify (Android) + 自定义脚本
    
    自动化:
    angr (符号执行) + radare2 (脚本) + Binary Ninja (API)
    ```

## 相关资源

- **DIE**: 最好用的查壳工具，支持多平台
- **IDA插件**: 针对特定语言的插件可大幅提升效率
- **angr**: Python符号执行框架，适合自动化分析
- **radare2**: 开源逆向框架，命令行强大
- **de4dot**: .NET反混淆首选工具
- **GDB增强插件**: PEDA/GEF/Pwndbg各有特色
