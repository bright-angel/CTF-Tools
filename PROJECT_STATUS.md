# CTF在线工具导航 - 项目完成

## ✅ 项目状态：已完成

### 📊 最终统计
- **文档数量**: 26个Markdown页面
- **工具收录**: 200+ 在线工具
- **BugKu工具**: 已完整收录
- **搜索索引**: 已生成并优化

### 🎯 主要功能
- ✅ 中英文智能搜索（快捷键 `/` 或 `S`）
- ✅ 亮色/暗色主题切换
- ✅ 完全响应式设计
- ✅ GitHub Actions自动部署
- ✅ Material Design现代化界面

### 📚 内容分类

#### 1. 编码解码
- Base系列（Base16-Base100）
- URL编码
- 摩尔斯电码
- Unicode/ASCII等

#### 2. 加密解密
- **对称加密**: AES, DES, 3DES, RC4等
- **非对称加密**: RSA, ECC, DH
- **哈希函数**: MD5, SHA系列, 破解工具
- **古典密码**: 凯撒, 维吉尼亚, 栅栏, ADFGX等30+种
- **趣味编码**: 与佛论禅, 核心价值观, 零宽隐写, Brainfuck等

#### 3. Web工具
- SQL注入测试
- XSS Payload
- 命令注入绕过
- 文件上传/包含
- JWT工具
- Hash长度扩展攻击

#### 4. 逆向工具
- **反编译**: Java, .NET, Android, Python
- **调试**: GDB, x64dbg, 动态分析
- **Python逆向**: PyInstaller提取, pyc反编译
- **Java逆向**: JADX, APK分析, 混淆识别
- **IDA工具**: Rust/Golang插件, 查壳, 脱壳

#### 5. 杂项工具
- 图片隐写分析
- 文件格式分析
- 二维码识别
- 拼图还原
- 综合工具集

### 🔗 已收录的BugKu工具
```
bugku.com/tool/adfgx        - ADFGX密码
bugku.com/tool/base100      - Base100编码
bugku.com/tool/base16       - Base16编码
bugku.com/tool/base32       - Base32编码
bugku.com/tool/base58       - Base58编码
bugku.com/tool/base62       - Base62编码
bugku.com/tool/base64       - Base64编码
bugku.com/tool/base85       - Base85编码
bugku.com/tool/base91       - Base91编码
bugku.com/tool/base92       - Base92编码
bugku.com/tool/brainfuck    - Brainfuck解密
bugku.com/tool/caesar       - 凯撒密码
bugku.com/tool/cvecode      - 核心价值观编码
bugku.com/tool/hill         - 希尔密码
bugku.com/tool/railfence    - 栅栏密码
bugku.com/tool/sojson4      - Sojson.v4解密
bugku.com/tool/sojson5      - Sojson.v5解密
bugku.com/tool/todousharp   - 与佛论禅
bugku.com/tool/tripledes    - 3DES加密
bugku.com/tool/uuencode     - UUencode
bugku.com/tool/vigenere     - 维吉尼亚密码
bugku.com/tool/xxencode     - XXencode
```

### 🚀 部署信息
- **仓库**: https://github.com/bright-angel/CTF-Tools
- **网站**: https://bright-angel.github.io/CTF-Tools/
- **部署方式**: GitHub Actions自动部署
- **部署时间**: 推送后1-3分钟

### 📖 使用说明

#### 本地运行
```bash
# Windows
start.bat

# Linux/Mac
./start.sh
```

#### 更新内容
```bash
# 修改Markdown文件
# 然后推送
git add .
git commit -m "更新内容"
git push
```

#### 添加新工具
在对应分类的.md文件中添加：
```markdown
### 工具名称
**链接**: [https://example.com](https://example.com)

**功能**: 工具描述

**特点**:
- 特点1
- 特点2
```

### 🎨 自定义

#### 修改网站信息
编辑 `mkdocs.yml`:
```yaml
site_name: 你的网站名称
site_url: https://你的用户名.github.io/仓库名/
```

#### 修改主题颜色
```yaml
theme:
  palette:
    - scheme: default
      primary: blue  # 改成喜欢的颜色
```

### 📝 维护建议
1. 定期检查工具链接是否失效
2. 根据CTF趋势添加新工具
3. 更新工具使用技巧
4. 收集用户反馈改进

### 🤝 贡献指南
欢迎提交Issue和PR！
- 报告失效链接
- 推荐新工具
- 改进文档
- 修复错误

### 📄 许可证
MIT License - 自由使用和修改

---

**项目完成日期**: 2026-09-07  
**版本**: 1.0.0  
**状态**: ✅ 已部署运行
