# SplashScreenKit
### A New Splash Screen for SwiftUI

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## Version
**1.0.0 (Early Preview)** <br>
*⚠️ Various issues existed, not suitable for the production environment!*

## Features
- Drop Transition
- Auto Rotation with paging
- Text Effect
- Text Transition
- Fade-in/out Transition/Animation

## Beautiful Previews
| ![Apple TV](https://github.com/user-attachments/assets/d1175ec1-8880-45e6-8591-993b6d063346) | ![1 Final Cut Camera](https://github.com/user-attachments/assets/2d8a7f5a-abfe-4107-9293-bee95c524edc) | ![1 Find My](https://github.com/user-attachments/assets/f7a3dee2-6378-4ecb-b8e2-8a154d20faf0) | ![1 Journal](https://github.com/user-attachments/assets/89061031-116a-4a5e-b75d-1614a293f23e) |
| --- | --- | --- | --- |
| Apple TV | Final Cut Camera | Find My | Journal |

## Environment / Tested on
- 📲 iOS18+ required
- Swift 6.0
- iPhone 16 Pro / Pro Max
- Xcode 16.2 (16C5032a)

## How to use
0. Open Xcode and (create) a project
1. In **Package Dependencies**, add ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```
2. Then ```import SplashScreenKit``` on top
3. Sample Code:
```swift
struct ContentView: View {
    var body: some View {
        SplashScreen(
            images: [],
            title: "STRING",
            product: "STRING",
            caption: "STRING",
            cta: "STRING"
        ) {
            // Button Action
        }
    }
}
```

## Project Demo
Path: [Demo/Demo.xcodeproj](https://github.com/1998code/19-Splash-Screen-for-SwiftUI/tree/main/Demo)

## Known Issues
**Major**
- Gesture is **disabled** due to multiple bugs
  - Dragging (from left to right) is not working due to offset; and
  - Dragging (from right to left) works but fails the ```currentIndex```
- Only compatible with iOS18+, like Apple Invites app
- Only tested on iPhone 16 Pro/Pro Max (Resize problem on small devices)
- Possible memory leakage when inserting too many items into the array

**Minor**
- The auto-rotation+paging feels like a "Conveyor belt sushi 🍣", not so smooth.

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
