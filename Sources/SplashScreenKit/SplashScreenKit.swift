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

@available(iOS 18.0, macOS 15.0, *)
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
                // Background image with smooth transition
                ZStack {
                    if !photos.isEmpty {
                        let currentPhoto = photos[min(currentIndex, photos.count - 1)]
                        SplashScreenImage(photo: currentPhoto)
                            .id(currentPhoto.id)
                            .transition(.opacity.animation(.linear(duration: 0.3))) // Faster transition for interactive feel
                            .ignoresSafeArea(.all)
                            .blur(radius: 10)
                    }
                }
                
                VStack {
                    pagingRotation
                        .offset(y: prVisible ? 0 : -500)
                        .transition(.move(edge: .top))
                        .animation(.easeInOut(duration: 1), value: prVisible)
                    cta
                    Spacer()
                }
                .background(.black.opacity(0.85))
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
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                        .foregroundStyle(.white)
                        
                        Text(product)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
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

    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false

    private let itemWidth: CGFloat = 219 + 30
    
    public var pagingRotation: some View {
        GeometryReader { geometry in
            let totalWidth = CGFloat(photos.count) * itemWidth
            let centerX = geometry.size.width / 2
            
            ZStack {
                // Non-jumping Infinite Logic:
                // Instead of jumping coordinates, we calculate which "virtual" indices are visible.
                // Each virtual index has a unique, linear position, so SwiftUI never "flies" items during animation.
                let currentEffectiveOffset = scrollOffset + dragOffset
                let centerIndex = -currentEffectiveOffset / itemWidth
                let visibleRange = 6 // Much larger range to prevent items disappearing while still visible
                let minIdx = Int(floor(centerIndex)) - visibleRange
                let maxIdx = Int(ceil(centerIndex)) + visibleRange
                
                ForEach(minIdx...maxIdx, id: \.self) { virtualIndex in
                    let photoIndex = (virtualIndex % photos.count + photos.count) % photos.count
                    let photo = photos[photoIndex]
                    let x = CGFloat(virtualIndex) * itemWidth + currentEffectiveOffset
                    let phase = x / geometry.size.width
                    
                    ItemPhoto(photo)
                        .scaleEffect(1 - abs(phase) * CGFloat(0.025))
                        .opacity(1 - Double(abs(phase)) * 0.8)
                        .rotationEffect(.degrees(Double(phase) * 5))
                        .position(x: centerX + x, y: geometry.size.height / 2)
                        .zIndex(1 - Double(abs(phase)))
                        .transition(.identity) // Prevent "flying" or "fading" when range changes
                }
            }
            .drawingGroup() // Better for high-speed linear animations
            .contentShape(Rectangle()) // Ensure the whole area is draggable
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        isDragging = true
                        dragOffset = value.translation.width
                    }
                    .onEnded { value in
                        // Calculate momentum based on velocity
                        let velocity = value.velocity.width
                        // Reduced multiplier for a more controlled "free" feel
                        let flickDistance = velocity * 0.15 
                        
                        withAnimation(.interpolatingSpring(stiffness: 50, damping: 15)) {
                            scrollOffset += value.translation.width + flickDistance
                            dragOffset = 0
                        }
                        
                        // Resync isDragging after the momentum animation usually settles
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            if !isDragging { // Only if a new drag hasn't started
                                isDragging = false
                            }
                        }
                        isDragging = false // Set to false immediately to allow velocity to take over
                    }
            )
            .onAppear {
                startAutoScroll(totalWidth)
            }
            .onDisappear {
                timer?.invalidate()
                prVisible = false
                ctaVisible = false
            }
        }
        .frame(height: 475)
        .padding(.top, 60) // Increased top padding for Dynamic Island
        .padding(.bottom, 25)
    }

    public func startAutoScroll(_ totalWidth: CGFloat) {
        timer?.invalidate()
        let newTimer = Timer(timeInterval: 0.016, repeats: true) { _ in
            if !isDragging && !photos.isEmpty {
                scrollOffset -= 0.6
                // With virtual indices, we rarely need to truncate.
                // Truncating only when idle prevents animation "flicker".
                let totalCarouselWidth = CGFloat(photos.count) * itemWidth
                if abs(scrollOffset) > totalCarouselWidth * 100 {
                    scrollOffset = scrollOffset.truncatingRemainder(dividingBy: totalCarouselWidth)
                }
            }
        }
        RunLoop.main.add(newTimer, forMode: .common)
        timer = newTimer
    }

    public var currentIndex: Int {
        guard !photos.isEmpty else { return 0 }
        let currentEffectiveOffset = scrollOffset + dragOffset
        let virtualIndex = Int(round(-currentEffectiveOffset / itemWidth))
        let photoIndex = (virtualIndex % photos.count + photos.count) % photos.count
        return photoIndex
    }
    
    public var cta: some View {
            VStack {
                if ctaVisible {
                    Text(title)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundStyle(.secondary)
                        .transition(TextTransition())
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text(product)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .customAttribute(EmphasisAttribute())
                        .transition(TextTransition())
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
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
            .animation(.easeInOut(duration: 2), value: ctaVisible)
        }
}

@available(iOS 18.0, macOS 15.0, *)
struct SplashScreenImage: View {
    var photo: Photo
    
    var body: some View {
        Group {
            if let url = photo.resolvedURL {
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
