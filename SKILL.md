# Qoder Skill: 产品Demo 搭建工具

## 基本信息

```yaml
name: 产品Demo搭建工具
version: 1.2.1
description: 可视化多页面搭建工具，类似 Figma 的产品演示页面编辑器
author: Product Demo Team
tags: [demo, prototype, editor, page-builder, visualization]
category: productivity
```

## 功能描述

一个强大的可视化页面搭建工具，支持：

- 🎨 无限画布，自由拖拽缩放
- 📱 可视化编辑器，所见即所得
- 🔄 实时预览效果
- 💾 自动持久化存储
- 📦 丰富的预设组件库
- ➕ 新建、编辑、复制、删除页面
- 📏 自定义页面尺寸

## 安装说明

### 前置要求

- QoderWork 桌面应用
- 现代浏览器（Chrome/Edge/Firefox）
- 本地 HTTP 服务器（可选但推荐）

### 安装步骤

在 QoderWork 中执行：

```
/install-skill-dependency
```

然后选择"产品Demo搭建工具"进行安装。

### 手动安装

1. 下载本仓库所有文件到本地
2. 确保 `index.html` 和 `editor.html` 在同一目录
3. 使用本地服务器打开：
   ```bash
   cd 产品Demo工具
   python -m http.server 8000
   ```
4. 访问 http://localhost:8000/index.html

## 使用方法

### 基础使用

1. **启动工具**
   ```bash
   # 进入目录
   cd 产品Demo工具
   
   # 启动服务器
   python -m http.server 8000
   
   # 或使用 Node.js
   npx http-server -p 8000
   ```

2. **打开浏览器**
   ```
   http://localhost:8000/index.html
   ```

3. **创建页面**
   - 点击左侧"页面"按钮
   - 在编辑器中添加模块
   - 保存到画板

### 快捷操作

| 操作 | 快捷键/方式 |
|------|------------|
| 新建页面 | 点击"页面"按钮 |
| 编辑页面 | 点击卡片顶部蓝色编辑按钮 |
| 复制页面 | 点击卡片顶部绿色复制按钮 |
| 删除页面 | 点击卡片左上角红色关闭按钮 |
| 平移画布 | 拖拽空白区域 |
| 缩放画布 | 鼠标滚轮 |
| 定位页面 | 点击侧边栏页面项 |

## 核心文件

```
产品Demo工具/
├── index.html          # 主程序（画板）- 80KB
├── editor.html         # 编辑器 - 156KB
└── README.md           # 详细文档
```

## 技术特性

### 数据存储
- **方式**: localStorage
- **Key**: `infiniteCanvasData`
- **结构**: 
  ```javascript
  {
    items: [],        // 所有元素
    scale: 1,         // 缩放比例
    panX: 0,          // 平移 X
    panY: 0,          // 平移 Y
    itemIdCounter: 0, // ID 计数器
    cardZIndex: 10    // Z 轴层级
  }
  ```

### 通信机制
- **方式**: postMessage + localStorage
- **用途**: 父子页面数据传递
- **优势**: 避免 URL 过长问题

### 性能指标
- **首屏加载**: <1s
- **保存响应**: <100ms
- **编辑同步**: 实时
- **数据容量**: 单页面<50KB

## 支持的模块类型

### 对话类
- userMessage - 用户消息气泡
- aiText - AI 回复文本
- aiHeading - AI 标题
- followUp - 追问文本

### 卡片类
- hotelCard - 酒店卡片
- flightCard - 机票卡片
- trainCard - 火车票卡片
- ticketCard - 门票卡片
- mapCard - 地图卡片

### 交互类
- suggestionPills - 建议胶囊按钮

## 常见问题

### Q: 为什么必须使用本地服务器？
A: 由于浏览器的安全策略，直接打开 HTML 文件会导致部分功能受限（如 Blob URL、localStorage 等）。使用本地服务器可以完全发挥所有功能。

### Q: 数据会丢失吗？
A: 所有数据都保存在浏览器的 localStorage 中，刷新页面不会丢失。但清除浏览器缓存会重置数据，建议定期备份重要页面。

### Q: 可以导出页面吗？
A: 可以使用编辑器的"下载页面"功能，将单个页面导出为独立的 HTML 文件。

### Q: 支持多人协作吗？
A: 当前版本不支持。每个用户的数据独立存储在本地。

### Q: 如何分享给他人？
A: 
1. 分享整个文件夹
2. 对方使用同样的工具打开
3. 或导出为独立 HTML 文件分享

## 更新日志

### v1.2.1 (2026-03-26)
- ✅ 修复 URL 过长导致 HTTP 414 错误
- ✅ 改用 localStorage 中转大数据
- ✅ 优化编辑功能数据加载

### v1.2.0 (2026-03-26)
- ✅ 新增页面复制功能
- ✅ 新增页面编辑功能
- ✅ 智能区分新增/编辑模式
- ✅ 添加操作按钮视觉反馈

### v1.1.0 (2026-03-26)
- ✅ 自定义保存对话框
- ✅ 页面尺寸配置
- ✅ 优雅的过渡动画
- ✅ 优化模块项宽度

### v1.0.0 (2026-03-25)
- ✅ 初始版本发布
- ✅ 基础画板功能
- ✅ 可视化编辑器
- ✅ 模块化设计

## 开发计划

### 短期（v1.3.x）
- [ ] 页面分组管理
- [ ] 撤销/重做功能
- [ ] 快捷键支持
- [ ] 批量操作

### 中期（v1.4.x）
- [ ] 导入导出项目包
- [ ] 更多预设模块
- [ ] 主题定制
- [ ] 模板市场

### 长期（v2.0.x）
- [ ] 云端同步
- [ ] 多人协作
- [ ] API 集成
- [ ] 插件系统

## 贡献指南

欢迎提交 Issue 和 Pull Request！

### 开发环境设置
```bash
git clone <repository-url>
cd 产品Demo工具
python -m http.server 8000
```

### 代码规范
- 使用 ES6+ 语法
- 保持代码注释
- 遵循现有代码风格
- 添加必要的错误处理

## 许可证

MIT License

## 联系方式

- 📧 Email: support@example.com
- 💬 Issues: GitHub Issues
- 📖 Docs: README.md

---

**Skill ID:** product-demo-builder  
**最后更新:** 2026-03-26  
**维护状态:** Active ✅
