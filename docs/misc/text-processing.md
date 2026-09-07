# 数据处理实用工具

文本处理、数据转换、格式化等实用工具。

## 在线工具

### 文本处理

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Text Mechanic | [https://textmechanic.com/](https://textmechanic.com/) | 文本批处理工具 |
| Text Fixer | [https://www.textfixer.com/](https://www.textfixer.com/) | 文本格式化 |
| Remove Line Breaks | [https://www.textfixer.com/tools/remove-line-breaks.php](https://www.textfixer.com/tools/remove-line-breaks.php) | 删除换行 |
| Diff Checker | [https://www.diffchecker.com/](https://www.diffchecker.com/) | 文本对比 |
| Word Counter | [https://wordcounter.net/](https://wordcounter.net/) | 字数统计 |

### 数据转换

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| JSON Formatter | [https://jsonformatter.org/](https://jsonformatter.org/) | JSON格式化验证 |
| XML Formatter | [https://www.freeformatter.com/xml-formatter.html](https://www.freeformatter.com/xml-formatter.html) | XML格式化 |
| CSV to JSON | [https://csvjson.com/csv2json](https://csvjson.com/csv2json) | CSV转JSON |
| YAML Validator | [https://www.yamllint.com/](https://www.yamllint.com/) | YAML验证 |

### 字符串工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Reverse Text | [https://www.textreverse.com/](https://www.textreverse.com/) | 文本反转 |
| Case Converter | [https://convertcase.net/](https://convertcase.net/) | 大小写转换 |
| Remove Duplicate Lines | [https://www.textfixer.com/tools/remove-duplicate-lines.php](https://www.textfixer.com/tools/remove-duplicate-lines.php) | 去重 |
| Sort Lines | [https://www.textfixer.com/tools/alphabetical-order.php](https://www.textfixer.com/tools/alphabetical-order.php) | 排序 |

### 正则表达式

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Regex101 | [https://regex101.com/](https://regex101.com/) | 正则测试调试 |
| RegExr | [https://regexr.com/](https://regexr.com/) | 正则学习工具 |
| Regex Tester | [https://www.regextester.com/](https://www.regextester.com/) | 正则测试 |

## 离线工具

### Python文本处理

**基本操作**:
```python
# 读取文件
with open('file.txt', 'r', encoding='utf-8') as f:
    text = f.read()
    lines = f.readlines()

# 写入文件
with open('output.txt', 'w', encoding='utf-8') as f:
    f.write(text)
    f.writelines(lines)

# 字符串操作
text = "Hello World"

# 大小写转换
print(text.lower())       # hello world
print(text.upper())       # HELLO WORLD
print(text.title())       # Hello World
print(text.swapcase())    # hELLO wORLD

# 去除空白
text = "  hello  "
print(text.strip())       # "hello"
print(text.lstrip())      # "hello  "
print(text.rstrip())      # "  hello"

# 替换
text = "hello world"
print(text.replace('world', 'python'))  # hello python
print(text.replace(' ', '_'))            # hello_world

# 分割和连接
text = "a,b,c,d"
parts = text.split(',')   # ['a', 'b', 'c', 'd']
joined = '-'.join(parts)  # 'a-b-c-d'

# 查找
text = "hello world"
print(text.find('world'))      # 6
print(text.index('world'))     # 6
print('world' in text)         # True

# 判断
print(text.startswith('hello')) # True
print(text.endswith('world'))   # True
print('123'.isdigit())          # True
print('abc'.isalpha())          # True
```

**批量处理**:
```python
# 读取所有行
lines = []
with open('input.txt', 'r') as f:
    lines = f.readlines()

# 去除空行
lines = [line for line in lines if line.strip()]

# 去除重复行
lines = list(set(lines))

# 排序
lines.sort()

# 添加行号
numbered_lines = [f"{i+1}. {line}" for i, line in enumerate(lines)]

# 删除特定字符
lines = [line.replace('\n', '') for line in lines]

# 添加前后缀
lines = [f"prefix_{line}_suffix" for line in lines]

# 保存结果
with open('output.txt', 'w') as f:
    f.writelines(lines)
```

**正则表达式**:
```python
import re

text = "Email: test@example.com, Phone: 123-456-7890"

# 查找
emails = re.findall(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b', text)
print(emails)  # ['test@example.com']

# 替换
clean_text = re.sub(r'\d+', '[REDACTED]', text)
print(clean_text)

# 分割
parts = re.split(r'[,;]', text)

# 匹配
match = re.search(r'(\d{3})-(\d{3})-(\d{4})', text)
if match:
    print(match.group(0))  # 完整匹配
    print(match.group(1))  # 第一个分组

# 常用正则模式
patterns = {
    'email': r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
    'url': r'https?://[^\s]+',
    'ip': r'\b(?:\d{1,3}\.){3}\d{1,3}\b',
    'phone': r'\d{3}-\d{3}-\d{4}',
    'date': r'\d{4}-\d{2}-\d{2}',
    'hex': r'0x[0-9a-fA-F]+',
    'base64': r'^[A-Za-z0-9+/]{4,}={0,2}$',
}

# 提取所有匹配
def extract_pattern(text, pattern_name):
    pattern = patterns.get(pattern_name)
    if pattern:
        return re.findall(pattern, text)
    return []
```

### JSON处理

**Python JSON**:
```python
import json

# 解析JSON字符串
json_str = '{"name": "John", "age": 30}'
data = json.loads(json_str)
print(data['name'])  # John

# 转换为JSON
data = {"name": "John", "age": 30}
json_str = json.dumps(data)
print(json_str)

# 格式化输出
pretty_json = json.dumps(data, indent=4, ensure_ascii=False)
print(pretty_json)

# 读取JSON文件
with open('data.json', 'r') as f:
    data = json.load(f)

# 写入JSON文件
with open('output.json', 'w') as f:
    json.dump(data, f, indent=4, ensure_ascii=False)

# 处理复杂JSON
data = {
    "users": [
        {"name": "Alice", "age": 25},
        {"name": "Bob", "age": 30}
    ]
}

# 提取特定字段
names = [user['name'] for user in data['users']]
print(names)  # ['Alice', 'Bob']

# 过滤
adults = [user for user in data['users'] if user['age'] >= 18]

# 修改
for user in data['users']:
    user['status'] = 'active'
```

### CSV处理

**Python CSV**:
```python
import csv

# 读取CSV
with open('data.csv', 'r') as f:
    reader = csv.reader(f)
    headers = next(reader)  # 第一行
    for row in reader:
        print(row)

# 使用DictReader
with open('data.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row['name'], row['age'])

# 写入CSV
data = [
    ['Name', 'Age', 'City'],
    ['Alice', 25, 'NYC'],
    ['Bob', 30, 'LA']
]

with open('output.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(data)

# 使用DictWriter
data = [
    {'name': 'Alice', 'age': 25, 'city': 'NYC'},
    {'name': 'Bob', 'age': 30, 'city': 'LA'}
]

with open('output.csv', 'w', newline='') as f:
    fieldnames = ['name', 'age', 'city']
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(data)

# CSV to JSON
import csv
import json

with open('data.csv', 'r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    data = list(csv_reader)

with open('data.json', 'w') as json_file:
    json.dump(data, json_file, indent=4)
```

### 命令行工具

**sed (流编辑器)**:
```bash
# 替换
sed 's/old/new/' file.txt
sed 's/old/new/g' file.txt  # 全局替换

# 删除行
sed '1d' file.txt           # 删除第一行
sed '/pattern/d' file.txt   # 删除匹配行
sed '/^$/d' file.txt        # 删除空行

# 插入
sed '1i\New Line' file.txt  # 第一行前插入

# 就地修改
sed -i 's/old/new/g' file.txt
```

**awk (文本处理)**:
```bash
# 打印列
awk '{print $1}' file.txt           # 第一列
awk '{print $1, $3}' file.txt       # 第1和第3列

# 条件
awk '$3 > 100 {print $1}' file.txt  # 第3列>100

# 分隔符
awk -F',' '{print $1}' file.csv     # CSV文件

# 统计
awk '{sum+=$1} END {print sum}' file.txt  # 求和
awk 'END {print NR}' file.txt             # 行数
```

**grep (搜索)**:
```bash
# 基本搜索
grep "pattern" file.txt

# 忽略大小写
grep -i "pattern" file.txt

# 递归搜索
grep -r "pattern" directory/

# 显示行号
grep -n "pattern" file.txt

# 反向匹配
grep -v "pattern" file.txt

# 正则表达式
grep -E "pattern1|pattern2" file.txt

# 统计
grep -c "pattern" file.txt
```

**sort (排序)**:
```bash
# 排序
sort file.txt

# 数值排序
sort -n file.txt

# 反向排序
sort -r file.txt

# 去重
sort -u file.txt

# 按列排序
sort -k2 file.txt  # 第二列
```

**uniq (去重)**:
```bash
# 去重（需要先排序）
sort file.txt | uniq

# 统计重复次数
sort file.txt | uniq -c

# 只显示重复行
sort file.txt | uniq -d

# 只显示唯一行
sort file.txt | uniq -u
```

### 数据格式转换

**Python实用脚本**:
```python
# Base64图片嵌入HTML
def image_to_base64_html(image_path):
    import base64
    with open(image_path, 'rb') as f:
        encoded = base64.b64encode(f.read()).decode()
    return f'<img src="data:image/png;base64,{encoded}">'

# URL参数解析
from urllib.parse import parse_qs, urlparse

url = "http://example.com/path?param1=value1&param2=value2"
parsed = urlparse(url)
params = parse_qs(parsed.query)
print(params)  # {'param1': ['value1'], 'param2': ['value2']}

# 时间戳转换
import time
from datetime import datetime

# 当前时间戳
timestamp = int(time.time())
print(timestamp)

# 时间戳转日期
dt = datetime.fromtimestamp(timestamp)
print(dt.strftime('%Y-%m-%d %H:%M:%S'))

# 日期转时间戳
dt = datetime.strptime('2024-01-01 12:00:00', '%Y-%m-%d %H:%M:%S')
timestamp = int(dt.timestamp())
print(timestamp)

# 字符统计
from collections import Counter

text = "hello world"
counter = Counter(text)
print(counter.most_common(5))  # 最常见的5个字符

# 文本相似度
from difflib import SequenceMatcher

def similarity(a, b):
    return SequenceMatcher(None, a, b).ratio()

print(similarity("hello", "hallo"))  # 0.8
```

## CTF解题技巧

!!! tip "文本处理常用操作"
    ```python
    # 1. 清理文本
    text = text.strip()                    # 去除首尾空白
    text = text.replace('\n', '')          # 删除换行
    text = text.replace(' ', '')           # 删除空格
    text = ''.join(text.split())           # 删除所有空白
    
    # 2. 提取数据
    import re
    numbers = re.findall(r'\d+', text)     # 提取所有数字
    hex_values = re.findall(r'0x[0-9a-fA-F]+', text)  # 十六进制
    
    # 3. 格式转换
    lines = text.split('\n')               # 按行分割
    words = text.split()                   # 按空白分割
    chars = list(text)                     # 转字符列表
    
    # 4. 批量处理
    lines = [line.strip() for line in lines if line.strip()]
    ```

!!! tip "快速数据提取"
    ```python
    import re
    
    # 提取所有flag格式
    flags = re.findall(r'flag\{[^}]+\}', text)
    
    # 提取Base64
    b64 = re.findall(r'[A-Za-z0-9+/]{20,}={0,2}', text)
    
    # 提取MD5
    md5s = re.findall(r'\b[a-fA-F0-9]{32}\b', text)
    
    # 提取URL
    urls = re.findall(r'https?://[^\s]+', text)
    
    # 提取IP
    ips = re.findall(r'\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b', text)
    ```

!!! tip "文件批量处理"
    ```python
    import os
    import glob
    
    # 遍历目录
    for filename in os.listdir('directory'):
        if filename.endswith('.txt'):
            with open(f'directory/{filename}', 'r') as f:
                content = f.read()
                # 处理内容
    
    # 使用glob
    for filepath in glob.glob('**/*.txt', recursive=True):
        with open(filepath, 'r') as f:
            content = f.read()
    ```

!!! tip "JSON/CSV快速转换"
    ```python
    import json
    import csv
    
    # CSV to JSON
    data = []
    with open('data.csv', 'r') as f:
        for row in csv.DictReader(f):
            data.append(row)
    
    with open('data.json', 'w') as f:
        json.dump(data, f, indent=4)
    
    # JSON to CSV
    with open('data.json', 'r') as f:
        data = json.load(f)
    
    keys = data[0].keys()
    with open('data.csv', 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=keys)
        writer.writeheader()
        writer.writerows(data)
    ```

!!! warning "常见陷阱"
    ```
    1. 编码问题
       - 使用 encoding='utf-8'
       - 尝试 encoding='gbk' (Windows中文)
       - 使用 errors='ignore' 跳过错误字符
    
    2. 换行符差异
       - Windows: \r\n
       - Unix/Linux: \n
       - macOS: \r (旧版)
       使用 universal_newlines=True
    
    3. 空白字符
       - 空格、制表符、换行混合
       - 使用 split() 而非 split(' ')
    
    4. 正则贪婪匹配
       - .* 贪婪
       - .*? 非贪婪
    ```

## 相关资源

- **Python re模块**: 正则表达式
- **Python json模块**: JSON处理
- **Python csv模块**: CSV处理
- **sed/awk/grep**: Linux文本三剑客
- **Regex101**: 在线正则测试
