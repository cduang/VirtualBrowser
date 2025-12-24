@echo off
chcp 65001 >nul
echo ========================================
echo 配置 SSH Keys for GitHub
echo ========================================
echo.

echo 检查是否已存在 SSH key...
if exist "%USERPROFILE%\.ssh\id_rsa.pub" (
    echo.
    echo 发现已存在的 SSH key！
    echo.
    echo 你的公钥内容：
    type "%USERPROFILE%\.ssh\id_rsa.pub"
    echo.
    echo ========================================
    echo 请复制上面的公钥内容，然后：
    echo 1. 访问 https://github.com/settings/keys
    echo 2. 点击 "New SSH key"
    echo 3. 粘贴公钥内容
    echo 4. 点击 "Add SSH key"
    echo ========================================
    echo.
    pause
    exit /b 0
)

echo.
echo 未找到 SSH key，开始生成...
echo.

echo 请输入你的 GitHub 邮箱地址:
set /p email="Email: "

echo.
echo 正在生成 SSH key...
ssh-keygen -t ed25519 -C "%email%" -f "%USERPROFILE%\.ssh\id_rsa" -N ""

if %errorlevel% neq 0 (
    echo.
    echo 错误: 无法生成 SSH key
    echo 请确保已安装 Git for Windows 或 OpenSSH
    pause
    exit /b 1
)

echo.
echo ========================================
echo SSH key 生成成功！
echo ========================================
echo.
echo 你的公钥内容：
type "%USERPROFILE%\.ssh\id_rsa.pub"
echo.
echo ========================================
echo 下一步操作：
echo ========================================
echo 1. 复制上面的公钥内容（从 ssh-ed25519 开始到邮箱结束）
echo 2. 访问: https://github.com/settings/keys
echo 3. 点击 "New SSH key"
echo 4. Title: 填写 "My Computer" 或任意名称
echo 5. Key: 粘贴刚才复制的公钥
echo 6. 点击 "Add SSH key"
echo.
echo 配置完成后，运行 upload-to-github.bat 即可使用 SSH 上传
echo ========================================
echo.

pause

