# AI 圆桌中国版 v0.6.4 发布

## 🎉 首次发布 Chrome Web Store

v0.6.4 版本已准备就绪，即将提交到 Chrome Web Store 审核！

---

## ✨ 本版本更新

### 修复内容
- ✅ 移除通义千问首页域名（tongyi.aliyun.com）
- ✅ 只保留聊天工具域名（www.qianwen.com）
- ✅ 更新所有相关文档和配置

### 修改文件
- `background.js` - URL 模式配置
- `manifest.json` - host_permissions 和 content_scripts
- `sidepanel/panel.js` - 连接 URL 和检测逻辑
- `README.md`、`版本日志.md`、`添加国产大模型指南.md`、`重新加载指南.md` - 文档更新

---

## 🚀 核心功能

### 🎯 一键发送
同时向多个 AI 平台发送问题，节省时间

### 🔄 交叉评价
让 AI 互相评价、对比观点，发现盲点

### 💬 深度讨论
支持多轮对话，逐步深入探索问题

### 📊 智能对比
集中查看所有 AI 的回答，快速对比分析

---

## 🤖 支持的 AI 平台

### 🇨🇳 国产 AI
- **DeepSeek** - 深度求索，强大推理能力
- **Kimi** - 月之暗面，长文本处理专家
- **ChatGLM** - 智谱 AI，中文理解出色
- **通义千问** - 阿里云，全能助手

### 🌍 国际 AI
- **Claude** - Anthropic，安全可靠
- **ChatGPT** - OpenAI，全能助手
- **Gemini** - Google，多模态强大

---

## 📦 安装方式

### Chrome Web Store（推荐）
等待审核通过后，可在 Chrome Web Store 搜索"AI 圆桌中国版"安装

### 开发者模式安装
```bash
# 1. 下载发布包
wget https://github.com/firebear/ai-roundtable-cn/releases/download/v0.6.4/ai-roundtable-cn-v0.6.4.zip

# 2. 解压
unzip ai-roundtable-cn-v0.6.4.zip

# 3. 在 Chrome 中加载
# 打开 chrome://extensions/
# 启用"开发者模式"
# 点击"加载已解压的扩展程序"
# 选择解压后的文件夹
```

---

## 🔒 隐私承诺

- ✅ 不收集任何用户数据
- ✅ 不上传到第三方服务器
- ✅ 所有数据仅存储在本地
- ✅ 开源透明，代码可审查

---

## 📖 使用指南

### 快速开始

1. **打开 AI 平台**
   - 在不同标签页打开您使用的 AI 平台
   - 支持：DeepSeek、Kimi、ChatGLM、通义千问、Claude、ChatGPT、Gemini

2. **启动扩展**
   - 点击扩展图标打开侧边栏

3. **发送问题**
   - 在输入框中输入问题
   - 选择要发送的 AI（可多选）
   - 点击"发送"按钮

4. **查看响应**
   - 侧边栏自动显示所有 AI 的响应
   - 可进行对比分析

### 高级功能

#### @ 引用功能
在消息中输入 `@` 可以引用其他 AI 的响应：
```
请评价 @Claude 的观点，指出有什么可以改进的？
```

#### 交叉评价
使用预设的提示词：
- `评价一下` - 让 AI 评价其他 AI 的观点
- `有什么值得借鉴的` - 学习其他 AI 的优点
- `批评一下，指出问题` - 批判性评价
- `有什么遗漏需要补充` - 查漏补缺
- `对比一下你的观点` - 对比观点差异

---

## 🛠️ 技术细节

- **Manifest 版本**: V3
- **最低 Chrome 版本**: 114+
- **权限**: sidePanel, activeTab, tabs, storage, scripting
- **开源协议**: MIT

---

## 📝 更新日志

### v0.6.4 (2026-01-22)
- 修复：通义千问只使用 www.qianwen.com（移除首页域名）

### v0.6.3 (2026-01-22)
- 新增：添加底部版本号显示

### v0.5.4 (2026-01-22)
- 优化：DeepSeek 实现完全自动化发送
- 优化：国产 AI 模型优先显示
- 新增：所有 AI 模型的品牌主色

---

## 🙏 致谢

感谢所有参与测试和反馈的用户！

特别感谢以下开源项目：
- Chrome Extensions API
- 各大 AI 平台提供的优质服务

---

## 📮 反馈渠道

- **GitHub Issues**: https://github.com/firebear/ai-roundtable-cn/issues
- **项目主页**: https://github.com/firebear/ai-roundtable-cn

---

## 🔗 相关链接

- **Chrome Web Store**: （审核中）
- **GitHub 仓库**: https://github.com/firebear/ai-roundtable-cn
- **使用文档**: https://github.com/firebear/ai-roundtable-cn/blob/main/README.md
- **隐私政策**: https://github.com/firebear/ai-roundtable-cn/blob/main/发布/隐私政策.md

---

**让 AI 助手们成为您的智囊团，开启协作智能新时代！** 🚀
