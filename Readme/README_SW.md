# SplashScreenKit
### Skrini Mpya ya Kukaribisha kwa SwiftUI

| Region | Languages |
| :--- | :--- |
| **Global** | [English](../README.md) |
| **Asia** | [廣東話](./README_HK.md) [繁體中文](./README_TW.md) [简体中文](./README_CN.md) [日本語](./README_JP.md) [한국어](./README_KR.md) [Indo](./README_ID.md) [हिन्दी](./README_HI.md) |
| **Europe** | [Français](./README_FR.md) [Deutsch](./README_DE.md) [Español](./README_ES.md) [Русский](./README_RU.md) [Polski](./README_PL.md) [Türkçe](./README_TR.md) |
| **ME & Africa** | [العربية](./README_AR.md) [Kiswahili](./README_SW.md) |

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## Toleo
**2.2.3 (Toleo Imara)** <br>
*Imeboreshwa kwa mwingiliano wa utendaji wa juu bila kukwama.*

- **Carousel Isiyo na Mwisho Iliyolainika:** Mantiki mpya ya faharisi ya mtandao huzuia "kadi zinazoruka" na kuhakikisha mzunguko usio na mwisho laini.
- **Utendaji Ulioboreshwa:** Utoaji unaoharakishwa na Metal (`drawingGroup`) na sasisho bora za kila fremu kupitia `RunLoop`.
- **Scrolling ya Momentum:** Ishara za maingiliano laini kulingana na kasi na hisia ya asili ya kupunguza kasi.
- **Usaidizi wa AsyncImage:** Ushughulikiaji wa URL uliothibitishwa mapema kwa upakiaji wa picha za mbali bila kuchelewa.
- **Njia Mbili za Kuonyesha:** Chagua kati ya mipangilio ya `.carousel` inayobadilika na `.static` ya kifahari.
- **Athari za Maandishi ya Juu:** Utoaji wa maandishi mzuri na mabadiliko kwa kutumia vipengele vya SwiftUI 6.0.

## Mazingira / Imejaribiwa kwenye
- 📲 iOS 18.0+ inahitajika
- Swift 6.0
- Xcode 16.0+

## Jinsi ya kutumia
Ongeza kifurushi kwenye mradi wako: ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### Hali ya Carousel (Chaguo-msingi)
Uzoefu wa kawaida wa maingiliano na picha zinazozunguka.
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // URL za mbali zinaungwa mkono!
    ],
    title: "Karibu kwenye",
    product: "Apple TV",
    caption: "Vinjari sinema zote, vipindi vya TV, na zaidi.",
    cta: "Tazama Sasa"
) {
    print("Kitufe cha Hatua Kimebonyezwa")
}
```

<img src="https://github.com/user-attachments/assets/28c8a5dc-cb8c-4aa4-b0a8-d7139ce3cefc" width="350" />

### Hali Tuli (MPYA)
Mpangilio safi, unaoweza kusogea unaofaa kwa utangulizi wa bidhaa.
```swift
SplashScreen(
    mode: .static,
    images: [Photo("https://url.to/header_image.jpg")],
    title: "Studio ya Muundaji",
    product: "Miezi 3 ya Studio ya Muundaji bila malipo.",
    caption: "Fanya maono yako yawe hai na programu zenye nguvu.",
    features: [
        SplashFeature(title: "Kipengele 1", icon: "video"),
        SplashFeature(title: "Kipengele 2", icon: "waveform")
    ],
    footer: "Vigezo na masharti yanatumika.",
    cta: "Kubali Ofa",
    secondaryCta: "Angalia Mipango Yote",
    secondaryAction: {
        print("Hatua ya sekondari imebonyezwa")
    }
) {
    print("Hatua ya msingi imebonyezwa")
}
```

<img src="https://github.com/user-attachments/assets/44f9aeef-7906-4251-b338-f9504b30b278" width="350" />

## Masuala Yanayojulikana
- Inatumika tu na iOS 18+, ikitumia API za hivi karibuni za SwiftUI `TextRenderer` na athari za kuona.
- Kubadilisha ukubwa: Njia ya Carousel imeboreshwa kwa Pro/Pro Max. Njia tuli inajumuisha ScrollView ili kushughulikia vifaa vidogo na urefu tofauti wa maudhui.

## Hakimiliki
Picha za skrini za App Store © 2025 Apple Inc.

## Rejea
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## Machapisho Husika kwenye X
https://x.com/1998design/status/2019418746553790664 <br>
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## Mchanganyiko
Tumia [SwiftNEWKit](https://github.com/1998code/SwiftNEWKit) pamoja, ufanisi wa 2X!
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## Leseni
MIT

## Inasaidiwa na
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
