//
//  SlideShowDelayApp.swift
//  SlideShowDemo
//
//  Created by jht2 on 3/10/22.
//

import SwiftUI

@main
struct SlideShowDelayApp: App {
    @State var audioDJ = AudioDJ()
    var body: some Scene {
        WindowGroup {
            SlidesAudioView()
                .environment(audioDJ)
        }
    }
}

// system symbol names for each slide
// could be passed via .environment
let slides = ["fish","ant","hare","ladybug","tortoise"]
