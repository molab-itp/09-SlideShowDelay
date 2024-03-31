//
//  SlideShowDelayApp.swift
//  SlideShowDemo
//
//  Created by jht2 on 3/10/22.
//

import SwiftUI

@main
struct SlideShowDelayApp: App {
    @StateObject var audioDJ = AudioDJ()
    var body: some Scene {
        WindowGroup {
            SlidesAudioView()
                .environmentObject(audioDJ)
        }
    }
}

// system symbol names for each slide
// could passed as EnvironmentObject
let slides = ["fish","ant","hare","ladybug","tortoise"]
