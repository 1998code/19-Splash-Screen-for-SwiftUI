# SplashScreenKit
### SwiftUI 全新啟動頁面 (Splash Screen)

| [English](../README.md) | [廣東話](./README_HK.md) | [繁體中文](./README_TW.md) | [简体中文](./README_CN.md) | [日本語](./README_JP.md) | [한국어](./README_KR.md) | [Français](./README_FR.md) | [Deutsch](./README_DE.md) | [Español](./README_ES.md) | [Русский](./README_RU.md) | [Indo](./README_ID.md) | [हिन्दी](./README_HI.md) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## 版本
**2.2.1 (穩定版本)** <br>
*針對高性能互動進行了優化，零卡頓體驗。*

- **無縫無限輪播：** 全新的虛擬索引邏輯可防止「卡片飛走」並確保流暢的無限旋轉。
- **性能優化：** 採用 Metal 加速渲染 (`drawingGroup`) 以及透過 `RunLoop` 進行高效的每幀更新。
- **動量捲動：** 絲滑般流暢、基於速度的互動手勢，具備原生減速感。
- **AsyncImage 支援：** 經過預驗證的 URL 處理，實現無延遲的遠端圖片載入。
- **兩種顯示模式：** 可在動態的 `.carousel` 和優雅的 `.static` 佈局之間選擇。
- **高級文字效果：** 利用 SwiftUI 6.0 功能實現美觀的文字渲染和過渡效果。

## 環境 / 測試平台
- 📲 需要 iOS 18.0+
- Swift 6.0
- Xcode 16.0+

## 如何使用
將套件新增至您的專案： ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### 輪播模式 (預設)
經典的圖片旋轉互動體驗。
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // 支援遠端 URL！
    ],
    title: "歡迎使用",
    product: "Apple TV",
    caption: "流覽所有電影、電視節目等。",
    cta: "立即觀看"
) {
    print("按鈕被點擊")
}
```

<img src="https://github.com/user-attachments/assets/28c8a5dc-cb8c-4aa4-b0a8-d7139ce3cefc" width="350" />

### 靜態模式 (全新)
簡潔、可捲動的佈局，非常適合產品介紹。
```swift
SplashScreen(
    mode: .static,
    images: [Photo("https://url.to/header_image.jpg")],
    title: "創作者工作室",
    product: "免費試用 3 個月創作者工作室。",
    caption: "透過功能強大的應用程式將您的願景變為現實。",
    features: [
        SplashFeature(title: "功能 1", icon: "video"),
        SplashFeature(title: "功能 2", icon: "waveform")
    ],
    footer: "適用條款與條件。",
    cta: "接受優惠",
    secondaryCta: "查看所有方案",
    secondaryAction: {
        print("次要動作被點擊")
    }
) {
    print("主要動作被點擊")
}
```

<img src="https://github.com/user-attachments/assets/44f9aeef-7906-4251-b338-f9504b30b278" width="350" />

## 已知問題
- 僅支援 iOS 18+，利用了最新的 SwiftUI `TextRenderer` 和視覺效果 API。
- 尺寸調整：輪播模式針對 Pro/Pro Max 進行了優化。靜態模式包含 ScrollView 以處理較小的裝置和不同的內容長度。

## 版權
App Store 螢幕截圖 © 2025 Apple Inc.

## 參考
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## X 上的相關貼文
https://x.com/1998design/status/2019418746553790664 <br>
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## 組合推薦
配合 [SwiftNEWKit](https://github.com/1998code/SwiftNEWKit) 同時使用，效果翻倍！
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## 許可證
MIT

## 贊助商
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
