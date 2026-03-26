# OpenClaw Skill 安装配置

## 📦 安装方法

### 方法 1: 使用 OpenClaw CLI（推荐）

```bash
# 安装 OpenClaw CLI（如果还没有）
npm install -g @openclaw/cli

# 从 GitHub 安装
openclaw install github:isunlifelc/pdemo

# 或指定版本
openclaw install github:isunlifelc/pdemo@v1.2.1
```

### 方法 2: 在 QoderWork 中安装

在 QoderWork 对话框中输入：

```
/install-skill-dependency
```

然后选择或输入：
- GitHub 仓库：`https://github.com/isunlifelc/pdemo`
- 或直接搜索：`product-demo-builder`

### 方法 3: 手动克隆安装

```bash
# 克隆仓库
git clone https://github.com/isunlifelc/pdemo.git product-demo-builder

# 进入目录
cd product-demo-builder

# 启动本地服务器
python -m http.server 8000

# 或使用 Node.js
npx http-server -p 8000
```

然后在浏览器访问：http://localhost:8000/index.html

## 🔧 配置文件说明

### package.json

```json
{
  "name": "product-demo-builder",
  "version": "1.2.1",
  "type": "qoder-skill",
  "repository": {
    "url": "https://github.com/isunlifelc/pdemo.git"
  },
  "qoder": {
    "name": "产品Demo 搭建工具",
    "entry": "index.html",
    "requireServer": true
  }
}
```

### SKILL.md

包含完整的技能配置信息：
- 基本信息（名称、版本、作者）
- 功能描述
- 安装说明
- 使用指南
- 技术细节

## 📋 安装后的目录结构

```
~/.qoderwork/skills/product-demo-builder/
├── index.html          # 主程序
├── editor.html         # 编辑器
├── README.md           # 使用说明
├── SKILL.md           # 技能配置
└── package.json       # 包配置
```

## ✅ 验证安装

### 检查文件是否存在

```bash
ls ~/.qoderwork/skills/product-demo-builder/
# 应该看到：
# index.html
# editor.html
# README.md
# SKILL.md
# package.json
```

### 测试运行

```bash
cd ~/.qoderwork/skills/product-demo-builder
python -m http.server 8000
```

然后访问：http://localhost:8000/index.html

## 🚀 使用方式

安装完成后，在 QoderWork 中：

1. **自动识别**
   - QoderWork 会自动检测已安装的 skill
   - 在需要时推荐使用

2. **手动打开**
   ```
   /open product-demo-builder
   ```

3. **快捷命令**
   ```
   /pd  # 如果配置了别名
   ```

## 🔄 更新技能

```bash
# 使用 OpenClaw 更新
openclaw update product-demo-builder

# 或手动更新
cd ~/.qoderwork/skills/product-demo-builder
git pull origin main
```

## ⚙️ 配置选项

在 `~/.qoderwork/config.json` 中添加：

```json
{
  "skills": {
    "product-demo-builder": {
      "enabled": true,
      "autoStart": false,
      "port": 8000,
      "alias": ["pd", "demo"]
    }
  }
}
```

## 🐛 故障排查

### 问题 1: 安装失败

```bash
# 检查网络连接
ping github.com

# 检查 OpenClaw 版本
openclaw --version

# 重新安装
openclaw uninstall product-demo-builder
openclaw install github:isunlifelc/pdemo
```

### 问题 2: 无法启动

```bash
# 检查端口是否被占用
lsof -i :8000

# 更换端口
openclaw config product-demo-builder --port 8080
```

### 问题 3: 文件缺失

```bash
# 重新克隆
rm -rf ~/.qoderwork/skills/product-demo-builder
openclaw install github:isunlifelc/pdemo
```

## 📞 获取帮助

- 📖 文档：https://github.com/isunlifelc/pdemo/blob/main/README.md
- 🐛 Issues: https://github.com/isunlifelc/pdemo/issues
- 💬 讨论：https://github.com/isunlifelc/pdemo/discussions

---

**仓库地址:** https://github.com/isunlifelc/pdemo  
**当前版本:** v1.2.1  
**最后更新:** 2026-03-26
