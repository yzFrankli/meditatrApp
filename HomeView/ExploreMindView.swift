//
//  ExploreMindView.swift
//  Meditatr
//
//  Created by Frank on 3/16/25.
//

import SwiftUI

struct ExploreMindView: View {
    var image: ImageResource
    @State var showPlayer = false
//    @StateObject var meditationVM: MeditationViewModel
    
    var body: some View {

        NavigationStack {
                    ScrollView {
                VStack {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height / 3)
                        .ignoresSafeArea()
                    ZStack {
                        
                        
                        VStack(alignment: .leading) {
                            Text("Article")
                                .foregroundColor(.white).opacity(0.5)
                            
                            Text("Exploring Meditation")
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Text("Meditation is a mental exercise that trains attention and awareness. Its purpose is often to curb reactivity to one's negative thoughts and feelings, which, though they may be disturbing and upsetting and hijack attention from moment to moment, are invariably fleeting.")
                                .padding(.top, 20)
                                .fontDesign(.rounded)
                                .font(.body).opacity(0.8)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("How to Meditatie")
                                .padding(.top, 20)
                                .fontDesign(.rounded)
                                .font(.headline).opacity(0.8)
                            Text("Most forms of meditation are meant to decrease distractibility and promote focus on and enjoyment of the present moment. Like many forms of meditation, requires that one turn attention to a single point of reference. It can involve focusing on the breath, on bodily sensations, or on a word or phrase, known as a mantra. Successful meditation takes into account both internal and physical states.")
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.top, 10)
                                .fontDesign(.rounded)
                                .font(.body).opacity(0.8)
                            
                            Text("Why should I try meditation?")
                                .padding(.top, 10)
                                .fontDesign(.rounded)
                                .font(.headline).opacity(0.8)
                            
                            Text("Meditation has been shown to increase focus, reduce stress, and promote calmness. It can also help people recognize and accept negative emotions—especially when it is done in combination with mindfulness practices that keep people grounded in experiencing the present. It may be particularly effective when the meditator has social support, such as in a structured group setting or with the help of a friend or family member.")
                                .padding(.top, 10)
                                .fontDesign(.rounded)
                                .font(.body).opacity(0.8)
                            
                            Text("Exerpt from Psychology Today")
                                .padding(.top, 20)
                                .fontDesign(.rounded)
                                .font(.callout).opacity(0.4)
                            Spacer()
                            //                    }
                        }  .padding(.top, 0)
                            .padding(30)
                    }
                }
                .background(Color("articleBg"))
                .padding(.bottom, 80)
                .ignoresSafeArea(.all)
                
            }
        }
            
    }
}

#Preview {
    ExploreMindView(image: .explore)
}
