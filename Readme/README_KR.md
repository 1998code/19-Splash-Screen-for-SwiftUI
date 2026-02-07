# SplashScreenKit
### SwiftUI를 위한 새로운 스플래시 화면

| [English](../README.md) | [廣東話](./README_HK.md) | [繁體中文](./README_TW.md) | [简体中文](./README_CN.md) | [日本語](./README_JP.md) | [한국어](./README_KR.md) | [Français](./README_FR.md) | [Deutsch](./README_DE.md) | [Español](./README_ES.md) | [Русский](./README_RU.md) | [Indo](./README_ID.md) | [हिन्दी](./README_HI.md) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## 버전
**2.2.1 (안정화 버전)** <br>
*끊김 없는 고성능 상호작용을 위해 최적화되었습니다.*

- **원활한 무한 캐러셀:** 새로운 가상 인덱스 로직으로 "카드가 튀는" 현상을 방지하고 매끄러운 무한 회전을 보장합니다.
- **성능 최적화:** Metal 가속 렌더링(`drawingGroup`) 및 `RunLoop`를 통한 효율적인 프레임별 업데이트.
- **모멘텀 스크롤링:** 네이티브 감속감을 갖춘 부드러운 속도 기반 대화형 제스처.
- **AsyncImage 지원:** 지연 없는 원격 이미지 로딩을 위한 사전 검증된 URL 처리.
- **두 가지 디스플레이 모드:** 역동적인 `.carousel` 모드와 우아한 `.static` 레이아웃 중에서 선택 가능.
- **고급 텍스트 효과:** SwiftUI 6.0 기능을 사용한 아름다운 텍스트 렌더링 및 전환.

## 환경 / 테스트 완료
- 📲 iOS 18.0 이상 필요
- Swift 6.0
- Xcode 16.0 이상

## 사용 방법
프로젝트에 패키지를 추가하세요: ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### 캐러셀 모드 (기본값)
이미지가 회전하는 클래식한 대화형 경험.
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // 원격 URL 지원!
    ],
    title: "환영합니다",
    product: "Apple TV",
    caption: "모든 영화, TV 프로그램 등을 검색해 보세요。",
    cta: "지금 시청하기"
) {
    print("액션 버튼 클릭됨")
}
```

<img src="https://github.com/user-attachments/assets/28c8a5dc-cb8c-4aa4-b0a8-d7139ce3cefc" width="350" />

### 정적 모드 (신규)
제품 소개에 완벽한 깨끗하고 스크롤 가능한 레이아웃.
```swift
SplashScreen(
    mode: .static,
    images: [Photo("https://url.to/header_image.jpg")],
    title: "크리에이터 스튜디오",
    product: "크리에이터 스튜디오 3개월 무료 체험。",
    caption: "강력한 앱으로 당신의 비전을 현실로 만드세요。",
    features: [
        SplashFeature(title: "기능 1", icon: "video"),
        SplashFeature(title: "기능 2", icon: "waveform")
    ],
    footer: "이용 약관이 적용됩니다。",
    cta: "혜택 받기",
    secondaryCta: "모든 요금제 보기",
    secondaryAction: {
        print("보조 액션 클릭됨")
    }
) {
    print("기본 액션 클릭됨")
}
```

<img src="https://github.com/user-attachments/assets/44f9aeef-7906-4251-b338-f9504b30b278" width="350" />

## 알려진 문제
- 최신 SwiftUI `TextRenderer` 및 시각 효과 API를 활용하므로 iOS 18 이상만 호환됩니다.
- 크기 조정: 캐러셀 모드는 Pro/Pro Max에 최적화되어 있습니다. 정적 모드에는 작은 기기와 다양한 콘텐츠 길이를 처리하기 위한 ScrollView가 포함되어 있습니다.

## 저작권
App Store Screenshots © 2025 Apple Inc.

## 참조
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## X 관련 게시물
https://x.com/1998design/status/2019418746553790664 <br>
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## 조합
[SwiftNEWKit](https://github.com/1998code/SwiftNEWKit)과 함께 사용하면 효과가 2배가 됩니다!
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## 라이선스
MIT

## 후원
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
