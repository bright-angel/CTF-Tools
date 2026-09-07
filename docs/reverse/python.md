# Python逆向工具

Python程序的反编译和分析工具。

## 在线工具

### 在线Pyc反编译

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| C5R Pyc | [https://c5r.app/tools/pyc-decompiler](https://c5r.app/tools/pyc-decompiler) | 在线pyc反编译 |
| CTFever Pyc | [https://ctfever.uniiem.com/tools/pyc-decompiler](https://ctfever.uniiem.com/tools/pyc-decompiler) | 在线pyc反编译 |

## 离线工具

### Pyc反编译

#### uncompyle6

**下载链接**:
```
pip install uncompyle6
```

**基本使用**:
```bash
# 反编译单个文件
uncompyle6 file.pyc

# 输出到文件
uncompyle6 file.pyc > output.py
uncompyle6 -o output.py file.pyc

# 批量反编译
uncompyle6 -o output_dir/ *.pyc

# 指定Python版本
uncompyle6 --py 3.8 file.pyc
```

**支持版本**: Python 2.7, 3.0-3.8

#### pycdc

**下载链接**:
```
https://github.com/zrax/pycdc
```

**编译**:
```bash
git clone https://github.com/zrax/pycdc
cd pycdc
cmake .
make

# 使用
./pycdc file.pyc        # 反编译
./pycdas file.pyc       # 反汇编
```

**支持版本**: Python 1.5-3.11+

#### decompyle3

**下载链接**:
```
pip install decompyle3
```

**使用**:
```bash
decompyle3 file.pyc
decompyle3 -o output.py file.pyc
```

**支持版本**: Python 3.7-3.8

#### pydumpck

**下载链接**:
```
https://github.com/serfend/pydumpck
```

**安装使用**:
```bash
pip install pydumpck

# 自动识别版本反编译
pydumpck file.pyc

# 批量反编译
pydumpck dir/
```

**特点**: 
- 支持Python 2.x-3.10+
- 自动识别版本
- 批量处理

### PyInstaller提取

#### pyinstxtractor

**下载链接**:
```
https://github.com/extremecoders-re/pyinstxtractor
```

**使用**:
```bash
python pyinstxtractor.py program.exe

# 提取后
# 1. 找到主pyc文件（通常与exe同名）
# 2. 补充文件头（magic number + 时间戳，共16字节）
# 3. 用uncompyle6反编译
```

**pyinstxtractor-ng** (增强版):
```
https://github.com/pyinstxtractor/pyinstxtractor-ng
```

#### PyInstaller文件头修复

**方法1: 从其他pyc复制**:
```bash
# 从提取的其他完整pyc文件复制前16字节
dd if=complete.pyc of=header.bin bs=1 count=16
cat header.bin main.pyc > fixed.pyc
```

**方法2: 手动添加**:
```python
import struct
import time

# Python 3.8的magic number
magic = b'\x55\x0d\r\n'
timestamp = struct.pack('I', int(time.time()))
size = struct.pack('I', 0)

with open('main.pyc_extracted', 'rb') as f:
    code = f.read()

with open('main.pyc', 'wb') as f:
    f.write(magic + timestamp + size + code)
```

### Py2exe提取

#### unpy2exe

**下载链接**:
```
https://github.com/matiasb/unpy2exe
```

**使用**:
```bash
python unpy2exe.py program.exe
```

#### python-exe-unpacker

**下载链接**:
```
https://github.com/countercept/python-exe-unpacker
```

**使用**:
```bash
python pyinstxtractor.py program.exe
```

### GUI工具

#### Easy Python Decompiler

**下载链接**:
```
https://sourceforge.net/projects/easypythondecompiler/
```

**特点**:
- Windows图形界面
- 支持pyc/pyo/exe
- 简单易用

### Python字节码隐写

#### Stegosaurus

**下载链接**:
```
https://github.com/AngelKitty/stegosaurus
```

**功能**: 在pyc字节码中隐藏数据

**使用**:
```bash
# 隐藏数据
python stegosaurus.py -p file.pyc -s "secret data"

# 提取数据
python stegosaurus.py -x file.pyc
```

## Python版本识别

### Magic Number对照表

| Magic Number | Python版本 | 十六进制 |
|--------------|-----------|----------|
| 3413 | Python 2.7 | 03F3 0D0A |
| 3351 | Python 3.5 | 170D 0D0A |
| 3379 | Python 3.6 | 330D 0D0A |
| 3393 | Python 3.7 | 420D 0D0A |
| 3413 | Python 3.8 | 550D 0D0A |
| 3425 | Python 3.9 | 610D 0D0A |
| 3439 | Python 3.10 | 6F0D 0D0A |
| 3495 | Python 3.11 | A70D 0D0A |

### 查看Magic Number

```bash
# Linux/Mac
xxd file.pyc | head -1

# Python
python -c "import struct; print(hex(struct.unpack('H', open('file.pyc','rb').read(2))[0]))"
```

## CTF解题技巧

!!! tip "快速识别"
    ```bash
    # 查看文件类型
    file unknown.bin
    
    # 搜索Python特征
    strings unknown.exe | grep -i python
    strings unknown.exe | grep -i "pyinstaller"
    
    # 使用binwalk
    binwalk unknown.exe
    ```

!!! tip "PyInstaller提取流程"
    ```
    1. 提取文件
       python pyinstxtractor.py program.exe
    
    2. 找主文件
       通常是与exe同名的pyc（无.pyc扩展名）
    
    3. 修复文件头
       - 从其他pyc复制前16字节
       - 或根据Python版本手动添加
    
    4. 反编译
       uncompyle6 fixed.pyc
    
    5. 如果失败
       - 尝试pycdc
       - 尝试decompyle3
       - 手动阅读字节码
    ```

!!! tip "版本不匹配处理"
    ```
    错误: "Unknown magic number"
    
    解决:
    1. 识别Python版本（magic number）
    2. 使用对应版本的反编译器
    3. Python 3.9+用pycdc或pydumpck
    4. 尝试多个工具
    ```

!!! tip "混淆代码处理"
    ```python
    # 常见混淆
    
    # 1. 变量名混淆
    # 无法自动恢复，手动分析
    
    # 2. 字符串编码
    s = base64.b64decode('...')
    s = ''.join(chr(x^key) for x in data)
    
    # 3. 动态exec
    exec(compile(...))
    exec(__import__('base64').b64decode('...'))
    
    # 处理方法：
    # - 动态运行观察
    # - Hook exec/eval
    # - 打印中间结果
    ```

!!! tip "动态分析"
    ```python
    # 使用pdb调试
    python -m pdb script.pyc
    
    # 或插入断点
    import pdb; pdb.set_trace()
    
    # Hook内置函数
    import builtins
    _exec = builtins.exec
    def my_exec(code):
        print("Executing:", code)
        return _exec(code)
    builtins.exec = my_exec
    ```

!!! tip "字节码分析"
    ```python
    # 如果反编译失败，手动查看字节码
    import dis
    import marshal
    
    # 读取pyc
    with open('file.pyc', 'rb') as f:
        f.read(16)  # 跳过header
        code = marshal.load(f)
    
    # 反汇编
    dis.dis(code)
    
    # 查看常量
    print(code.co_consts)
    
    # 查看变量名
    print(code.co_names)
    ```

!!! warning "常见问题"
    ```
    1. 反编译失败
       - 检查Python版本匹配
       - 尝试不同工具
       - 查看字节码
    
    2. 文件头损坏
       - 从同版本获取正确header
       - 使用pyinstxtractor提取的完整pyc
    
    3. PyArmor加密
       - 商业加密，难以直接破解
       - 尝试内存dump
       - 动态分析
    
    4. 代码混淆严重
       - 动态调试更有效
       - Hook关键函数
       - 打印中间结果
    ```

!!! tip "工具选择"
    ```
    Python 2.x-3.8: uncompyle6 (首选)
    Python 3.9+: pycdc / pydumpck
    PyInstaller: pyinstxtractor + uncompyle6
    Py2exe: unpy2exe
    批量处理: pydumpck
    GUI工具: Easy Python Decompiler (Windows)
    ```

## 相关资源

- **uncompyle6**: Python 2-3.8反编译标准工具
- **pycdc**: 支持最新Python版本
- **pyinstxtractor**: PyInstaller提取工具
- **pydumpck**: 自动识别版本批量反编译
