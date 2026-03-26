#!/bin/bash

# 产品Demo 搭建工具 - OpenClaw 安装脚本
# 使用：./install.sh

set -e

echo "🎨 产品Demo 搭建工具 - 安装脚本"
echo "================================"
echo ""

# 检查是否安装了 OpenClaw
if ! command -v openclaw &> /dev/null; then
    echo "❌ 未检测到 OpenClaw，请先安装 OpenClaw CLI"
    echo ""
    echo "安装方法："
    echo "  npm install -g @openclaw/cli"
    echo ""
    exit 1
fi

echo "✅ OpenClaw 已安装"
echo ""

# 检查是否已安装
if openclaw list | grep -q "product-demo-builder"; then
    echo "⚠️  product-demo-builder 已经安装"
    echo ""
    read -p "是否要更新？(y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🔄 正在更新..."
        openclaw update product-demo-builder
        echo "✅ 更新完成！"
    else
        echo "👋 已取消"
        exit 0
    fi
else
    echo "📦 正在从 GitHub 安装..."
    echo ""
    
    # 安装
    openclaw install github:isunlifelc/pdemo
    
    echo ""
    echo "✅ 安装完成！"
fi

echo ""
echo "================================"
echo "🎉 使用方式："
echo ""
echo "1. 在 QoderWork 中自动可用"
echo "2. 或运行：openclaw run product-demo-builder"
echo "3. 或访问：http://localhost:8000/index.html"
echo ""
echo "📖 查看文档：https://github.com/isunlifelc/pdemo"
echo "================================"
echo ""
