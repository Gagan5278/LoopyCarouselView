//
//  ImageCarouselView.swift
//  CarouselViewSwiftUI
//
//  Created by Gagan Vishal  on 2023/08/04.
//

import SwiftUI

struct ImageCarouselView<Content: View>: View {
    
    private var imageCount: Int
    private var content: Content
    @State private var itemSpacing: CGFloat = 0.0
    @State private var currentIndex: Int = 0
    let gestureConstant: CGFloat = 50.0
    @State var slideGesture: CGSize = .zero
    var shouldBeLoopy: Bool
    @Binding var activeIndex: Int
    // MARK: - init
    init(imageCount: Int, activeIndex: Binding<Int>, shouldLoop: Bool, @ViewBuilder content: () -> Content) {
        self.imageCount = imageCount
        self.content = content()
        shouldBeLoopy = shouldLoop
        _activeIndex = activeIndex
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                HStack(spacing: 0) {
                    content
                }
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height, alignment: .leading
                )
                .offset(
                    x: CGFloat(currentIndex) * -geometry.size.width,
                    y: 0
                )
                .gesture(
                    DragGesture().onChanged { value in
                        slideGesture = value.translation
                    }
                        .onEnded{ value in
                            if slideGesture.width < gestureConstant {
                                if currentIndex < imageCount - 1 {
                                    withAnimation {
                                        currentIndex += 1
                                    }
                                } else if currentIndex == imageCount - 1 && shouldBeLoopy {
                                    currentIndex = 0
                                }
                            }
                            if slideGesture.width > gestureConstant {
                                if currentIndex > 0 {
                                    withAnimation {
                                        currentIndex -= 1
                                    }
                                } else if shouldBeLoopy {
                                    currentIndex = imageCount - 1
                                }
                            }
                            slideGesture = .zero
                            activeIndex = currentIndex
                        }
                )
            }
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let arrayOfImages = Array(1...10)
        GeometryReader{ geometry in
            ImageCarouselView(imageCount: arrayOfImages.count,  activeIndex: .constant(0), shouldLoop: true) {
                ForEach(arrayOfImages, id: \.self) { _ in
                    AsyncImage(url: URL(string: "https://picsum.photos/200/300"))
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
    }
}
