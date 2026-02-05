//
//  Photo.swift
//  SplashScreenKit
//  Copyright © 2024 Apple Inc. (https://developer.apple.com/documentation/swiftui/creating-visual-effects-with-swiftui)
//  Modified by Ming on 10/2/2025.
//

import SwiftUI

public struct Photo: Identifiable {
    public var title: String
    public var id: UUID = UUID()
    public let isURL: Bool
    public let resolvedURL: URL?

    public init(_ title: String) {
        self.title = title
        if let url = URL(string: title), url.scheme != nil {
            self.isURL = true
            self.resolvedURL = url
        } else {
            self.isURL = false
            self.resolvedURL = nil
        }
    }
}

@available(iOS 18.0, macOS 15.0, *)
public struct ItemPhoto: View {
    public var photo: Photo

    public init(_ photo: Photo) {
        self.photo = photo
    }

    public var body: some View {
        Group {
            if let url = photo.resolvedURL {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image.resizable()
                    } else if phase.error != nil {
                        Color.gray // Error state
                    } else {
                        ProgressView().tint(.white) // Loading state
                    }
                }
            } else {
                Image(photo.title)
                    .resizable()
            }
        }
        .scaledToFill()
        .frame(width: 219, height: 475)
        .clipShape(RoundedRectangle(cornerRadius: 36))
        // Using a simpler shadow call which is often better optimized
        .shadow(color: .black.opacity(0.3), radius: 10)
    }
}

@available(iOS 18.0, macOS 15.0, *)
public struct ItemLabel: View {
    public var photo: Photo

    public init(_ photo: Photo) {
        self.photo = photo
    }

    public var body: some View {
        Text(photo.title)
            .font(.title)
    }
}
