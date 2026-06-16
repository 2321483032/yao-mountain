#!/bin/bash
# 瑶山仪式 - GitHub Pages 一键部署脚本
# 使用方法：
#   1. 在 GitHub 上生成 Personal Access Token (仅需 repo 权限)
#   2. 运行：./deploy-github.sh YOUR_TOKEN
#   3. 访问：https://YOUR_USERNAME.github.io/yao-mountain

set -e

TOKEN="$1"
REPO_NAME="yao-mountain"
USERNAME=$(curl -s -H "Authorization: token $TOKEN" https://api.github.com/user | grep '"login"' | cut -d'"' -f4)

if [ -z "$TOKEN" ]; then
    echo "❌ 请提供 GitHub Token"
    echo "用法: $0 YOUR_GITHUB_TOKEN"
    echo ""
    echo "获取 Token："
    echo "  1. 访问 https://github.com/settings/tokens"
    echo "  2. 点击 'Generate new token (classic)'"
    echo "  3. 勾选 'repo' 权限"
    echo "  4. 点击 'Generate token' 并复制"
    exit 1
fi

echo "🚀 开始部署到 GitHub Pages..."
echo "👤 用户: $USERNAME"

# 创建 GitHub 仓库
echo "📦 创建仓库 $REPO_NAME..."
curl -s -H "Authorization: token $TOKEN" \
     -d "{\"name\":\"$REPO_NAME\",\"description\":\"瑶山仪式音频播放网站\",\"homepage\":\"https://$USERNAME.github.io/$REPO_NAME\",\"public\":true}" \
     https://api.github.com/user/repos > /dev/null

# 添加远程仓库并推送
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null || true
git remote add origin "https://$USERNAME:$TOKEN@github.com/$USERNAME/$REPO_NAME.git"
git push -u origin main

# 启用 GitHub Pages
echo "🌐 启用 GitHub Pages..."
curl -s -X POST \
     -H "Authorization: token $TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     "https://api.github.com/repos/$USERNAME/$REPO_NAME/pages" \
     -d '{"source":{"branch":"main","path":"/"}}' > /dev/null

echo ""
echo "✅ 部署完成！"
echo "🔗 访问地址: https://$USERNAME.github.io/$REPO_NAME"
echo "📷 请用新地址重新生成二维码"
