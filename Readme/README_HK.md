# SplashScreenKit
### SwiftUI 全新啟動頁面 (Splash Screen)

[English](../README.md) | [日本語](./README_JP.md) | [繁體中文](./README_TW.md) | [简体中文](./README_CN.md) | [한국어](./README_KR.md)

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## 版本
**2.2.0 (穩定版本)** <br>
*針對高性能互動優化，做到零卡頓。*

- **無縫無限輪播：** 全新虛擬索引邏輯，防止「卡片飛走」，確保無限旋轉順滑。
- **性能優化：** 採用 Metal 加速渲染 (`drawingGroup`) 同埋透過 `RunLoop` 進行高效嘅每幀更新。
- **動量捲動：** 絲滑般流暢、基於速度嘅互動手勢，有原生嘅減速感。
- **AsyncImage 支援：** 經過預先驗證嘅 URL 處理，實現無延遲嘅遠端圖片載入。
- **兩種顯示模式：** 可以喺動態嘅 `.carousel` 同優雅嘅 `.static` 佈局之間選擇。
- **高級文字效果：** 利用 SwiftUI 6.0 功能實現靚嘅文字渲染同過渡效果。

## 環境 / 測試平台
- 📲 需要 iOS 18.0+
- Swift 6.0
- Xcode 16.0+

## 點樣使用
將套件加落你個 Project： ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### 輪播模式 (預設)
經典嘅圖片旋轉互動體驗。
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // 支援遠端 URL！
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

### 靜態模式 (全新)
簡潔、可捲動嘅佈局，好啱做產品介紹。
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

## 已知問題
- 只支援 iOS 18+，利用咗最新嘅 SwiftUI `TextRenderer` 同視覺效果 API。
- 尺寸調整：輪播模式針對 Pro/Pro Max 優化。靜態模式包含 ScrollView，可以應付細機同埋唔同長度嘅內容。

## 版權
App Store 螢幕截圖 © 2025 Apple Inc.

## 參考
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## X 相關貼文
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## 組合推薦
配合 [SwiftNEWKit](https://github.com/1998code/SwiftNEWKit) 一齊用，效果加倍！
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## 許可證
MIT

## 贊助商
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
