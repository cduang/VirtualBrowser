# 如何将项目上传到 GitHub

## 方法一：使用 Git 命令行（推荐）

### 1. 安装 Git（如果还没有安装）

- Windows: 下载并安装 [Git for Windows](https://git-scm.com/download/win)
- Mac: `brew install git` 或从官网下载
- Linux: `sudo apt-get install git` (Ubuntu/Debian) 或 `sudo yum install git` (CentOS/RHEL)

### 2. 在 GitHub 上创建新仓库

1. 登录 [GitHub](https://github.com)
2. 点击右上角的 "+" 号，选择 "New repository"
3. 填写仓库信息：
   - Repository name: 输入仓库名称（例如：VirtualBrowser）
   - Description: 可选，填写项目描述
   - 选择 Public（公开）或 Private（私有）
   - **不要**勾选 "Initialize this repository with a README"（因为我们要推送现有代码）
4. 点击 "Create repository"

### 3. 在本地初始化 Git 仓库

打开终端/命令行，进入项目目录：

```bash
# 进入项目根目录
cd D:\VirtualBrowser-main

# 初始化 Git 仓库（如果还没有初始化）
git init

# 添加所有文件到暂存区
git add .

# 创建初始提交
git commit -m "Initial commit: VirtualBrowser project"
```

### 4. 添加远程仓库并推送

```bash
# 添加 GitHub 远程仓库（将 YOUR_USERNAME 和 YOUR_REPO_NAME 替换为你的实际信息）
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# 或者使用 SSH（如果你配置了 SSH key）
# git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git

# 推送代码到 GitHub
git branch -M main
git push -u origin main
```

**注意**：如果这是第一次使用 GitHub，可能需要：
- 输入 GitHub 用户名和密码
- 或者使用 Personal Access Token（推荐，因为 GitHub 已不再支持密码认证）

### 5. 创建 Personal Access Token（如果需要）

1. 登录 GitHub，进入 Settings → Developer settings → Personal access tokens → Tokens (classic)
2. 点击 "Generate new token (classic)"
3. 填写 Note（例如：My Computer）
4. 选择过期时间
5. 勾选 `repo` 权限
6. 点击 "Generate token"
7. **复制生成的 token**（只显示一次！）
8. 在推送时，用户名输入你的 GitHub 用户名，密码输入刚才复制的 token

---

## 方法二：使用 GitHub Desktop（图形界面，更简单）

### 1. 下载并安装 GitHub Desktop

从 [GitHub Desktop 官网](https://desktop.github.com/) 下载并安装

### 2. 登录 GitHub 账号

打开 GitHub Desktop，使用你的 GitHub 账号登录

### 3. 添加本地仓库

1. 点击 "File" → "Add Local Repository"
2. 如果项目还没有初始化 Git，点击 "create a repository"
3. 选择项目目录：`D:\VirtualBrowser-main`
4. 点击 "Add repository"

### 4. 提交并推送

1. 在 GitHub Desktop 中，你会看到所有更改的文件
2. 在左下角填写提交信息（例如："Initial commit"）
3. 点击 "Commit to main"
4. 点击右上角的 "Publish repository"
5. 填写仓库名称和描述
6. 选择是否公开（Public/Private）
7. 点击 "Publish Repository"

---

## 方法三：使用 VS Code（如果你使用 VS Code）

### 1. 打开项目

在 VS Code 中打开项目文件夹

### 2. 初始化 Git

1. 按 `Ctrl+Shift+P`（Mac: `Cmd+Shift+P`）
2. 输入 "Git: Initialize Repository"
3. 选择项目根目录

### 3. 提交代码

1. 点击左侧的源代码管理图标（或按 `Ctrl+Shift+G`）
2. 点击 "+" 号暂存所有更改
3. 在消息框中输入提交信息
4. 点击 "✓" 提交

### 4. 推送到 GitHub

1. 点击左下角的 "..." 菜单
2. 选择 "Remote" → "Add Remote"
3. 输入远程仓库 URL：`https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git`
4. 再次点击 "..." 菜单
5. 选择 "Push" → "Push to..."

---

## 常见问题

### Q: 推送时提示 "remote: Support for password authentication was removed"
A: GitHub 不再支持密码认证，需要使用 Personal Access Token。参考上面的步骤 5。

### Q: 如何忽略某些文件（如 node_modules）？
A: 在项目根目录创建 `.gitignore` 文件，添加要忽略的文件/文件夹：

```
node_modules/
dist/
.DS_Store
*.log
.env
```

### Q: 如何更新已存在的仓库？
A: 使用以下命令：
```bash
git add .
git commit -m "Update: 描述你的更改"
git push
```

### Q: 如何查看远程仓库地址？
A: 使用命令：
```bash
git remote -v
```

---

## 推荐的 .gitignore 文件

在项目根目录创建 `.gitignore` 文件，内容如下：

```
# Dependencies
node_modules/
package-lock.json

# Build outputs
dist/
build/
*.log

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Environment
.env
.env.local

# Cache
.cache/
.npm/
```

---

## 完成后的检查清单

- [ ] GitHub 仓库已创建
- [ ] 本地 Git 仓库已初始化
- [ ] 代码已提交到本地
- [ ] 远程仓库已添加
- [ ] 代码已推送到 GitHub
- [ ] GitHub Actions 工作流已配置（已自动包含）

推送完成后，你的项目就会出现在 GitHub 上，并且 GitHub Actions 会自动运行构建工作流！


