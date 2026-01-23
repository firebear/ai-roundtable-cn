# AI 圆桌中国版 - Chrome Web Store 发布指南

## 发布前准备清单

### 1. 开发者账号准备

- [ ] 注册 Google 开发者账号
- [ ] 支付 $5 USD 注册费（一次性）
- [ ] 访问 [Chrome Web Store Developer Dashboard](https://chrome.google.com/webstore/devconsole)

### 2. 素材准备

- [ ] **图标检查**
  - [ ] `icons/icon16.png` (16x16px)
  - [ ] `icons/icon32.png` (32x32px)
  - [ ] `icons/icon48.png` (48x48px)
  - [ ] `icons/icon128.png` (128x128px) - **必需**

- [ ] **商店截图** (1280x800px 或 640x400px)
  - [ ] 截图1: 主界面展示
  - [ ] 截图2: 一键发送功能
  - [ ] 截图3: 交叉评价功能
  - [ ] 截图4: 响应对比视图
  - [ ] 截图5: 支持的平台列表

- [ ] **文档准备**
  - [x] 商店列表信息（参见 `发布/商店列表信息.md`）
  - [x] 隐私政策（参见 `发布/隐私政策.md`）

---

## 发布步骤

### 步骤 1: 打包扩展

在项目根目录执行：

```bash
./build-release.sh
```

或者手动打包：

```bash
zip -r release/ai-roundtable-cn-v0.6.4.zip \
  manifest.json \
  background.js \
  content/*.js \
  sidepanel/* \
  icons/* \
  _metadata \
  -x "*.git*" \
  -x "node_modules/*" \
  -x "release/*"
```

### 步骤 2: 上传到 Chrome Web Store

1. **登录开发者控制台**
   - 访问 https://chrome.google.com/webstore/devconsole
   - 使用 Google 账号登录

2. **新建项目**
   - 点击 "新建项目" (New Item)
   - 上传打包好的 ZIP 文件

3. **填写商店列表信息**

   **基本信息**:
   ```
   名称: AI 圆桌 中国版
   简短描述: 让多个 AI 助手围桌讨论，交叉评价，深度协作
   详细描述: （复制 发布/商店列表信息.md 中的详细描述）
   分类: 生产力工具
   语言: 中文
   ```

   **隐私实践**:
   ```
   - 不收集用户数据
   - 不使用第三方服务
   - 数据仅存储本地
   ```

   **权限说明**:
   - 填写 `发布/商店列表信息.md` 中的权限说明表格

4. **上传截图**
   - 至少上传 1 张截图
   - 建议上传 5 张截图，展示核心功能

5. **填写隐私政策**
   - 将 `发布/隐私政策.md` 的内容复制到隐私政策 URL 字段
   - 或者上传到 GitHub Pages 并填写 URL

6. **填写发布说明**
   ```
   首次发布版本 v0.6.4

   主要功能：
   - 一键向多个 AI 平台发送问题
   - 交叉评价和对比分析
   - 支持 DeepSeek、Kimi、ChatGLM、通义千问等国产 AI
   - 支持 Claude、ChatGPT、Gemini 等国际 AI
   ```

### 步骤 3: 提交审核

1. **检查清单**
   - [ ] 所有必填字段已完成
   - [ ] 至少上传 1 张截图
   - [ ] 隐私政策已填写
   - [ ] 权限说明清晰

2. **提交审核**
   - 点击 "提交审核" 按钮
   - 等待审核（通常 1-3 个工作日）

---

## 审核要点

### 可能被拒绝的原因及预防措施

| 原因 | 预防措施 |
|------|---------|
| 权限不明确 | 清楚说明每个权限的用途 |
| 缺少隐私政策 | 已提供详细的隐私政策文档 |
| 功能描述不准确 | 详细描述实际功能，不夸大 |
| 素材不符合规范 | 确保截图尺寸正确 |
| 代码质量问题 | 移除调试代码（可选，建议保留错误日志） |

---

## 审核通过后的维护

### 更新流程

1. **修改代码**
2. **更新版本号**（manifest.json）
3. **重新打包**（`./build-release.sh`）
4. **上传新版本**
5. **填写更新说明**
6. **发布更新**（通常无需审核，立即可用）

### 回应用户反馈

- 定期查看 Chrome Web Store 的评论和评分
- 在 GitHub Issues 回应用户问题
- 及时修复 bug

---

## 发布后推广建议

### 1. 优化商店页面

- 使用高质量截图
- 撰写吸引人的描述
- 添加演示视频（可选）

### 2. 社交媒体推广

- 在相关社区分享（知乎、掘金、V2EX 等）
- 发布使用教程文章
- 制作演示视频发布到 B站/YouTube

### 3. 开源社区

- 在 GitHub 积极维护项目
- 回应 Issues 和 PR
- 更新 README 和文档

### 4. SEO 优化

- 选择合适的关键词
- 添加中英文描述
- 确保名称易于搜索

---

## 联系信息

**项目主页**: https://github.com/firebear/ai-roundtable-cn
**问题反馈**: https://github.com/firebear/ai-roundtable-cn/issues

---

## 附录：文件清单

发布时需要包含在 ZIP 包中的文件：

```
ai-roundtable-cn/
├── manifest.json          # 必需：扩展清单
├── background.js          # 必需：后台服务
├── content/               # 必需：内容脚本
│   ├── claude.js
│   ├── chatgpt.js
│   ├── gemini.js
│   ├── deepseek.js
│   ├── kimi.js
│   ├── chatglm.js
│   └── qwen.js
├── sidepanel/            # 必需：侧边栏界面
│   ├── panel.html
│   ├── panel.js
│   └── panel.css
├── icons/                # 必需：图标
│   ├── icon16.png
│   ├── icon32.png
│   ├── icon48.png
│   └── icon128.png
└── _metadata/            # 可选：元数据
    └── verified_contents.json
```

**不要包含的文件/目录**:
- `.git/` - Git 版本控制
- `node_modules/` - 依赖包
- `发布/` - 发布文档（用户不需要）
- `README.md` 等 - 文档文件（用户不需要）
- `.gitignore` 等 - 开发文件

---

**祝发布顺利！** 🚀
