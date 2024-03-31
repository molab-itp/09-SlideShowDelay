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
            ContentView()
                .environmentObject(audioDJ)
        }
    }
}
