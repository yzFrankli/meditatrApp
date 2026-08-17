//
//  AudioPlayerView.swift
//  Meditatr
//
//  Created by Frank on 3/20/25.
//

import SwiftUI
import AVFoundation
import AVKit
import AVFAudio
import AVRouting


struct SliderView: View {
//    @Binding var percentage: Double
    @EnvironmentObject var soundManager: SoundManager
    @Binding var currentTime: TimeInterval
    var totalDuration: TimeInterval /*= SoundManager.instance.player?.duration ?? 0.00*/
    
    var body: some View {
        GeometryReader { geometry in
            // TODO
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.white).opacity(0.4)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(currentTime / totalDuration))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    // TODO
                    let newTime = min(max(0, value.location.x / geometry.size.width * totalDuration * 100), totalDuration)
                    currentTime = newTime
                    soundManager.player?.currentTime = newTime //sync audio position

                }))
        }
    }
    
}

struct AudioPlayerView: View {
    @EnvironmentObject var soundManager: SoundManager
    var sound: SoundOptions
    var previewing: Bool = false
    
    @State var currentTime: TimeInterval = 0.00
    @State var totalDuration: TimeInterval = 1.00
    @State var playing: Bool = true
    
    @Environment(\.dismiss) var dismiss
    
    // this allows the slider to move forward when music is playing (updates the slider every 0.
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay {
                    Spacer()
                    Rectangle()
                        .background(.thinMaterial)
                        .opacity(0.25)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("Deeper Well")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.top, 300)
                        Text("Ben Affleck")
                            .font(.body)
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .padding(.bottom, 20)
                        
                        SliderView(currentTime: $currentTime, totalDuration: totalDuration)
                            
                            .accentColor(.white).opacity(0.8)
                            .frame(width: 330, height: 8)
                            //                            .padding(.top, 300)
                            //                        ZStack() {
                            HStack(alignment: .center) {
                                Text(DateComponentsFormatter.positional.string(from: currentTime) ?? "0:00")
                                    .foregroundStyle(.white)
                                    .font(.body)
                                Spacer()
                                Text(DateComponentsFormatter.positional.string(from: totalDuration - currentTime) ?? "0:00")
                                    .foregroundStyle(.white)
                                    .font(.body)
                            }
                            .frame(width: 330)
                        
                        
                        
                    }
                    HStack {
                        Spacer()
                        // MARK: dismiss button
                        Button {
                            dismiss()
                            soundManager.stopPlaying()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        
                    }.frame(width: 330)
                        .padding(.bottom, 700)
                    
                    
                    
                    HStack {
                        Spacer()
                        
                        // MARK: backward button
                        PlayBackControlView(systemName: "gobackward.10", fontSize: .title) {
                            soundManager.player?.currentTime -= 10
                        }
                        Spacer()
                        
                        // MARK: stop button
                        PlayBackControlView(systemName: soundManager.isPlaying ? "pause.fill" : "play.fill", fontSize: .largeTitle) {
                                soundManager.playPause()
                        }
                        Spacer()
                        
//                       // MARK: forward button
                        PlayBackControlView(systemName: "goforward.10", fontSize: .title) {
                            soundManager.player?.currentTime += 10
                        }
                        Spacer()
            }
            .frame(width: 500)
            .padding(.top, 500)
        }
        .onAppear {
            soundManager.playSound(sound: sound, isPreview: false)
            playing = true
            if let duration = soundManager.player?.duration {
                totalDuration = duration
            }
           
        }
        .onReceive(timer) { _ in
            guard let player = soundManager.player else { return }
            currentTime = player.currentTime
            totalDuration = player.duration
        }
        
    }
    
    }
}





#Preview {
    AudioPlayerView(sound: .MeditationSound, previewing: false)
        .environmentObject(SoundManager())
}



