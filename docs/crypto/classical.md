# 古典密码工具

古典密码是密码学的基础，在CTF中经常出现。

## 综合工具站点

### Hi编码
**链接**: [http://www.hiencode.com/](http://www.hiencode.com/)

**功能**: 综合古典密码工具站

**包含**:
- 凯撒密码
- 维吉尼亚密码
- 栅栏密码
- 摩尔斯电码
- 培根密码
- 等50+种工具

### CTFever
**链接**: [https://ctfever.uniiem.com/](https://ctfever.uniiem.com/)

**功能**: CTF工具集合

**特点**:
- 现代化界面
- 多种古典密码
- 持续更新

### BugKu CTF工具
**链接**: [https://ctf.bugku.com/tools](https://ctf.bugku.com/tools)

**功能**: CTF专用工具集

## 常见古典密码

### 凯撒密码 (Caesar Cipher)
**在线工具**:
- [摩尔斯电码00查](http://moersima.00cha.net/kaisamima.asp)
- [Hi编码](http://www.hiencode.com/caesar.html)
- [BugKu](https://ctf.bugku.com/tool/caesar)

**原理**: 字母移位

**示例**:
```
明文: HELLO
移位3: KHOOR
移位13(ROT13): URYYB
```

### 维吉尼亚密码 (Vigenere Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/vigenere.html)
- [BugKu](https://ctf.bugku.com/tool/vigenere)
- [CTFever](https://ctfever.uniiem.com/tools/vigenereCipher)
- [Guballa Solver](https://www.guballa.de/vigenere-solver) - 密文破解
- [MyGeocaching](https://www.mygeocachingprofile.com/codebreaker.vigenerecipher.aspx)

**原理**: 多表代换密码，使用密钥

**工具**:
- [GitHub - vigenere-solver](https://github.com/20142995/vigenere-solver)

### 栅栏密码 (Rail Fence Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/railfence.html)
- [BugKu](https://ctf.bugku.com/tool/railfence)
- [QQ秀资](https://www.qqxiuzi.cn/bianma/zhalanmima.php)
- [CTFever](https://ctfever.uniiem.com/tools/rail-fence-cipher)

**原理**: Z字形排列后按行读取

### 培根密码 (Bacon Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/baconian.html)
- [dCode](https://www.dcode.fr/bacon-cipher)

**原理**: 只用A和B两个字母表示

**示例**:
```
A = AAAAA
B = AAAAB
```

### 猪圈密码 (Pigpen Cipher)
**在线工具**:
- [CTF SSLEye](http://ctf.ssleye.com/pigpen.html)
- [Hi编码](http://www.hiencode.com/pigpen.html)
- [CTFever](https://ctfever.uniiem.com/tools/pigpen)

**别名**: 共济会密码、石匠密码

**原理**: 使用几何图形替换字母

### 仿射密码 (Affine Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/affine.html)
- [Boxentriq](https://www.boxentriq.com/code-breaking/affine-cipher)
- [WishingStar](https://www.wishingstarmoye.com/ctf/affinecipher)

**原理**: 数学函数加密

**公式**: E(x) = (ax + b) mod 26

### 埃特巴什码 (Atbash Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/atbash.html)

**原理**: 字母表反转

**示例**:
```
A ↔ Z
B ↔ Y
...
```

### 敲击码 (Tap Code)
**在线工具**:
- [CTF SSLEye](http://ctf.ssleye.com/tapcode.html)
- [Hi编码](http://www.hiencode.com/tapcode.html)

**原理**: 5x5波尔比俄斯方阵

**示例**:
```
A = 1,1  (一击一击)
B = 1,2  (一击两击)
```

### 四方密码 (Four-Square Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/four.html)

**原理**: 使用四个5x5方阵

### 双密码 (Bifid Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/bifid.html)

**原理**: 波尔比俄斯方阵+转置

### 普莱费尔密码 (Playfair Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/playfair.html)

**原理**: 5x5方阵，成对加密

### 希尔密码 (Hill Cipher)
**在线工具**:
- [BugKu](https://ctf.bugku.com/tool/hill)

**原理**: 矩阵运算加密

### 博福特密码 (Beaufort Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/beaufort.html)

**原理**: 类似维吉尼亚的变体

### 博多码 (Baudot Code)
**在线工具**:
- [Boxentriq](https://www.boxentriq.com/code-breaking/baudot-code)

**原理**: 5位二进制编码

### 波特密码 (Porta Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/porta.html)

**原理**: 维吉尼亚密码的改进版

### Gronsfeld密码
**在线工具**:
- [Hi编码](http://www.hiencode.com/gronsfeld.html)

**原理**: 只使用数字的维吉尼亚密码

### 自动密钥密码 (Autokey Cipher)
**在线工具**:
- [Hi编码](http://www.hiencode.com/autokey.html)
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=920)

**工具**:
- [GitHub - breakautokey](https://github.com/hotzzzzy/breakautokey)

**原理**: 使用明文作为密钥的一部分

### 关键字密码
**在线工具**:
- [Hi编码](http://www.hiencode.com/keyword.html)

**原理**: 使用关键字构造替换表

### 简单换位密码
**在线工具**:
- [Hi编码](http://www.hiencode.com/simple.html)

**原理**: 打乱明文顺序

### 列移位密码
**在线工具**:
- [Hi编码](http://www.hiencode.com/colum.html)

**原理**: 按列移位

### 滚动密钥密码
**在线工具**:
- [Hi编码](http://www.hiencode.com/runkey.html)

**原理**: 使用长密钥流加密

## ADFGX/ADFGVX密码
**在线工具**:
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=918)
- [Hi编码 - ADFGX](http://www.hiencode.com/adfgx.html)
- [Hi编码 - ADFGVX](http://www.hiencode.com/adfgvx.html)
- [BugKu](https://ctf.bugku.com/tool/adfgx)
- [PracticalCryptography](http://www.practicalcryptography.com/ciphers/adfgx-cipher/)

**原理**: 德国一战时期使用的密码

## 同音替代密码
**在线工具**:
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=919)

**原理**: 一个字母对应多个密文

## 特殊编码

### A1Z26密码
**在线工具**:
- [Hi编码](http://www.hiencode.com/a1z26.html)

**原理**: A=1, B=2, ..., Z=26

### 电报码
**在线工具**:
- [QQ秀资](https://www.qqxiuzi.cn/bianma/dianbao.php)

**原理**: 中文电报编码

### 百家姓编码
**在线工具**:
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=1050)
- [API](https://api.dujin.org/baijiaxing/)

**原理**: 使用百家姓顺序编码

## 趣味编码

### 与佛论禅
**在线工具**:
- [佛曰](http://hi.pcmoe.net/buddha.html)
- [Atoolbox](http://www.atoolbox.net/Tool.php?Id=1027)
- [KeyFC土豆](http://www.keyfc.net/bbs/tools/tudoucode.aspx)
- [BugKu](https://ctf.bugku.com/tool/todousharp)

**原理**: 佛经文字编码

### 社会主义核心价值观编码
**在线工具**:
- [Hi编码](http://www.hiencode.com/cvencode.html)
- [C5R](https://c5r.app/tools/core-values-cipher)
- [CTFever](https://ctfever.uniiem.com/tools/core-values-cipher)
- [BugKu](https://ctf.bugku.com/tool/cvecode)

**原理**: 使用24字核心价值观编码

### 兽音译者
**链接**: [https://roar.iiilab.com/](https://roar.iiilab.com/)

**功能**: 兽语编码

### 阴阳怪气编码
**链接**: [https://jiji.pro/yygq.js/](https://jiji.pro/yygq.js/)

**功能**: 拼音谐音编码

### 音乐符号加密
**链接**: [https://www.qqxiuzi.cn/bianma/wenbenjiami.php?s=yinyue](https://www.qqxiuzi.cn/bianma/wenbenjiami.php?s=yinyue)

**功能**: 使用音乐符号编码

### 中文加密
**链接**: [https://www.qqxiuzi.cn/bianma/wenbenjiami.php](https://www.qqxiuzi.cn/bianma/wenbenjiami.php)

**功能**: 各种中文趣味加密

## 密码分析

### Quipqiup
**链接**: [https://quipqiup.com](https://quipqiup.com)

**功能**: 自动破解替换密码

**特点**:
- AI辅助破解
- 英文密文分析
- 快速试探

### 替换密码求解器
**GitHub**: [https://github.com/alexbers/substitution_cipher_solver](https://github.com/alexbers/substitution_cipher_solver)

**功能**: Python自动破解替换密码

## CTF解题技巧

!!! tip "识别古典密码"
    1. 查看密文字符集（纯字母/数字/符号）
    2. 统计字符频率
    3. 观察明显的规律
    4. 尝试常见密码（凯撒、栅栏等）
    5. 使用在线工具批量尝试

!!! tip "破解思路"
    1. **凯撒/ROT**: 直接爆破26种可能
    2. **维吉尼亚**: 寻找密钥长度→频率分析
    3. **栅栏**: 尝试不同栏数
    4. **培根**: 二元编码，5位一组
    5. **其他**: 根据特征识别

!!! warning "常见陷阱"
    - 多重加密（先凯撒后栅栏等）
    - 变种密码（改进的算法）
    - 密钥在题目描述中
    - 需要预处理（去空格/大小写）
