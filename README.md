# 瑶山仪式 - Yao Mountain Ritual

一个优雅的音频播放网站，配备中国水墨山水风格界面和微信扫码功能。

## 项目结构

```
yao-mountain/
├── index.html      # 主页面（包含音频播放器和动态二维码）
├── audio.mp3       # 音频文件
├── qrcode.png      # 分享二维码图片
└── README.md       # 本说明文件
```

## 访问方式

### 当前公网访问地址
🔗 **https://bb6eca56201f880f-113-56-201-43.serveousercontent.com**

> 注意：此地址基于临时隧道，可能会断开。如需永久访问，请参考下方的部署建议。

### 本地预览
在本地启动 HTTP 服务器后访问：
```bash
cd yao-mountain
python -m http.server 8080
# 然后打开 http://localhost:8080
```

## 微信扫码分享

网站生成了二维码供用户扫描：
- 访问网站后，页面会自动显示二维码
- 也可直接使用 `qrcode.png` 图片进行分享
- 二维码指向当前访问的网址，便于分享给朋友

## 部署建议

由于当前使用的是临时隧道，建议部署到以下稳定的中国境内服务：

### 推荐方案

1. **腾讯云 CloudBase (云开发)**
   - 支持静态网站托管
   - 在中国大陆访问速度快
   - 支持自定义域名和 HTTPS

2. **阿里云 OSS + CDN**
   - 静态网站托管
   - 国内多节点加速
   - 支持自定义域名

3. **腾讯云 COS + CDN**
   - 对象存储静态网站
   - 搭配 CDN 加速
   - 性价比好

4. **GitHub Pages + 国内加速**
   - 免费静态托管
   - 可通过国内 CDN 或镜像加速访问

5. **Vercel / Netlify**
   - 全球 CDN
   - 在中国大陆可能有偶尔不稳定的情况

### 部署步骤（以腾讯云 CloudBase 为例）

1. 访问 [腾讯云 CloudBase 控制台](https://console.cloud.tencent.com/tcb)
2. 创建环境并进入静态网站托管
3. 上传 `index.html`、`audio.mp3` 和 `qrcode.png`
4. 获得访问地址
5. 生成新的二维码指向该地址

## 功能特性

- 🎵 HTML5 音频播放，支持手机浏览器
- 📱 自适应移动端和桌面端
- 🎨 中国水墨山水风格设计
- 📷 内置二维码生成，方便微信分享
- 🔗 动态二维码（根据访问地址自动生成）
- ✨ 飘浮粒子动画效果
- 🌙 夜晚山脉背景

## 技术栈

- HTML5 Audio API
- CSS3 动画与渐变
- SVG 矢量图形（山水背景）
- [QRCode.js](https://github.com/davidshimjs/qrcodejs) - 二维码生成
- Python qrcode - 静态二维码生成

## 注意事项

1. 音频文件较大（5.7MB），请确保服务器带宽充足
2. 首次加载可能需要等待音频缓冲
3. 建议使用 Chrome、Safari 或微信内置浏览器访问
4. 如需支持微信分享卡片，需要在网页中添加微信 JS-SDK 配置

## 致谢

瑶山仪式 - 一段与自然共鸣的音频体验
