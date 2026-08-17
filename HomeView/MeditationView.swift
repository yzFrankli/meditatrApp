//
//  MeditationView.swift
//  Meditatr
//
//  Created by Frank on 3/20/25.
//

import SwiftUI

struct MeditationView: View {
    var image: ImageResource
    var sound: SoundOptions = .MeditationSound
    @State var showPlayer = false
    @StateObject var meditationVM: MeditationViewModel
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
//                Color(red: 24/255, green: 23/255, blue: 22/255)
//                    .frame(height: UIScreen.main.bounds.height * 2 / 3)
//                    .edgesIgnoringSafeArea(.all)
                
                
                VStack(alignment: .leading) {
                    Text("Music")
                        .foregroundColor(.white).opacity(0.5)
//                        .padding()
                    
                    Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "S")
                        .foregroundColor(.white).opacity(0.5)
                        .padding(.bottom, 10)
//                    VStack (alignment: .center) {
                        Text("9 minute relaxing meditation")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        
                        Button {
                            showPlayer = true
                        } label: {
                            Label("Play", systemImage: "play.fill")
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.origBlack)
                                .background(.white)
                                .cornerRadius(20)
                                .font(.headline)
                        }
                        
                        Text("Clear your mind and slumber into nothingness. Allocate only a few moments for a quick breather.")
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .fontDesign(.rounded)
                            .font(.body).opacity(0.8)
                        //
                        Spacer()
//                    }
                }  .padding(.top, 0)
                    .padding(20)
            }
        }
        .background(Color(red: 24/255, green: 23/255, blue: 22/255))

        .ignoresSafeArea(edges: .top)
        .fullScreenCover(isPresented: $showPlayer, content: {
            AudioPlayerView(sound: sound, previewing: false)
                
        })
        
    }
}

#Preview {
    // this solves the parameter issue for MeditationViewModel by placing a dummy variable meditation
    // the structure solves the issue of not able to put multiple views in #Preview (inspired by https://stackoverflow.com/questions/77566733/getting-amibiguous-use-of-init-traitsbody-error-with-preview-in-xcode-15)
    MeditationView(
        image: .pic4,
        sound: .MeditationSound,
        meditationVM: MeditationViewModel(
            meditation: Meditation.data
        )
    )
    .environmentObject(SoundManager())
}
