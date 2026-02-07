# SplashScreenKit
### SwiftUI 全新启动页 (Splash Screen)

[English](../README.md) | [日本語](./README_JP.md) | [繁體中文](./README_TW.md) | [香港粵語](./README_HK.md) | [한국어](./README_KR.md)

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## 版本
**2.2.0 (稳定版本)** <br>
*针对高性能交互进行了优化，确保零卡顿体验。*

- **无缝无限轮播：** 全新的虚拟索引逻辑，防止“卡片飞走”并确保流畅的无限旋转。
- **性能优化：** 采用 Metal 加速渲染 (`drawingGroup`) 以及通过 `RunLoop` 进行高效的每帧更新。
- **动量滚动：** 丝滑般流畅、基于速度的交互手势，具备原生减速感。
- **AsyncImage 支持：** 经过预验证的 URL 处理，实现无延迟的远程图片加载。
- **两种显示模式：** 可在动态的 `.carousel` 和优雅的 `.static` 布局之间选择。
- **高级文字效果：** 利用 SwiftUI 6.0 功能实现美观的文字渲染和过渡效果。

## 环境 / 测试平台
- 📲 需要 iOS 18.0+
- Swift 6.0
- Xcode 16.0+

## 如何使用
將套件新增至您的專案： ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### 轮播模式 (默认)
经典的图片旋转交互体验。
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // 支持远程 URL！
    ],
    title: "Welcome to",
    product: "Apple TV",
    caption: "Browse all movies, TV shows, and more.",
    cta: "Watch Now"
) {
    print("Action Button Tapped")
}
```

<img src="https://github.com/user-attachments/assets/28c8a5dc-cb8c-4aa4-b0a8-d7139ce3cefc" width="350" />

### 静态模式 (全新)
简洁、可滚动的布局，非常适合产品介绍。
```swift
SplashScreen(
    mode: .static,
    images: [Photo("https://url.to/header_image.jpg")],
    title: "Creator Studio",
    product: "3 months of Creator Studio for free.",
    caption: "Bring your vision to life with powerful apps.",
    features: [
        SplashFeature(title: "Feature 1", icon: "video"),
        SplashFeature(title: "Feature 2", icon: "waveform")
    ],
    footer: "Terms and conditions apply.",
    cta: "Accept Offer",
    secondaryCta: "See All Plans",
    secondaryAction: {
        print("Secondary action tapped")
    }
) {
    print("Primary action tapped")
}
```

<img src="https://github.com/user-attachments/assets/44f9aeef-7906-4251-b338-f9504b30b278" width="350" />

## 已知问题
- 仅支持 iOS 18+，利用了最新的 SwiftUI `TextRenderer` 和视觉效果 API。
- 尺寸调整：轮播模式针对 Pro/Pro Max 进行了优化。静态模式包含 ScrollView 以处理较小的设备和不同的内容长度。

## 版权
App Store 屏幕截图 © 2025 Apple Inc.

## 参考
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## X 上的相关贴文
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## 组合推荐
配合 [SwiftNEWKit](https://github.com/1998code/SwiftNEWKit) 同时使用，效果翻倍！
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## 许可证
MIT

## 赞助
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
