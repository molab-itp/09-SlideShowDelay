//
//  SlideView.swift
//  SlideShowDemo
//
//  Created by jht2 on 3/10/22.
//

import SwiftUI

struct SlidesAudioView: View {
    @State var slideIndex = 0
    @State var isPlaying = false
    // Timer gets called every second.
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var delayMax = 5.0
    @State var delayCount = 0.0
    @State var audioFlag = false
    
    @EnvironmentObject var audioDJ:AudioDJ;
    
    var body: some View {
        VStack {
            Text("Slides Audio")
                .font(Font.system(size: 30, weight: .bold))
                .padding()
            // slides is defined in ContentView
            let name = slides[slideIndex]
            SingleSlideView(name: name)
            HStack {
                Text("\(delayMax, specifier: "%.0f")")
                Slider(value: $delayMax, in: 1 ... 20)
            }
            HStack {
                Button(action: previousItemAction) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()
                Spacer()
                Button(action: playPauseAction) {
                    Image(systemName: isPlaying ? "pause" : "play")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Spacer()
                Button(action: nextItemAction) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()
            }
            Toggle(isOn: $audioFlag) {
                Text("Audio")
            }
        }
        .onReceive(timer) { _ in
            // Block gets called when timer updates.
            delayCount += 1;
            if (delayCount > delayMax) {
                delayCount = 0;
                if (isPlaying) {
                    nextItemAction()
                }
            }
        }
        .onAppear() {
            audioDJ.soundFile = "scale-study-guitar.mp3"
        }
        .onDisappear() {
            
        }
        .onChange(of: audioFlag) { _ in
            checkAudio()
        }
    }
    
    func playPauseAction() {
        isPlaying.toggle()
        checkAudio();
    }
    func checkAudio() {
        if audioFlag && isPlaying {
            audioDJ.play()
        }
        else {
            audioDJ.stop()
        }
    }
    func previousItemAction() {
        slideIndex = (slideIndex - 1 + slides.count) % slides.count
    }
    func nextItemAction() {
        slideIndex = (slideIndex + 1) % slides.count
    }
}

// AudioDJ must be established here to avoid crash in preview
// Can not use var property
struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlidesAudioView()
            .environmentObject(AudioDJ())
    }
}
