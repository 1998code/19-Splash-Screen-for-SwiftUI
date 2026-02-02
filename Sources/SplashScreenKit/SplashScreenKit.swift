//
//  Created by Ming on 10/2/2025. Inspired by 'Creating visual effects with SwiftUI' & Apple Invites app 2025.
//

import SwiftUI

public enum SplashScreenMode {
    case carousel
    case `static`
}

public struct SplashFeature: Identifiable {
    public let id = UUID()
    public let title: String
    public let icon: String
    
    public init(title: String, icon: String) {
        self.title = title
        self.icon = icon
    }
}

@available(iOS 18.0, *)
public struct SplashScreen: View {
    @State var prVisible: Bool = false
    @State var ctaVisible: Bool = false
    @State var scrollOffset: CGFloat = 0
    @State var timer: Timer?
    @State var photos: [Photo]
    
    var mode: SplashScreenMode
    var title: String
    var product: String
    var caption: String
    var features: [SplashFeature]
    var footerText: String?
    var ctaText: String
    var ctaAction: () -> Void
    var secondaryCtaText: String?
    var secondaryCtaAction: (() -> Void)?
    
    public init(
        mode: SplashScreenMode = .carousel,
        images: [Photo],
        title: String,
        product: String,
        caption: String,
        features: [SplashFeature] = [],
        footer: String? = nil,
        cta: String,
        secondaryCta: String? = nil,
        secondaryAction: (() -> Void)? = nil,
        action: @escaping () -> Void
    ) {
        self.mode = mode
        self._photos = State(initialValue: images) // Initialize @State variable
        self.title = title
        self.product = product
        self.caption = caption
        self.features = features
        self.footerText = footer
        self.ctaText = cta
        self.ctaAction = action
        self.secondaryCtaText = secondaryCta
        self.secondaryCtaAction = secondaryAction
    }
    
    public var body: some View {
        ZStack {
            if mode == .carousel {
                SplashScreenImage(photo: photos[currentIndex])
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
                .background(.black.opacity(0.8))
                .background(.ultraThinMaterial)
            } else {
                staticLayout
            }
        }
    }

    public var staticLayout: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0) {
                    // Header Image
                    if let firstPhoto = photos.first {
                        Rectangle()
                            .fill(.clear)
                            .frame(height: 400)
                            .overlay {
                                SplashScreenImage(photo: firstPhoto)
                            }
                            .clipped()
                            .overlay {
                                LinearGradient(
                                    stops: [
                                        .init(color: .clear, location: 0.8),
                                        .init(color: .black, location: 1.0)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                    }
                    
                    // Content
                    VStack(spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "apple.logo")
                                .font(.title3)
                            Text(title)
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.white)
                        
                        Text(product)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .minimumScaleFactor(0.5)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white.opacity(0.8))
                            .padding(.horizontal, 40)
                            .lineLimit(2)
                            .minimumScaleFactor(0.8)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        if !features.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(features) { feature in
                                    HStack(spacing: 15) {
                                        Image(systemName: feature.icon)
                                            .foregroundStyle(.white)
                                            .frame(width: 24)
                                        Text(feature.title)
                                            .font(.footnote)
                                            .foregroundStyle(.white)
                                    }
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                    .padding(.top, 20)
                }
            }
            .scrollIndicators(.hidden)
            
            // Fixed Bottom Area
            VStack(spacing: 12) {
                if let footerText = footerText {
                    Text(footerText)
                        .font(.caption2)
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                }
                
                Button(action: ctaAction) {
                    Text(ctaText)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(.blue)
                .padding(.horizontal, 40)
                
                if let secondaryCtaText = secondaryCtaText {
                    Button(action: { secondaryCtaAction?() }) {
                        Text(secondaryCtaText)
                            .font(.subheadline)
                            .foregroundStyle(.blue)
                    }
                    .padding(.bottom, 10)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            .background(.black)
        }
        .background(.black)
        .ignoresSafeArea(edges: .top)
    }

    public var pagingRotation: some View {
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
            }.disabled(true)
            .contentMargins(24)
            .frame(height:475)
        }.frame(height:475)
        .padding(.vertical, 25)
    }

    public func startAutoScroll(_ viewWidth: CGFloat) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            Task { @MainActor in
                withAnimation {
                    scrollOffset -= 1
                    if scrollOffset <= -viewWidth * CGFloat(photos.count - 1) {
                        scrollOffset = 0
                    }
                }
            }
        }
    }
    public var currentIndex: Int {
        let imageWidth: CGFloat = 219 + 30 // Image width + spacing
        return Int((-scrollOffset + imageWidth / 2) / imageWidth)
    }
    
    public var cta: some View {
            VStack {
                if ctaVisible {
                    Text(title)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundStyle(.secondary)
                        .transition(TextTransition())
                    Text(product)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .customAttribute(EmphasisAttribute())
                        .transition(TextTransition())
                        .padding(.bottom,5)
                    Text(caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .transition(TextTransition())
                    Button(action: ctaAction) {
                        Text(ctaText)
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    ctaVisible = true
                }
            }
            .animation(.easeInOut(duration: 2))
        }
}

struct SplashScreenImage: View {
    var photo: Photo
    
    var body: some View {
        Group {
            if let url = URL(string: photo.title), url.scheme != nil {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure(_):
                        Color.gray
                            .overlay {
                                Image(systemName: "photo")
                                    .foregroundStyle(.white)
                            }
                    case .empty:
                        ProgressView()
                            .tint(.white)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(photo.title)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}
