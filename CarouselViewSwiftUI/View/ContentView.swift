//
//  ContentView.swift
//  CarouselViewSwiftUI
//
//  Created by Gagan Vishal  on 2023/08/04.
//

import SwiftUI

struct ContentView: View {
    let arrayOfImages = Array(1...10)
    @State private var activeIndex: Int = 0
    var body: some View {
        ScrollView {
                GeometryReader{ geometry in
                    ImageCarouselView(imageCount: arrayOfImages.count,  activeIndex: $activeIndex, shouldLoop: true) {
                    ForEach(arrayOfImages, id: \.self) { _ in
                        AsyncImage(url: URL(string: "https://picsum.photos/200/300")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(Rectangle())
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height/2, alignment: .center)
            CarouselIndicator(totalTabs: arrayOfImages.count, currentIndex: $activeIndex)
            Text("Image: \(activeIndex)")
                .font(.headline.bold())
                .foregroundColor(.purple)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
