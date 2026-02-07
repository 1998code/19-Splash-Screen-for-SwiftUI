# SplashScreenKit
### شاشة ترحيب جديدة لـ SwiftUI

| Region | Languages |
| :--- | :--- |
| **Global** | [English](../README.md) |
| **Asia** | [廣東話](./README_HK.md) [繁體中文](./README_TW.md) [简体中文](./README_CN.md) [日本語](./README_JP.md) [한국어](./README_KR.md) [Indo](./README_ID.md) [हिन्दी](./README_HI.md) |
| **Europe** | [Français](./README_FR.md) [Deutsch](./README_DE.md) [Español](./README_ES.md) [Русский](./README_RU.md) [Polski](./README_PL.md) [Türkçe](./README_TR.md) |
| **ME & Africa** | [العربية](./README_AR.md) [Kiswahili](./README_SW.md) |

<img width="1585" alt="Screenshot 2025-02-10 at 8 18 53 PM" src="https://github.com/user-attachments/assets/7f35a079-f74d-4c35-8f25-ea3239cc645f" />

## الإصدار
**2.2.3 (إصدار مستقر)** <br>
*تم تحسينه للتفاعل عالي الأداء مع انعدام التأخير.*

- **دوار لا نهائي سلس:** منطق الفهرس الافتراضي الجديد يمنع "البطاقات الطائرة" ويضمن دورانًا لا نهائيًا سلسًا.
- **أداء محسن:** عرض سريع مدعوم بـ Metal (`drawingGroup`) وتحديثات فعالة لكل إطار عبر `RunLoop`.
- **التمرير بالزخم:** إيماءات تفاعلية سلسة ومبنية على السرعة مع شعور التباطؤ الطبيعي.
- **دعم AsyncImage:** معالجة URL مسبقة التحقق لتحميل الصور عن بعد بدون تأخير.
- **وضعان للعرض:** اختر بين تخطيطات `.carousel` الديناميكية و `.static` الأنيقة.
- **تأثيرات نصية متقدمة:** عرض نصوص وانتقالات جميلة باستخدام ميزات SwiftUI 6.0.

## البيئة / تم الاختبار على
- 📲 يتطلب iOS 18.0+
- Swift 6.0
- Xcode 16.0+

## كيفية الاستخدام
أضف الحزمة إلى مشروعك: ```https://github.com/1998code/19-Splash-Screen-for-SwiftUI```

### وضع الدوار (افتراضي)
التجربة التفاعلية الكلاسيكية مع الصور الدوارة.
```swift
SplashScreen(
    images: [
        Photo("ImageName1"),
        Photo("https://example.com/image.jpg") // روابط الصور عن بعد مدعومة!
    ],
    title: "مرحباً بكم في",
    product: "Apple TV",
    caption: "تصفح جميع الأفلام والبرامج التلفزيونية والمزيد.",
    cta: "شاهد الآن"
) {
    print("تم النقر على زر الإجراء")
}
```

<img src="https://github.com/user-attachments/assets/28c8a5dc-cb8c-4aa4-b0a8-d7139ce3cefc" width="350" />

### الوضع الثابت (جديد)
تخطيط نظيف وقابل للتمرير مثالي لتقديم المنتجات.
```swift
SplashScreen(
    mode: .static,
    images: [Photo("https://url.to/header_image.jpg")],
    title: "ستوديو المبدع",
    product: "3 أشهر مجانية من ستوديو المبدع.",
    caption: "اجعل رؤيتك تنبض بالحياة مع تطبيقات قوية.",
    features: [
        SplashFeature(title: "ميزة 1", icon: "video"),
        SplashFeature(title: "ميزة 2", icon: "waveform")
    ],
    footer: "تطبق الشروط والأحكام.",
    cta: "قبول العرض",
    secondaryCta: "عرض جميع الخطط",
    secondaryAction: {
        print("تم النقر على الإجراء الثانوي")
    }
) {
    print("تم النقر على الإجراء الأساسي")
}
```

<img src="https://github.com/user-attachments/assets/44f9aeef-7906-4251-b338-f9504b30b278" width="350" />

## المشكلات المعروفة
- متوافق فقط مع iOS 18+، مع الاستفادة من أحدث واجهات برمجة تطبيقات `TextRenderer` والتأثيرات المرئية في SwiftUI.
- تغيير الحجم: وضع الدوار محسن لأجهزة Pro/Pro Max. يتضمن الوضع الثابت ScrollView للتعامل مع الأجهزة الأصغر وأطوال المحتوى المتغيرة.

## حقوق الطبع والنشر
App Store Screenshots © 2025 Apple Inc.

## المرجع
[Creating visual effects with SwiftUI - Apple Developer](https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)

## المنشورات ذات الصلة على X
https://x.com/1998design/status/2019418746553790664 <br>
https://x.com/1998design/status/1888641485303878110 <br>
https://x.com/1998design/status/1888945523845140677

## التشكيلات
استخدم [SwiftNEWKit](https://github.com/1998code/SwiftNEWKit) معاً، فعالية مضاعفة!
<br><br>
<img height=300 src="https://github.com/user-attachments/assets/cc88b31d-326f-4a43-9e6a-5f583fcf153b" />

## الترخيص
MIT

## بدعم من
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>
