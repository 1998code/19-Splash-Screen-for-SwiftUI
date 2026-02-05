//
//  ContentView.swift
//  Demo
//
//  Created by Ming on 10/2/2025.
//

import SwiftUI
import SplashScreenKit

struct ContentView: View {
    var body: some View {
        SplashScreen(
            images: [
                Photo("Apple TV 1"),
                Photo("Apple TV 2"),
                Photo("Apple TV 3"),
                Photo("Apple TV 4"),
                Photo("Apple TV 5"),
                Photo("Apple TV 6")
            ],
            title: "Welcome to",
            product: "Apple TV",
            caption: "Browse all movies, TV shows, and more from Apple TV+. Watch all Apple Originals here.",
            cta: "Watch Now"
        ) {
            // Button Action
            print("Hello, Apple TV!")
        }
    }
}

#Preview("Apple TV") {
    ContentView()
}

#Preview("Creator Studio (Static)") {
    SplashScreen(
        mode: .static,
        images: [
            Photo("https://www.apple.com/newsroom/images/2026/01/introducing-apple-creator-studio-an-inspiring-collection-of-creative-apps/article/Apple-Creator-Studio-lifestyle-Pixelmator-Pro_big.jpg.large_2x.jpg")
        ],
        title: "Creator Studio",
        product: "Your new device includes 3 months of Creator Studio for free.",
        caption: "Bring your vision to life with powerful apps for video and music, creative imaging, and much more.",
        features: [
            SplashFeature(title: "Create stunning videos with Final Cut Pro", icon: "video"),
            SplashFeature(title: "Record, mix, and master music with Logic Pro", icon: "waveform"),
            SplashFeature(title: "Retouch images, design, and draw with Pixelmator Pro", icon: "paintbrush"),
            SplashFeature(title: "Premium features in Pages, Numbers, and Keynote", icon: "star.fill")
        ],
        footer: "3 months free, then $12.99/month. Terms apply.",
        cta: "Accept 3 Months Free",
        secondaryCta: "See All Plans",
        secondaryAction: {
            print("See All Plans")
        }
    ) {
        print("Accept 3 Months Free")
    }
}

#Preview("Final Cut Camera") {
    SplashScreen(
        images: [
            Photo("Final Cut Camera"),
            Photo("Final Cut Camera (1)"),
            Photo("Final Cut Camera (2)"),
            Photo("Final Cut Camera (3)"),
            Photo("Final Cut Camera (4)"),
            Photo("Final Cut Camera (5)"),
            Photo("Final Cut Camera (6)"),
            Photo("Final Cut Camera (7)")
        ],
        title: "Welcome to",
        product: "Final Cut Camera",
        caption: "Final Cut Camera puts you in the director’s chair with intuitive pro controls for your entire video production. Seamlessly start a Live Multicam session.",
        cta: "Create a Project"
    ) {
        // Button Action
        print("Hello, Final Cut Camera!")
    }
}

#Preview("Find My") {
    SplashScreen(
        images: [
            Photo("Find My App"),
            Photo("Find My App (1)"),
            Photo("Find My App (2)"),
            Photo("Find My App (3)"),
            Photo("Find My App (4)"),
            Photo("Find My App (5)")
        ],
        title: "Welcome to",
        product: "Find My",
        caption: "Easy to keep track of your Apple devices — even if they’re offline. You can also locate items using AirTag or Find My technology.",
        cta: "Connect"
    ) {
        // Button Action
        print("Hello, Find My!")
    }
}

#Preview("Journal") {
    SplashScreen(
        images: [
            Photo("Journal App Image"),
            Photo("Journal App Image (1)"),
            Photo("Journal App Image (2)"),
            Photo("Journal App Image (3)"),
            Photo("Journal App Image (4)"),
            Photo("Journal App Image (5)")
        ],
        title: "Welcome to",
        product: "Journal",
        caption: "Take a moment to reflect on your day. Capture and write about the details of everyday moments and special events.",
        cta: "Start Writing"
    ) {
        // Button Action
        print("Hello, Journal!")
    }
}

#Preview("Keynote") {
    SplashScreen(
        images: [
            Photo("Keynote 1"),
            Photo("Keynote 2"),
            Photo("Keynote 3"),
            Photo("Keynote 4"),
            Photo("Keynote 5"),
            Photo("Keynote 6"),
            Photo("Keynote 7"),
            Photo("Keynote 8")
        ],
        title: "Welcome to",
        product: "Keynote",
        caption: "Create stunning presentations with cinematic animations and pro-level tools that make your ideas stand out.",
        cta: "Continue"
    ) {
        // Button Action
        print("Hello, Keynote!")
    }
}
