# SplashScreenKit
### A New Splash Screen for SwiftUI

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## Version
**2.1.0 (Stable Release)** <br>
*Optimized for high-performance interaction with zero jank.*

- **Seamless Infinite Carousel:** New virtual-index logic prevents "flying cards" and ensures smooth infinite rotation.
- **Performance Optimized:** Metal-accelerated rendering (`drawingGroup`) and efficient per-frame updates via `RunLoop`.
- **Momentum Scrolling:** Butter-smooth, velocity-based interactive gestures with native deceleration feel.
- **AsyncImage Support:** Pre-validated URL handling for lag-free remote image loading.
- **Two Display Modes:** Choose between dynamic `.carousel` and elegant `.static` layouts.
- **Advanced Text Effects:** Beautiful text rendering and transitions using SwiftUI 6.0 features.

## Environment / Tested on
- 📲 iOS 18.0+ required
- Swift 6.0
- Xcode 16.0+

## How to use
Add the package to your project: ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### Carousel Mode (Default)
The classic interactive experience with rotating images.
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // Remote URLs supported!
    ],
    title: "Welcome to",
    product: "Apple TV",
    caption: "Browse all movies, TV shows, and more.",
    cta: "Watch Now"
) {
    print("Action Button Tapped")
}
```

### Static Mode (NEW)
A clean, scrollable layout perfect for product introductions.
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

## Known Issues
- Only compatible with iOS 18+, leveraging the latest SwiftUI `TextRenderer` and visual effect APIs.
- Resizing: Carousel mode is optimized for Pro/Pro Max. Static mode includes a ScrollView to handle smaller devices and varying content lengths.

## Copyright
App Store Screenshots © 2025 Apple Inc.

## Reference
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## Related Posts on X
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## Combinations
Use [SwiftNEWKit](https://github.com/1998code/SwiftNEWKit) together, 2X effective!
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## License
MIT

## Supported By
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
