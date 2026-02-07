# SplashScreenKit
### Nowy ekran powitalny dla SwiftUI

| Region | Languages |
| :--- | :--- |
| **Global** | [English](../README.md) |
| **Asia** | [廣東話](./README_HK.md) [繁體中文](./README_TW.md) [简体中文](./README_CN.md) [日本語](./README_JP.md) [한국어](./README_KR.md) [Indo](./README_ID.md) [हिन्दी](./README_HI.md) |
| **Europe** | [Français](./README_FR.md) [Deutsch](./README_DE.md) [Español](./README_ES.md) [Русский](./README_RU.md) [Polski](./README_PL.md) [Türkçe](./README_TR.md) |
| **ME & Africa** | [العربية](./README_AR.md) [Kiswahili](./README_SW.md) |

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## Wersja
**2.2.1 (Wersja Stabilna)** <br>
*Zoptymalizowany pod kątem wysokiej wydajności interakcji bez zacięć.*

- **Płynna nieskończona karuzela:** Nowa logika wirtualnych indeksów zapobiega „latającym kartom” i zapewnia gładką, nieskończoną rotację.
- **Zoptymalizowana wydajność:** Renderowanie akcelerowane przez Metal (`drawingGroup`) i wydajne aktualizacje klatek przez `RunLoop`.
- **Płynne przewijanie:** Interaktywne gesty oparte na prędkości z naturalnym uczuciem spowalniania.
- **Wsparcie AsyncImage:** Wstępnie zweryfikowana obsługa adresów URL dla ładowania zdalnych obrazów bez opóźnień.
- **Dwa tryby wyświetlania:** Wybierz między dynamiczną karuzelą `.carousel` a eleganckim statycznym układem `.static`.
- **Zaawansowane efekty tekstowe:** Piękne renderowanie tekstu i przejścia przy użyciu funkcji SwiftUI 6.0.

## Środowisko / Testowano na
- 📲 Wymagany iOS 18.0+
- Swift 6.0
- Xcode 16.0+

## Jak używać
Dodaj pakiet do swojego projektu: ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### Tryb karuzeli (Domyślny)
Klasyczne interaktywne doświadczenie z rotacyjnymi obrazami.
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // Zdalne adresy URL są obsługiwane!
    ],
    title: "Witaj w",
    product: "Apple TV",
    caption: "Przeglądaj wszystkie filmy, seriale i wiele więcej.",
    cta: "Oglądaj teraz"
) {
    print("Kliknięto przycisk akcji")
}
```

<img src="https://github.com/user-attachments/assets/28c8a5dc-cb8c-4aa4-b0a8-d7139ce3cefc" width="350" />

### Tryb statyczny (NOWOŚĆ)
Czysty, przewijalny układ idealny do prezentacji produktów.
```swift
SplashScreen(
    mode: .static,
    images: [Photo("https://url.to/header_image.jpg")],
    title: "Studio Twórcy",
    product: "3 miesiące Studio Twórcy za darmo.",
    caption: "Ożyw swoją wizję dzięki potężnym aplikacjom.",
    features: [
        SplashFeature(title: "Funkcja 1", icon: "video"),
        SplashFeature(title: "Funkcja 2", icon: "waveform")
    ],
    footer: "Obowiązują regulaminy.",
    cta: "Zaakceptuj ofertę",
    secondaryCta: "Zobacz wszystkie plany",
    secondaryAction: {
        print("Kliknięto akcję drugorzędną")
    }
) {
    print("Kliknięto akcję główną")
}
```

<img src="https://github.com/user-attachments/assets/44f9aeef-7906-4251-b338-f9504b30b278" width="350" />

## Znane problemy
- Kompatybilny tylko z iOS 18+, wykorzystuje najnowsze interfejsy API SwiftUI `TextRenderer` i efekty wizualne.
- Zmiana rozmiaru: Tryb karuzeli jest zoptymalizowany dla Pro/Pro Max. Tryb statyczny zawiera ScrollView, aby obsłużyć mniejsze urządzenia i różne długości treści.

## Prawa autorskie
App Store Screenshots © 2025 Apple Inc.

## Referencje
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## Powiązane posty na X
https://x.com/1998design/status/2019418746553790664 <br>
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## Kombinacje
Używaj razem z [SwiftNEWKit](https://github.com/1998code/SwiftNEWKit), 2x większa efektywność!
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## Licencja
MIT

## Obsługiwane przez
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
