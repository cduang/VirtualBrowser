# 快速上传到 GitHub

你的仓库地址：
- HTTPS: **https://github.com/cduang/VirtualBrowser.git**
- SSH: **git@github.com:cduang/VirtualBrowser.git**（推荐，需配置 SSH keys）

## 方法一：使用批处理脚本（最简单）

1. 双击运行 `upload-to-github.bat` 文件
2. 按照提示操作
3. 如果提示输入用户名和密码：
   - 用户名：你的 GitHub 用户名（cduang）
   - 密码：使用 Personal Access Token（见下方说明）

## 方法二：使用 SSH Keys（推荐，更安全方便）

1. **配置 SSH keys**（只需一次）：
   - 运行 `setup-ssh.bat` 生成 SSH key
   - 按照提示将公钥添加到 GitHub
   - 详细步骤见 `SSH_SETUP_GUIDE.md`

2. **使用 SSH 上传**：
   - 运行 `upload-to-github.bat`（已自动使用 SSH）
   - 或手动执行命令（见下方）

## 方法三：使用 Git Bash 或命令提示符

打开 **Git Bash** 或 **命令提示符**，进入项目目录，依次执行：

```bash
# 进入项目目录
cd D:\VirtualBrowser-main

# 初始化 Git
git init

# 添加所有文件
git add .

# 提交代码
git commit -m "Initial commit: VirtualBrowser project"

# 添加远程仓库（选择一种方式）

# 方式1: 使用 SSH（推荐，需先配置 SSH keys）
git remote add origin git@github.com:cduang/VirtualBrowser.git

# 方式2: 使用 HTTPS（需要 Personal Access Token）
# git remote add origin https://github.com/cduang/VirtualBrowser.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

## 配置 Git 用户信息（首次使用需要）

如果这是你第一次使用 Git，需要先配置用户信息：

```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

## 关于 Personal Access Token

GitHub 不再支持密码认证，需要使用 Personal Access Token：

1. 登录 GitHub
2. 点击右上角头像 → **Settings**
3. 左侧菜单 → **Developer settings**
4. **Personal access tokens** → **Tokens (classic)**
5. 点击 **Generate new token (classic)**
6. 填写：
   - Note: `My Computer`（任意名称）
   - Expiration: 选择过期时间
   - 勾选 **repo** 权限
7. 点击 **Generate token**
8. **复制生成的 token**（只显示一次！）
9. 在推送时，密码输入这个 token

## 如果遇到问题

### 问题1: "remote: Support for password authentication was removed"
**解决**：使用 Personal Access Token 代替密码

### 问题2: "fatal: not a git repository"
**解决**：确保在项目根目录执行 `git init`

### 问题3: "Permission denied"
**解决**：检查用户名和 token 是否正确

### 问题4: Git 命令无法识别
**解决**：
- 重启命令行窗口
- 检查 Git 是否正确安装
- 使用 Git Bash 而不是命令提示符

## 上传成功后

1. 访问 https://github.com/cduang/VirtualBrowser 查看你的代码
2. GitHub Actions 会自动运行构建工作流
3. 在 Actions 页面可以查看构建状态和下载构建产物


