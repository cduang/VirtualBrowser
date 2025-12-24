# SSH Keys 配置指南

使用 SSH keys 可以让你无需每次输入密码或 token，更加安全和方便。

## 方法一：使用批处理脚本（推荐）

1. **运行 `setup-ssh.bat`**
   - 如果已有 SSH key，会直接显示公钥
   - 如果没有，会自动生成新的 SSH key

2. **复制公钥内容**
   - 脚本会显示你的公钥（从 `ssh-ed25519` 开始到邮箱结束）

3. **添加到 GitHub**
   - 访问：https://github.com/settings/keys
   - 点击 "New SSH key"
   - Title: 填写 "My Computer" 或任意名称
   - Key: 粘贴刚才复制的公钥
   - 点击 "Add SSH key"

4. **测试连接**
   ```bash
   ssh -T git@github.com
   ```
   如果看到 "Hi cduang! You've successfully authenticated..." 说明配置成功

5. **使用 SSH 上传**
   - 运行 `upload-to-github.bat`，脚本会自动使用 SSH 方式

## 方法二：手动配置

### 1. 检查是否已有 SSH key

打开 Git Bash 或命令提示符，执行：

```bash
ls -al ~/.ssh
```

如果看到 `id_rsa.pub` 或 `id_ed25519.pub`，说明已有 SSH key。

### 2. 生成新的 SSH key（如果没有）

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- 按 Enter 使用默认路径
- 可以设置密码（可选，更安全）
- 或直接按 Enter 跳过密码

### 3. 查看并复制公钥

```bash
cat ~/.ssh/id_ed25519.pub
```

或者 Windows：
```bash
type %USERPROFILE%\.ssh\id_ed25519.pub
```

复制输出的全部内容（从 `ssh-ed25519` 开始到邮箱结束）

### 4. 添加到 GitHub

1. 访问：https://github.com/settings/keys
2. 点击 "New SSH key"
3. Title: 填写描述（如 "My Computer"）
4. Key: 粘贴刚才复制的公钥
5. 点击 "Add SSH key"

### 5. 测试连接

```bash
ssh -T git@github.com
```

如果看到类似以下内容，说明成功：
```
Hi cduang! You've successfully authenticated, but GitHub does not provide shell access.
```

### 6. 使用 SSH 上传项目

更新远程仓库地址为 SSH：

```bash
git remote set-url origin git@github.com:cduang/VirtualBrowser.git
```

然后推送：
```bash
git push -u origin main
```

## SSH vs HTTPS 对比

| 特性 | SSH | HTTPS |
|------|-----|-------|
| 安全性 | 更高 | 较高 |
| 便利性 | 配置一次，永久使用 | 需要 token |
| 速度 | 稍快 | 正常 |
| 配置难度 | 中等 | 简单 |

## 常见问题

### Q: 提示 "Permission denied (publickey)"
**解决**：
1. 检查 SSH key 是否已添加到 GitHub
2. 测试连接：`ssh -T git@github.com`
3. 确保使用 SSH URL：`git@github.com:cduang/VirtualBrowser.git`

### Q: 如何切换回 HTTPS？
```bash
git remote set-url origin https://github.com/cduang/VirtualBrowser.git
```

### Q: 如何查看当前使用的远程地址？
```bash
git remote -v
```

### Q: 多个 GitHub 账号怎么办？
需要配置 SSH config 文件，为不同账号使用不同的 SSH key。

## 推荐配置

使用 SSH keys 的好处：
- ✅ 无需每次输入密码或 token
- ✅ 更安全（密钥加密）
- ✅ 配置一次，永久使用
- ✅ 支持多个 GitHub 账号

配置完成后，你就可以直接使用 `upload-to-github.bat` 上传项目了！

