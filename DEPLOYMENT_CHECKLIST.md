# ✅ 部署成功检查清单

在推送到GitHub之前，请确认以下项目：

## 📝 必须修改的内容

### 1. mkdocs.yml
```yaml
site_url: https://你的用户名.github.io/你的仓库名/
```

### 2. README.md
将所有 `yourusername` 替换为你的GitHub用户名：
- 仓库链接
- 部署地址
- Badge链接

### 3. docs/about.md
- 修改GitHub链接
- 修改Email地址
- 添加个人信息

### 4. mkdocs.yml 的 extra.social
```yaml
extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/你的用户名/你的仓库名
```

## ✅ 部署前检查

- [ ] 已安装Python 3.8+
- [ ] 已安装依赖: `pip install -r requirements.txt`
- [ ] 本地构建成功: `mkdocs build --strict`
- [ ] 本地预览正常: `mkdocs serve`
- [ ] 已创建GitHub仓库
- [ ] 修改了所有个人信息

## 🚀 部署步骤

### 步骤1: 初始化Git
```bash
cd "CTF Online Tools"
git init
git add .
git commit -m "Initial commit: CTF在线工具导航"
```

### 步骤2: 连接远程仓库
```bash
git remote add origin https://github.com/你的用户名/你的仓库名.git
git branch -M main
git push -u origin main
```

### 步骤3: 配置GitHub Pages
1. 进入仓库页面
2. 点击 `Settings` (设置)
3. 左侧菜单找到 `Pages`
4. **Source** 选择: `GitHub Actions`
5. 保存设置

### 步骤4: 等待部署
- 进入 `Actions` 标签页
- 查看 `Deploy MkDocs to GitHub Pages` 工作流
- 等待绿色 ✓ (通常1-3分钟)

### 步骤5: 访问网站
```
https://你的用户名.github.io/你的仓库名/
```

## 🔍 故障排除

### 构建失败
```bash
# 查看详细错误
mkdocs build --strict --verbose

# 检查依赖
pip list | grep mkdocs
```

### 部署失败
1. 检查 GitHub Actions 日志
2. 确认 Pages 设置为 GitHub Actions
3. 确认仓库是 public（或有 GitHub Pro）

### 页面404
1. 等待3-5分钟（DNS传播）
2. 检查 `site_url` 配置
3. 确认部署成功（绿色✓）

### 搜索不工作
1. 清除浏览器缓存
2. 确认 `search_index.json` 已生成
3. 检查浏览器控制台错误

## 📊 验证清单

部署后检查以下功能：

- [ ] 首页正常显示
- [ ] 导航栏工作正常
- [ ] 搜索功能可用（按 `/` 测试）
- [ ] 所有链接可以访问
- [ ] 移动端显示正常
- [ ] 主题切换功能正常
- [ ] 代码块语法高亮
- [ ] 所有工具链接有效

## 🔄 更新网站

修改内容后：
```bash
git add .
git commit -m "更新内容描述"
git push
```

GitHub Actions 会自动重新部署（1-3分钟）。

## 📞 需要帮助？

- 查看 `DEPLOY.md` 详细指南
- 查看 GitHub Actions 日志
- 提交 Issue 寻求帮助

---

**提示**: 第一次部署可能需要等待5分钟，后续更新通常1-3分钟。

祝部署成功！🎉
