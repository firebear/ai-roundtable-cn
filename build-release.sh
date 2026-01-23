#!/bin/bash

# AI 圆桌中国版 - 扩展打包脚本
# 用于生成 Chrome Web Store 发布包

set -e

VERSION=$(grep -m 1 '"version"' manifest.json | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')
PACKAGE_NAME="ai-roundtable-cn-v${VERSION}.zip"
OUTPUT_DIR="release"

echo "🔨 开始打包 AI 圆桌中国版..."
echo "📦 版本: ${VERSION}"

# 创建输出目录
mkdir -p "${OUTPUT_DIR}"

# 清理之前的打包文件
if [ -f "${OUTPUT_DIR}/${PACKAGE_NAME}" ]; then
    echo "🗑️  删除旧版本: ${PACKAGE_NAME}"
    rm "${OUTPUT_DIR}/${PACKAGE_NAME}"
fi

# 打包扩展
echo "📦 正在打包..."
zip -r "${OUTPUT_DIR}/${PACKAGE_NAME}" \
    manifest.json \
    background.js \
    content/*.js \
    sidepanel/* \
    icons/* \
    _metadata \
    -x "*.git*" \
    -x "*~" \
    -x "*.swp" \
    -x ".DS_Store" \
    -x "node_modules/*" \
    -x "release/*" \
    -x ".git/*"

# 计算文件大小
FILE_SIZE=$(du -h "${OUTPUT_DIR}/${PACKAGE_NAME}" | cut -f1)
FILE_COUNT=$(unzip -l "${OUTPUT_DIR}/${PACKAGE_NAME}" | tail -1 | awk '{print $2}')

echo ""
echo "✅ 打包完成！"
echo "📄 文件: ${OUTPUT_DIR}/${PACKAGE_NAME}"
echo "📊 大小: ${FILE_SIZE}"
echo "📁 包含文件数: ${FILE_COUNT}"
echo ""
echo "📤 提示: 上传 ${PACKAGE_NAME} 到 Chrome Web Store Developer Dashboard"
echo "🔗 https://chrome.google.com/webstore/devconsole"
