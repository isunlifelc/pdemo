@echo off
REM 产品Demo 搭建工具 - Windows 安装脚本
REM 使用：install.bat

echo.
echo ========================================
echo   产品Demo 搭建工具 - 安装脚本
echo ========================================
echo.

REM 检查是否安装了 OpenClaw
where openclaw >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未检测到 OpenClaw，请先安装 OpenClaw CLI
    echo.
    echo 安装方法:
    echo   npm install -g @openclaw/cli
    echo.
    pause
    exit /b 1
)

echo [成功] OpenClaw 已安装
echo.

REM 检查是否已安装
openclaw list | findstr "product-demo-builder" >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [提示] product-demo-builder 已经安装
    echo.
    set /p update="是否要更新？(y/n): "
    if /i "%update%"=="y" (
        echo [操作] 正在更新...
        openclaw update product-demo-builder
        echo [成功] 更新完成！
    ) else (
        echo [取消] 已取消操作
        goto :end
    )
) else (
    echo [操作] 正在从 GitHub 安装...
    echo.
    
    REM 安装
    openclaw install github:isunlifelc/pdemo
    
    echo.
    echo [成功] 安装完成！
)

:end
echo.
echo ========================================
echo   使用方式：
echo ========================================
echo.
echo 1. 在 QoderWork 中自动可用
echo 2. 或运行：openclaw run product-demo-builder
echo 3. 或访问：http://localhost:8000/index.html
echo.
echo 文档：https://github.com/isunlifelc/pdemo
echo ========================================
echo.
pause
