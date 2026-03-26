# OpenClaw 安装使用指南

## 🎯 快速安装（三选一）

### 方式 1: 一键安装脚本（最简单）

#### macOS / Linux
```bash
# 克隆仓库
git clone https://github.com/isunlifelc/pdemo.git
cd pdemo

# 运行安装脚本
./install.sh
```

#### Windows
```cmd
REM 克隆仓库
git clone https://github.com/isunlifelc/pdemo.git
cd pdemo

REM 运行安装脚本
install.bat
```

### 方式 2: 使用 OpenClaw CLI

```bash
# 安装 OpenClaw（如果还没有）
npm install -g @openclaw/cli

# 直接从 GitHub 安装
openclaw install github:isunlifelc/pdemo
```

### 方式 3: 在 QoderWork 中安装

1. 打开 QoderWork
2. 输入命令：`/install-skill-dependency`
3. 搜索或输入：`product-demo-builder`
4. 确认安装

---

## 📋 详细安装步骤

### 步骤 1: 安装 OpenClaw CLI

OpenClaw 是 Qoder 的包管理工具，用于安装和管理 skills。

```bash
# 使用 npm
npm install -g @openclaw/cli

# 或使用 yarn
yarn global add @openclaw/cli

# 验证安装
openclaw --version
```

**输出示例：**
```
@openclaw/cli v1.0.0
```

### 步骤 2: 安装产品Demo工具

#### 方法 A: 从 GitHub 安装（推荐）

```bash
openclaw install github:isunlifelc/pdemo
```

**安装过程：**
```
📦 Cloning from GitHub: isunlifelc/pdemo
✅ Clone complete
🔧 Installing dependencies...
✅ Installation complete
✨ product-demo-builder v1.2.1 installed successfully
```

#### 方法 B: 指定版本安装

```bash
# 安装特定版本
openclaw install github:isunlifelc/pdemo@v1.2.1

# 安装最新版
openclaw install github:isunlifelc/pdemo@latest
```

#### 方法 C: 交互式安装

```bash
openclaw install
```

然后根据提示：
1. 选择来源：GitHub
2. 输入仓库：`isunlifelc/pdemo`
3. 选择版本：Latest (v1.2.1)
4. 确认安装

### 步骤 3: 验证安装

```bash
# 查看已安装的 skills
openclaw list

# 应该看到：
# ┌──────────────────────┬─────────┬──────────┐
# │ Name                 │ Version │ Status   │
# ├──────────────────────┼─────────┼──────────┤
# │ product-demo-builder │ 1.2.1   │ Active   │
# └──────────────────────┴─────────┴──────────┘
```

---

## 🚀 使用方法

### 在 QoderWork 中使用

安装完成后，skill 会自动在 QoderWork 中可用。

#### 自动触发
当你在对话中提到以下关键词时，QoderWork 可能会推荐使用此 skill：
- "创建 demo"
- "搭建页面"
- "产品演示"
- "原型设计"
- "page builder"

#### 手动打开
```
/open product-demo-builder
```

或简写：
```
/pd
```

### 独立运行

也可以不通过 QoderWork，直接运行：

```bash
# 使用 OpenClaw 运行
openclaw run product-demo-builder

# 或直接启动服务器
cd ~/.qoderwork/skills/product-demo-builder
python -m http.server 8000

# 然后访问
http://localhost:8000/index.html
```

---

## ⚙️ 配置选项

### 修改端口号

默认使用 8000 端口，如果被占用可以修改：

```bash
# 方法 1: 使用配置文件
echo '{"port": 8080}' > ~/.qoderwork/skills/product-demo-builder/config.json

# 方法 2: 使用命令行参数
openclaw run product-demo-builder --port 8080
```

### 设置别名

在 `~/.qoderwork/config.json` 中添加：

```json
{
  "aliases": {
    "pd": "product-demo-builder",
    "demo": "product-demo-builder"
  }
}
```

之后可以使用：
```
/pd      # 打开产品Demo工具
/demo    # 同样打开产品Demo工具
```

---

## 🔄 更新技能

### 检查更新

```bash
openclaw check-updates
```

**输出示例：**
```
Checking for updates...
✨ All skills are up to date

或
📦 Updates available:
   - product-demo-builder: 1.2.1 → 1.2.2
```

### 更新单个技能

```bash
# 更新 product-demo-builder
openclaw update product-demo-builder
```

### 更新所有技能

```bash
openclaw update-all
```

### 自动更新

在 `~/.qoderwork/config.json` 中配置：

```json
{
  "autoUpdate": true,
  "updateSchedule": "weekly"
}
```

---

## 🗑️ 卸载技能

```bash
# 卸载 product-demo-builder
openclaw uninstall product-demo-builder

# 确认卸载
openclaw list
```

---

## 🐛 故障排查

### 问题 1: OpenClaw 未找到

**错误信息：**
```
command not found: openclaw
```

**解决方案：**
```bash
# 检查 npm 全局路径是否在 PATH 中
npm config get prefix

# 添加到 ~/.bashrc 或 ~/.zshrc
export PATH=$(npm config get prefix)/bin:$PATH

# 重新加载配置
source ~/.bashrc
```

### 问题 2: 安装失败

**错误信息：**
```
Error: Failed to clone repository
```

**解决方案：**
```bash
# 检查网络连接
ping github.com

# 检查 Git 是否安装
git --version

# 手动克隆
git clone https://github.com/isunlifelc/pdemo.git
cd pdemo
openclaw install ./pdemo
```

### 问题 3: 端口被占用

**错误信息：**
```
Error: Port 8000 is already in use
```

**解决方案：**
```bash
# 查找占用端口的进程
lsof -i :8000

# 杀死进程
kill -9 <PID>

# 或使用其他端口
openclaw run product-demo-builder --port 8080
```

### 问题 4: Skill 未显示在 QoderWork 中

**解决方案：**
```bash
# 重启 QoderWork
# 完全退出后重新打开

# 刷新技能列表
openclaw refresh

# 检查技能是否安装正确
ls ~/.qoderwork/skills/product-demo-builder/

# 应该有：
# index.html
# editor.html
# README.md
# SKILL.md
# package.json
```

---

## 📊 安装位置

### macOS / Linux
```
~/.qoderwork/skills/product-demo-builder/
```

### Windows
```
C:\Users\<用户名>\.qoderwork\skills\product-demo-builder\
```

### 完整路径示例
```
/Users/yourname/.qoderwork/skills/product-demo-builder/
├── index.html
├── editor.html
├── README.md
├── SKILL.md
└── package.json
```

---

## 💡 高级用法

### 开发模式

如果你在修改源码：

```bash
# 克隆到开发目录
git clone https://github.com/isunlifelc/pdemo.git ~/dev/pdemo

# 创建软链接到 skills 目录
ln -s ~/dev/pdemo ~/.qoderwork/skills/product-demo-builder

# 现在修改源码会立即生效
```

### 多版本共存

```bash
# 安装多个版本
openclaw install github:isunlifelc/pdemo@v1.2.1 --name pd-v1.2.1
openclaw install github:isunlifelc/pdemo@v1.1.0 --name pd-v1.1.0

# 切换版本
openclaw use pd-v1.2.1
```

### 离线安装

```bash
# 下载 zip 文件
wget https://github.com/isunlifelc/pdemo/archive/main.zip

# 解压
unzip main.zip

# 本地安装
openclaw install ./pdemo-main
```

---

## 📞 获取帮助

### 官方文档
- GitHub: https://github.com/isunlifelc/pdemo
- README: https://github.com/isunlifelc/pdemo/blob/main/README.md
- Issues: https://github.com/isunlifelc/pdemo/issues

### OpenClaw 文档
- CLI 文档：https://openclaw.dev/docs
- 配置指南：https://openclaw.dev/config

### 社区支持
- 论坛：https://forum.qoder.com
- Discord: https://discord.gg/qoderwork

---

## ✅ 安装检查清单

- [ ] 已安装 Node.js 和 npm
- [ ] 已安装 OpenClaw CLI (`openclaw --version`)
- [ ] 已成功安装 skill (`openclaw list`)
- [ ] 可以在 QoderWork 中使用
- [ ] 可以独立运行 (`openclaw run`)
- [ ] 知道如何更新 (`openclaw update`)
- [ ] 知道如何卸载 (`openclaw uninstall`)

---

**最后更新:** 2026-03-26  
**当前版本:** v1.2.1  
**仓库地址:** https://github.com/isunlifelc/pdemo
