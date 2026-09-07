# Python逆向工具

Python程序的反编译和分析工具。

## Pyc反编译

### 在线工具

#### C5R Pyc反编译
**链接**: [https://c5r.app/tools/pyc-decompiler](https://c5r.app/tools/pyc-decompiler)

**功能**: 在线pyc反编译

#### CTFever Pyc反编译
**链接**: [https://ctfever.uniiem.com/tools/pyc-decompiler](https://ctfever.uniiem.com/tools/pyc-decompiler)

**功能**: 在线pyc反编译

### 离线工具

#### Uncompyle6
**GitHub**: [https://github.com/rocky/python-uncompyle6](https://github.com/rocky/python-uncompyle6)

**功能**: Python字节码反编译器

**支持版本**: Python 1.5 - 3.8

**安装**:
```bash
pip install uncompyle6
```

**用法**:
```bash
uncompyle6 file.pyc
uncompyle6 -o output.py file.pyc
```

#### Pydumpck
**GitHub**: [https://github.com/serfend/pydumpck](https://github.com/serfend/pydumpck)

**功能**: 多版本pyc反编译

**特点**:
- 支持Python 2.x - 3.10
- 批量反编译
- 自动识别版本

## PyInstaller打包程序

### PyInstaller Extractor
**GitHub**:
- [extremecoders-re/pyinstxtractor](https://github.com/extremecoders-re/pyinstxtractor)
- [pyinstxtractor/pyinstxtractor-ng](https://github.com/pyinstxtractor/pyinstxtractor-ng)

**功能**: 提取PyInstaller打包的exe

**用法**:
```bash
python pyinstxtractor.py program.exe
```

**提取后**:
1. 找到主pyc文件
2. 使用uncompyle6反编译

### Unpy2exe
**GitHub**: [https://github.com/matiasb/unpy2exe](https://github.com/matiasb/unpy2exe)

**功能**: 提取py2exe打包的程序

## Py2exe反编译

### Easy Python Decompiler
**下载**: [SourceForge](https://sourceforge.net/projects/easypythondecompiler)

**功能**: GUI反编译工具

**特点**:
- 图形界面
- 支持pyc/pyo/exe
- Windows平台

## Python隐写

### Stegosaurus
**GitHub**: [https://github.com/AngelKitty/stegosaurus](https://github.com/AngelKitty/stegosaurus)

**功能**: Python字节码隐写

**原理**: 在pyc文件中隐藏数据

## 解题流程

### PyInstaller程序
1. **识别**: 使用strings查看是否有PyInstaller特征
2. **提取**: pyinstxtractor提取文件
3. **找主文件**: 通常是与exe同名的pyc
4. **补文件头**: 从其他pyc复制前16字节
5. **反编译**: uncompyle6反编译

### 纯pyc文件
1. **检查版本**: 文件头magic number
2. **反编译**: 
   - Python 2.x-3.8: uncompyle6
   - Python 3.9+: pydumpck或decompyle3

### 混淆的Python代码
1. **变量名混淆**: 无法恢复，手动分析
2. **控制流混淆**: 静态分析或动态调试
3. **常量加密**: 动态运行获取

## Magic Number对照

| Magic | Python版本 |
|-------|-----------|
| 03F3 0D0A | Python 2.7 |
| 420D 0D0A | Python 3.6 |
| 550D 0D0A | Python 3.7 |
| 610D 0D0A | Python 3.8 |
| 6F0D 0D0A | Python 3.9 |

## 常见问题

### 反编译失败
1. 检查Python版本是否匹配
2. 尝试不同反编译工具
3. 手动阅读字节码（dis模块）

### 文件头损坏
从同版本Python获取正确的文件头（前16字节）

### 动态调试
```python
# 使用pdb调试
import pdb
pdb.set_trace()

# 或者直接运行观察行为
python suspicious.pyc
```

## CTF解题技巧

!!! tip "快速识别"
    ```bash
    file unknown.bin
    strings unknown.exe | grep -i python
    binwalk unknown.exe
    ```

!!! tip "版本确定"
    - 查看文件头magic number
    - 从错误信息判断
    - 尝试不同版本Python运行

!!! warning "注意事项"
    - 某些py2exe程序需要特定工具
    - 混淆后的代码可读性差
    - 动态调试可能更有效
    - 保留原始文件避免损坏
