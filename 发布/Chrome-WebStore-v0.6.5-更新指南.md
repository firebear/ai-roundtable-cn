# Chrome Web Store - v0.6.5 更新指南

## 📋 本次更新说明

**版本**: v0.6.5
**更新类型**: 权限修复（响应审核拒绝）
**更新日期**: 2026年1月23日

### 更新原因
v0.6.4 版本被 Chrome Web Store 拒绝，理由：
> 请求但不使用以下权限：scripting

### 修复内容
- ✅ 移除未使用的 `scripting` 权限
- ✅ 移除未使用的 `activeTab` 权限
- ✅ 保留 3 个必需权限：`sidePanel`、`tabs`、`storage`

---

## 🚀 更新步骤

### 1. 访问 Chrome Web Store Developer Dashboard

访问：https://chrome.google.com/webstore/devconsole

### 2. 选择现有项目

找到 "AI 圆桌 中国版" 项目，点击进入。

### 3. 上传新版本包

1. 在 **Package** 标签页
2. 点击 **Upload new package** 或 **更新包**
3. 选择文件：`release/ai-roundtable-cn-v0.6.5.zip` (64KB)
4. 上传后系统会自动检测版本号变更

### 4. 填写更新说明（如果要求）

在 **Store Listing** 标签页，**更新日志**（Changelog）部分：

```
v0.6.5 - 权限优化

- 移除未使用的权限以符合 Chrome Web Store 要求
- 所有功能保持不变，仅优化权限配置
```

### 5. 隐私权设置（Privacy Practices）

系统会重新检测权限，由于权限已变更，需要重新填写隐私权说明。

#### 5.1 单一用途说明（Single Purpose Description）

```
让用户同时向多个 AI 平台发送问题，并在侧边栏集中查看所有 AI 的响应。
```

#### 5.2 权限说明（Permissions Justification）

扩展现在只有 3 个权限，每个权限单独填写：

**sidePanel**:
```
提供侧边栏界面，让用户可以同时查看和管理多个 AI 平台的对话。
```

**tabs**:
```
查询标签页 URL 以检测哪些 AI 平台已被用户打开，并在侧边栏显示连接状态。不读取页面内容。
```

**storage**:
```
在用户本地浏览器中临时存储 AI 响应内容，方便对比查看。所有数据仅存储在本地，不上传服务器。
```

#### 5.3 数据使用认证（Data Usage）

确保以下选项正确勾选：

- ✅ 此扩展**不**收集用户数据
- ✅ 此扩展**不**与第三方共享用户数据
- ✅ 此扩展**不**使用远程代码
- ✅ 用户可以控制数据（在发送前可以编辑内容）

### 6. 提交审核

1. 检查所有设置是否正确
2. 点击 **Submit for Review**（提交审核）
3. 确认提交

---

## ⚠️ 重要提示

### 关于权限变更

Chrome Web Store 系统会自动检测到以下变更：

| 变更类型 | 权限名称 | 变更说明 |
|---------|---------|---------|
| ❌ 移除 | `scripting` | 未使用的权限 |
| ❌ 移除 | `activeTab` | 未使用的权限 |
| ✅ 保留 | `sidePanel` | 必需权限 |
| ✅ 保留 | `tabs` | 必需权限 |
| ✅ 保留 | `storage` | 必需权限 |

### 为什么不需要 scripting 和 activeTab？

**不需要 scripting**:
- Content scripts 通过 `manifest.json` 中的 `content_scripts` 字段**静态声明注入**
- 不需要使用 `chrome.scripting.executeScript` 动态注入

**不需要 activeTab**:
- `chrome.tabs.sendMessage()` 只需要 `tabs` 权限
- 不需要在用户点击扩展图标时临时访问当前标签页

### 代码验证

Chrome Web Store 审核团队会验证代码中是否使用了这些权限：

```javascript
// ✅ 使用的 API
chrome.sidePanel.open()
chrome.sidePanel.setPanelBehavior()
chrome.tabs.query()
chrome.tabs.sendMessage()
chrome.storage.session.get()
chrome.storage.session.set()

// ❌ 不使用的 API（已移除权限）
chrome.scripting.executeScript()  // 不存在
chrome.scripting.insertCSS()      // 不存在
```

---

## 📊 审核预期

### 审核周期
- 通常：1-3 个工作日

### 可能的结果

#### ✅ 通过
扩展将更新到 v0.6.5 版本，已安装的用户会自动收到更新。

#### ⏳ 需要补充说明
审核员可能会询问：
- 为什么要移除这两个权限？
  - **回答**：代码检查后发现这两个权限确实未被使用，content scripts 通过 manifest.json 静态声明注入，不需要 scripting 权限。

#### ❌ 再次拒绝
如果再次拒绝，请：
1. 记录拒绝理由
2. 联系开发者修复

---

## 📁 相关文件

| 文件 | 用途 |
|------|------|
| `release/ai-roundtable-cn-v0.6.5.zip` | 上传到 Chrome Web Store 的包 |
| `manifest.json` | 权限配置（已更新） |
| `发布/Chrome-WebStore-隐私权说明.md` | 隐私权填写参考 |
| `版本日志.md` | 版本更新记录 |

---

## 🔧 技术说明（供审核团队参考）

### Content Scripts 注入方式

本项目使用 **静态声明注入**，不需要 scripting 权限：

```json
{
  "content_scripts": [
    {
      "matches": ["https://claude.ai/*"],
      "js": ["content/claude.js"],
      "run_at": "document_idle"
    }
  ]
}
```

### 与动态注入的区别

| 注入方式 | 需要权限 | 本项目 |
|---------|---------|--------|
| 静态声明（manifest.json） | ❌ 不需要 scripting | ✅ 使用这种方式 |
| 动态注入（chrome.scripting） | ✅ 需要 scripting | ❌ 不使用 |

---

**祝审核顺利！** 🍀

如有任何问题，请参考：
- Chrome Web Store 政策：https://developer.chrome.com/docs/webstore/program-policies/
- Manifest V3 权限文档：https://developer.chrome.com/docs/extensions/mv3/manifest/
