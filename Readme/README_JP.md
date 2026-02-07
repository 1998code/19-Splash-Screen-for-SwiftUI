# SplashScreenKit
### SwiftUIのための新しいスプラッシュ画面

| Region | Languages |
| :--- | :--- |
| **Global** | [English](../README.md) |
| **Asia** | [廣東話](./README_HK.md) [繁體中文](./README_TW.md) [简体中文](./README_CN.md) [日本語](./README_JP.md) [한국어](./README_KR.md) [Indo](./README_ID.md) [हिन्दी](./README_HI.md) |
| **Europe** | [Français](./README_FR.md) [Deutsch](./README_DE.md) [Español](./README_ES.md) [Русский](./README_RU.md) [Polski](./README_PL.md) [Türkçe](./README_TR.md) |
| **ME & Africa** | [العربية](./README_AR.md) [Kiswahili](./README_SW.md) |

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## バージョン
**2.2.3 (安定版リリース)** <br>
*カクつきのない、高性能なインタラクションに最適化されています。*

- **シームレスな無限カルーセル:** 新しい仮想インデックスロジックにより「カードが飛んでいく」現象を防ぎ、スムーズな無限回転を保証します。
- **パフォーマンス最適化:** Metal加速レンダリング（`drawingGroup`）と`RunLoop`による効率的なフレーム更新。
- **慣性スクロール:** ネイティブの減速感を持つ、ベロシティベースの滑らかなインタラクティブジェスチャ。
- **AsyncImage サポート:** ラグのないリモート画像読み込みのための事前検証済みURL処理。
- **2つの表示モード:** 動的な `.carousel` モードとエレガントな `.static` レイアウトから選択可能。
- **高度なテキスト効果:** SwiftUI 6.0の機能を活用した美しいテキストレンダリングとトランジション。

## 環境 / テスト済み
- 📲 iOS 18.0以上必須
- Swift 6.0
- Xcode 16.0以上

## 使い方
パッケージをプロジェクトに追加してください: ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### カルーセルモード (デフォルト)
画像を回転させるクラシックなインタラクティブ体験。
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // リモートURLもサポート！
    ],
    title: "ようこそ",
    product: "Apple TV",
    caption: "すべての映画やテレビ番組などを閲覧できます。",
    cta: "今すぐ視聴"
) {
    print("アクションボタンがタップされました")
}
```

<img src="https://github.com/user-attachments/assets/28c8a5dc-cb8c-4aa4-b0a8-d7139ce3cefc" width="350" />

### スタティックモード (新規)
製品紹介に最適な、クリーンでスクロール可能なレイアウト。
```swift
SplashScreen(
    mode: .static,
    images: [Photo("https://url.to/header_image.jpg")],
    title: "クリエイタースタジオ",
    product: "クリエイタースタジオを3ヶ月間無料でご利用いただけます。",
    caption: "強力なアプリであなたのビジョンを形にしましょう。",
    features: [
        SplashFeature(title: "機能 1", icon: "video"),
        SplashFeature(title: "機能 2", icon: "waveform")
    ],
    footer: "利用規約が適用されます。",
    cta: "オファーを受け入れる",
    secondaryCta: "すべてのプランを表示",
    secondaryAction: {
        print("セカンダリアクションがタップされました")
    }
) {
    print("プライマリアクションがタップされました")
}
```

<img src="https://github.com/user-attachments/assets/44f9aeef-7906-4251-b338-f9504b30b278" width="350" />

## 既知の問題
- 最新のSwiftUI `TextRenderer` および視覚効果APIを活用しているため、iOS 18以降のみ対応しています。
- リサイズ: カルーセルモードはPro/Pro Maxに最適化されています。スタティックモードはScrollViewを含んでおり、より小さなデバイスや様々なコンテンツの長さに対応しています。

## 著作権
App Store Screenshots © 2025 Apple Inc.

## 参照
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## X (旧Twitter) の関連投稿
https://x.com/1998design/status/2019418746553790664 <br>
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## 組み合わせ
[SwiftNEWKit](https://github.com/1998code/SwiftNEWKit) と一緒に使うと、2倍の効果があります！
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## ライセンス
MIT

## サポート
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
