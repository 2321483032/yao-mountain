# 🌐 瑶山仪式 - 部署方案

## 方案一：GitHub Pages（推荐 ✅）

### 特点
- ✅ 完全免费，无限流量
- ✅ 全球 CDN，国内可访问
- ✅ 自动 HTTPS
- ✅ 稳定可靠（GitHub 基础设施）

### 部署步骤

#### 第 1 步：创建 GitHub 账号
1. 访问 [github.com](https://github.com)
2. 点击 "Sign up" 注册（用邮箱即可）
3. 验证邮箱

#### 第 2 步：创建仓库
1. 登录后点击右上角 `+` → `New repository`
2. 仓库名填：`yao-mountain`
3. 选择 `Public`
4. 勾选 `Add a README file`
5. 点击 `Create repository`

#### 第 3 步：上传文件
**方法 A：网页上传（最简单）**
1. 在仓库页面点击 `Add file` → `Upload files`
2. 把以下文件拖进去：
   - `index.html`
   - `audio.mp3`
   - `qrcode.png`
3. 点击 `Commit changes`

**方法 B：Git 命令行（推荐）**
```bash
# 在项目目录运行
cd yao-mountain
git remote add origin https://github.com/YOUR_USERNAME/yao-mountain.git
git branch -M main
git push -u origin main
```

#### 第 4 步：开启 Pages
1. 进入仓库 → `Settings` → `Pages`
2. `Source` 选择 `Deploy from a branch`
3. `Branch` 选择 `main` / `/ (root)`
4. 点击 `Save`
5. 等待 1-2 分钟

#### 第 5 步：获得地址
```
https://YOUR_USERNAME.github.io/yao-mountain
```

---

## 方案二：Cloudflare Pages（国内速度最佳 ⚡）

### 特点
- ✅ 完全免费
- ✅ 国内访问速度极快（Cloudflare 中国节点）
- ✅ 自动 HTTPS + CDN
- ✅ 支持自定义域名

### 部署步骤

#### 第 1 步：准备 GitHub 仓库
> Cloudflare Pages 需要从 GitHub 拉取代码，所以先完成**方案一的第 1-3 步**

#### 第 2 步：注册 Cloudflare
1. 访问 [pages.cloudflare.com](https://pages.cloudflare.com)
2. 点击 `Log in` / `Sign up`
3. 用邮箱注册（免费）

#### 第 3 步：创建项目
1. 进入 Cloudflare Pages 控制台
2. 点击 `Create a project`
3. 连接 GitHub 账号（授权）
4. 选择 `yao-mountain` 仓库
5. 配置：
   - `Project name`: `yao-mountain`
   - `Production branch`: `main`
   - `Build command`: **留空**（纯静态网站无需构建）
   - `Build output directory`: `/`（根目录）
6. 点击 `Save and Deploy`

#### 第 4 步：获得地址
```
https://yao-mountain.PAGES.dev
```

#### （可选）第 5 步：绑定自定义域名
1. 在 Cloudflare Pages 项目设置里点击 `Custom domains`
2. 添加你的域名（如 `yao.example.com`）
3. 按提示修改 DNS 记录

---

## 📷 重新生成二维码

部署完成后，用新地址重新生成二维码：

### 方法 1：在线生成（最快）
访问 [cli.im/qr](https://cli.im/qr) 或 [qrcode.tec-it.com](https://qrcode.tec-it.com)，输入新地址即可

### 方法 2：用 Python 本地生成
```bash
cd yao-mountain
python -c "
import qrcode
from PIL import Image, ImageDraw, ImageFont

url = 'https://YOUR_USERNAME.github.io/yao-mountain'
qr = qrcode.QRCode(version=5, error_correction=qrcode.constants.ERROR_CORRECT_H, box_size=12, border=4)
qr.add_data(url)
img = qr.make_image(fill_color='#1a1a2e', back_color='#ffffff').convert('RGB')
img.save('qrcode-new.png')
print('Done!')
"
```

### 方法 3：网页自动生成
网站 `index.html` 已内置二维码生成功能，访问页面后：
1. 页面会自动显示当前 URL 的二维码
2. 右键保存二维码图片即可分享

---

## 🚀 快速决策表

| 需求 | 推荐方案 |
|------|----------|
| 最快部署（5分钟） | GitHub Pages |
| 国内访问最快 | Cloudflare Pages |
| 自定义域名 | Cloudflare Pages |
| 最稳定 | GitHub Pages |
| 最简单 | GitHub Pages（网页上传） |

---

## 📦 文件清单

确保以下文件都已上传：
```
yao-mountain/
├── index.html      ✅ 主页面
├── audio.mp3       ✅ 音频文件
├── qrcode.png      ✅ 静态二维码
└── README.md       ✅ 说明文档
```

---

## ❓ 常见问题

**Q：GitHub Pages 在国内能访问吗？**
A：可以，但偶尔速度较慢。建议搭配 CDN 使用，或者用 Cloudflare Pages。

**Q：音频文件 5.7MB 会不会太大？**
A：不会。GitHub 单文件限制 100MB，完全够用。首次加载可能需等待 2-3 秒。

**Q：能绑定自己的域名吗？**
A：可以。GitHub Pages 和 Cloudflare Pages 都支持自定义域名。

**Q：免费版有流量限制吗？**
A：GitHub Pages 每月 100GB 流量（个人网站完全够用）。Cloudflare Pages 无明确限制。
