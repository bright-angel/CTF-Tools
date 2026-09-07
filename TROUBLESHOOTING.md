# GitHub Pages 部署问题解决方案

## 问题：404 Not Found

错误信息表明GitHub Pages未正确启用。

## 解决步骤

### 步骤1: 启用GitHub Pages

1. 进入仓库页面：`https://github.com/你的用户名/CTF-Tools`
2. 点击 **Settings**（设置）
3. 在左侧菜单找到 **Pages**
4. 在 **Build and deployment** 部分：
   - **Source** 必须选择：**GitHub Actions** ⚠️
   - ❌ 不要选择 "Deploy from a branch"
5. 点击 **Save**

### 步骤2: 检查权限

确认工作流权限：

1. 进入 **Settings** → **Actions** → **General**
2. 滚动到 **Workflow permissions**
3. 选择：**Read and write permissions** ✅
4. 勾选：**Allow GitHub Actions to create and approve pull requests**
5. 点击 **Save**

### 步骤3: 重新运行部署

1. 进入 **Actions** 标签页
2. 找到失败的工作流
3. 点击 **Re-run all jobs**

或者触发新的部署：
```bash
git commit --allow-empty -m "Trigger deployment"
git push
```

## 常见问题

### Q: 仓库是私有的吗？
**A**: 如果是私有仓库，需要：
- GitHub Pro/Team/Enterprise 账号
- 或将仓库改为 Public

### Q: 分支名称不是 main？
**A**: 确认分支名称，可能是 `master`，需要修改：
```yaml
# .github/workflows/deploy.yml
on:
  push:
    branches:
      - master  # 或你的分支名
```

### Q: 仍然失败？
**A**: 检查以下内容：
1. 仓库名称是否正确
2. GitHub Pages 是否真的启用
3. 工作流权限是否正确设置
4. 等待2-3分钟重试

## 验证配置

### 检查 Pages 设置
访问：`https://github.com/你的用户名/CTF-Tools/settings/pages`

应该看到：
```
✅ Your site is ready to be published at https://你的用户名.github.io/CTF-Tools/
```

### 检查 Actions 权限
访问：`https://github.com/你的用户名/CTF-Tools/settings/actions`

确保：
```
✅ Read and write permissions
✅ Allow GitHub Actions to create and approve pull requests
```

## 手动部署方案（备选）

如果自动部署持续失败，可以使用 `gh-pages` 分支方式：

```bash
# 安装 ghp-import
pip install ghp-import

# 构建网站
mkdocs build

# 部署到 gh-pages 分支
ghp-import -n -p -f site
```

然后在 GitHub Pages 设置中选择 `gh-pages` 分支。

## 完整工作流文件

已更新权限设置，确保 `.github/workflows/deploy.yml` 包含：

```yaml
permissions:
  contents: write  # 改为 write
  pages: write
  id-token: write
```

## 下一步

1. ✅ 确认 Pages 设置为 GitHub Actions
2. ✅ 确认工作流权限为 Read and write
3. ✅ 重新运行失败的工作流
4. ⏰ 等待部署完成（1-3分钟）
5. 🌐 访问网站

---

需要进一步帮助？查看 GitHub Actions 日志获取详细错误信息。
