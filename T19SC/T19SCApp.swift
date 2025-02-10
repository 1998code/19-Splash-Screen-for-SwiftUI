//
//  T19SCApp.swift
//  T19SC
//
//  Created by Ming on 9/2/2025.
//

import SwiftUI

@main
struct T19SCApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                FindMy()
                    .ignoresSafeArea(edges: .bottom)
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Find My")
                    }
                FinalCutCamera()
                    .ignoresSafeArea(edges: .bottom)
                    .tabItem {
                        Image(systemName: "film")
                        Text("Final Cut Camera")
                    }
                AppleTV()
                    .ignoresSafeArea(edges: .bottom)
                    .tabItem {
                        Image(systemName: "tv")
                        Text("Apple TV")
                    }
                Journal()
                    .ignoresSafeArea(edges: .bottom)
                    .tabItem {
                        Image(systemName: "book")
                        Text("Journal")
                    }
            }
        }
    }
}
