//
//  ContentView.swift
//  T19SC
//
//  Created by Ming on 9/2/2025.
//

import SwiftUI

struct FindMy: View {
    @State var prVisible: Bool = false
    @State var ctaVisible: Bool = false
    
    @State private var scrollOffset: CGFloat = 0
    @State private var timer: Timer?
    @State var photos = [
        Photo("Find My App"),
        Photo("Find My App (1)"),
        Photo("Find My App (2)"),
        Photo("Find My App (3)"),
        Photo("Find My App (4)"),
        Photo("Find My App (5)")
    ]

    var body: some View {
        ZStack {
            Image("\(photos[currentIndex].title)")
                .resizable()
                .ignoresSafeArea(.all)
                .blur(radius: 10)
            VStack {
                pagingRotation
                    .offset(y: prVisible ? 0 : -500)
                    .transition(.move(edge: .top))
                    .animation(.easeInOut(duration: 1))
                cta
                Spacer()
            }
            .background(.black.opacity(0.5))
            .background(.ultraThinMaterial)
        }
    }
    
    var pagingRotation: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 30) {
                    ForEach(Array(photos).enumerated().map { $0 }, id: \.offset) { index, photo in
                        ItemPhoto(photo)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                content
                                    .rotationEffect(.degrees(phase.value * 2.5))
                                    // Experiental
                                    .scaleEffect(1 - abs(phase.value) * 0.025)
                                    .opacity(1 - abs(phase.value) * 0.8)
                            }
                    }
                }
                .offset(x: scrollOffset)
                .onAppear {
                    startAutoScroll(geometry.size.width)
                }
                .onDisappear {
                    timer?.invalidate()
                    prVisible = false
                    ctaVisible = false
                }
                .onChange(of: currentIndex) { index in
                    withAnimation(nil) {
                        if index >= photos.count - 3 {
                            photos.append(contentsOf: photos)
                        }
                    }
                }
            }
            .disabled(true)
            .contentMargins(24)
            .frame(maxHeight:475)
        }.frame(maxHeight:475)
        .padding(.vertical, 25)
    }

    private func startAutoScroll(_ viewWidth: CGFloat) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            withAnimation {
                scrollOffset -= 1
                if scrollOffset <= -viewWidth * CGFloat(photos.count - 1) {
                    scrollOffset = 0
                }
            }
        }
    }
    private var currentIndex: Int {
        let imageWidth: CGFloat = 219 + 30 // Image width + spacing
        return Int((-scrollOffset + imageWidth / 2) / imageWidth)
    }
    
    var cta: some View {
        VStack {
            if ctaVisible {
                Text("Welcome to")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundStyle(.secondary)
                    .transition(TextTransition())
                Text("Find My")
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .customAttribute(EmphasisAttribute())
                    .transition(TextTransition())
                    .padding(.bottom,5)
                Text("The Find My app makes it easy to keep track of your Apple devices — even if they’re offline. You can also locate items using AirTag or Find My technology.")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .transition(TextTransition())
                Button(action: {}) {
                    Text("Connect")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(.white)
                .foregroundStyle(.black)
                .padding(25)
            }
        }.foregroundStyle(.white)
        .padding()
        .onAppear {
            prVisible = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                ctaVisible = true
            }
        }
        .animation(.easeInOut(duration: 2))
    }
}

#Preview {
    FindMy()
}
