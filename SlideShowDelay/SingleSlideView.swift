//
//  SingleSlideView.swift
//  SlideShowDelay
//
//  Created by jht2 on 3/30/24.
//

import SwiftUI

// The view use to represent a slide
struct SingleSlideView: View {
    var name:String
    var body: some View {
        VStack {
            Image(systemName: name)
                .resizable()
            Text(name)
        }
    }
}

#Preview {
    SingleSlideView(name: "fish")
}
