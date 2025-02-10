//
//  Photo.swift
//  T19SC
//
//  Created by Ming on 10/2/2025.
//

import SwiftUI

struct Photo: Identifiable {
    var title: String

    var id: Int = .random(in: 0 ... 100)

    init(_ title: String) {
        self.title = title
    }
}

struct ItemPhoto: View {
    var photo: Photo

    init(_ photo: Photo) {
        self.photo = photo
    }

    var body: some View {
        Image(photo.title)
            .resizable()
            .scaledToFill()
            .frame(width: 219, height: 475)
            .clipShape(RoundedRectangle(cornerRadius: 36))
            .shadow(radius: 5)
    }
}

struct ItemLabel: View {
    var photo: Photo

    init(_ photo: Photo) {
        self.photo = photo
    }

    var body: some View {
        Text(photo.title)
            .font(.title)
    }
}
