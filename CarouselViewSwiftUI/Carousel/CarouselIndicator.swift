//
//  CarouselIndicator.swift
//  CarouselViewSwiftUI
//
//  Created by Gagan Vishal  on 2023/08/04.
//

import SwiftUI

struct CarouselIndicator: View {
    var totalTabs: Int
    @Binding var currentIndex: Int
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(alignment: .center) {
                    ForEach(0..<totalTabs, id: \.self) { index in
                        Rectangle()
                            .fill(index == currentIndex ? .green : .gray)
                            .frame(width: 30)
                            .frame(height: index == currentIndex ? 5 : 2)
                    }
                }
                .frame(width: geometry.size.width)
            }
        }
    }
}

struct CarouselIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CarouselIndicator(totalTabs: 10, currentIndex: .constant(0))
    }
}
