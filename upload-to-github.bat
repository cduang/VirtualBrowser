@echo off
chcp 65001 >nul
echo ========================================
echo 正在上传项目到 GitHub
echo ========================================
echo.

echo [1/5] 初始化 Git 仓库...
git init
if %errorlevel% neq 0 (
    echo 错误: Git 未正确安装或未添加到 PATH
    echo 请确保已安装 Git 并重启命令行窗口
    pause
    exit /b 1
)

echo.
echo [2/5] 添加所有文件到暂存区...
git add .

echo.
echo [3/5] 创建初始提交...
git commit -m "Initial commit: VirtualBrowser project"

echo.
echo [4/5] 添加远程仓库...
echo 使用 SSH 方式连接（如果已配置 SSH keys）
git remote add origin git@github.com:cduang/VirtualBrowser.git
if %errorlevel% neq 0 (
    echo 警告: 远程仓库可能已存在，尝试更新为 SSH...
    git remote set-url origin git@github.com:cduang/VirtualBrowser.git
)

echo.
echo [5/5] 推送到 GitHub...
echo 注意: 如果提示输入用户名和密码，请使用:
echo   - 用户名: 你的 GitHub 用户名
echo   - 密码: Personal Access Token (不是 GitHub 密码)
echo.
git branch -M main
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo 上传成功！
    echo ========================================
    echo 你的项目已上传到: https://github.com/cduang/VirtualBrowser
) else (
    echo.
    echo ========================================
    echo 上传失败
    echo ========================================
    echo 可能的原因:
    echo 1. 需要配置 Git 用户信息
    echo 2. 需要 Personal Access Token
    echo 3. 网络连接问题
    echo.
    echo 请检查错误信息并重试
)

echo.
pause


