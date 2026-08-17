//
//  HomeView.swift
//  Meditatr
//
//  Created by Frank on 3/16/25.
//

import SwiftUI

struct HomeView: View {
    //    @State var complete = false
    @State var showArticlePage = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Image(.yellowG)
                    .resizable()
                    .ignoresSafeArea()
                    
                ScrollView {
                    VStack {
                        //MARK: Exploring Section
                        NavigationLink(destination: ExploreMindView(image: .explore), label: {
                            GroupBox {
                                VStack (alignment: .leading) {
                                    HStack {
                                        Text("Exploring Mindfulness")
                                            .foregroundColor(Color(.origBlack))
                                            .font(.headline)
                                            .fontDesign(.rounded)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color(.origBlack))
                                    }
                                    Text("Mindfulness is paying attention to the present moment with openness, curiosity and without judgement.")
                                        .font(.system(.subheadline))
                                        .fontDesign(.rounded)
                                        .foregroundColor(Color(.origBlack))
                                        .multilineTextAlignment(.leading)
                                        .padding(.top, 3)
                                }.frame(width: 300, height: 100)
                            }
                        })
                        
                        //MARK: Tracker section
                        GroupBox {
                            VStack (alignment: .leading) {
                                Text("Wellness Tracker")
                                    .font(.headline)
                                    .fontDesign(.rounded)
                                
                                HStack {
                                    VStack{
                                        Circle()
                                            .frame(height: 42)
                                            .padding(5)
                                            .foregroundColor(.yellow)
                                        Text("Mon")
                                            .font(.system(.subheadline))
                                            .fontDesign(.rounded)
                                    }
                                    VStack {
                                        Circle()
                                            .frame(height: 42)
                                            .padding(5)
                                            .foregroundColor(.yellow)
                                        Text("Tue")
                                            .font(.system(.subheadline))
                                            .fontDesign(.rounded)
                                    }
                                    VStack {
                                        Circle()
                                            .frame(height: 42)
                                            .padding(5)
                                            .foregroundColor(.yellow)
                                        Text("Wed")
                                            .font(.system(.subheadline))
                                            .fontDesign(.rounded)
                                    }
                                    VStack {
                                        Circle()
                                            .stroke(lineWidth: 1)
                                            .frame(height: 40)
                                            .padding(5)
                                            .foregroundColor(.yellow)
                                        Text("Thur")
                                            .font(.system(.subheadline))
                                            .fontDesign(.rounded)
                                    }
                                    VStack {
                                        Circle()
                                            .stroke(lineWidth: 1)
                                            .frame(height: 40)
                                            .padding(5)
                                            .foregroundColor(.yellow)
                                        Text("Today")
                                            .font(.system(.subheadline))
                                            .fontDesign(.rounded)
                                    }
                                    
                                    .padding(6)
                                    
                                }
                            }
                            
                        }
                        .padding(10)
                        
                        //MARK: Guided meditation Section
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Guided Meditation")
                                .font(.system(.headline))
                                .fontDesign(.rounded)
                                .padding(.top, 5)
                                .padding(.leading, 5)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0.1) {
                                    NavigationLink {
                                        MeditationView( image: .pic1, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        //                                        ItemView(image: "pic1", name: " Guided meditation")
                                        ItemView(course: ItemCourse(image: .pic1, title: "Guided meditation", subtitle: "subtitle"))
                                            .foregroundColor(Color(.origBlack))
                                    }
                                    NavigationLink {
                                        MeditationView( image: .pic2, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        ItemView(course: ItemCourse(image: .pic2, title: "Guided meditation", subtitle: "subtitle"))
                                            .foregroundColor(Color(.origBlack))
                                    }
                                    NavigationLink {
                                        MeditationView( image: .pic3, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        ItemView(course: ItemCourse(image: .pic3, title: "Guided meditation", subtitle: "subtitle"))
                                            .foregroundColor(Color(.origBlack))
                                    }
                                    NavigationLink {
                                        MeditationView( image: .pic4, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        ItemView(course: ItemCourse(image: .pic4, title: "Guided meditation", subtitle: "subtitle"))
                                            .foregroundColor(Color(.origBlack))
                                    }
                                }
                            }
                            
                            
                            
                        }
                        .frame(width: 350)
                        //                    .navigationTitle("Home")
                        
                        //MARK: Sleep meditation Section
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Sleep Sounds")
                                .font(.system(.headline))
                                .fontDesign(.rounded)
                                .padding(.top, 5)
                                .padding(.leading, 5)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 0) {
                                    NavigationLink {
                                        MeditationView( image: .pic4, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        ItemView(course: ItemCourse(image: .pic4, title: "Calming Anxiety", subtitle: "Tamara Levitt"))
                                            .foregroundColor(Color(.origBlack))
                                        //
                                    }
                                    NavigationLink {
                                        MeditationView( image: .pic3, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        ItemView(course: ItemCourse(image: .pic3, title: "Guided meditation", subtitle: "subtitle"))
                                            .foregroundColor(Color(.origBlack))
                                    }
                                    NavigationLink {
                                        MeditationView( image: .pic2, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        ItemView(course: ItemCourse(image: .pic2, title: "Guided meditation", subtitle: "subtitle"))
                                            .foregroundColor(Color(.origBlack))
                                    }
                                    NavigationLink {
                                        MeditationView( image: .pic1, meditationVM: MeditationViewModel(meditation: Meditation.data))
                                    } label: {
                                        ItemView(course: ItemCourse(image: .pic1, title: "Guided meditation", subtitle: "subtitle"))
                                            .foregroundColor(Color(.origBlack))
                                    }
                                }
                            }
                            
                            //                        }
                            
                            
                        }/*.padding(10)*/
                        .frame(width: 350)
                        
                        //MARK: Article Section
                        VStack (alignment: .leading, spacing: 2) {
                            Text("Articles")
                                .font(.title.bold())
                                .padding(.top, 10)
                                .padding(.leading, 20)
                            Button(action: {
                                showArticlePage.toggle()
                            }, label: {
                                CardView(course: DTCourse(image: .article2, title: "Benefits of Meditation", subtitle: "A guide on how to live a healthy life"))
                                    .foregroundColor(Color(.origBlack))
                                    .sheet(isPresented: $showArticlePage) {
                                        NavigationStack {
                                            VStack {}
                                                .navigationTitle("Working with Meditation")
                                        }
                                    }
                            }
                            )
                            Button(action: {
                                showArticlePage.toggle()
                            }, label: {
                                CardView(course: DTCourse(image: .pic4, title: "Benefits of Meditation", subtitle: "A guide on how to live a healthy life"))
                                    .foregroundColor(Color(.origBlack))
                                    .sheet(isPresented: $showArticlePage) {
                                        NavigationStack {
                                            VStack {}
                                                .navigationTitle("Working with Meditation")
                                        }
                                    }
                            }
                            )
                            Button(action: {
                                showArticlePage.toggle()
                            }, label: {
                                CardView(course: DTCourse(image: .pic2, title: "Benefits of Meditation", subtitle: "A guide on how to live a healthy life"))
                                    .foregroundColor(Color(.origBlack))
                                    .sheet(isPresented: $showArticlePage) {
                                        NavigationStack {
                                            VStack {}
                                                .navigationTitle("Working with Meditation")
                                        }
                                    }
                            }
                            )
                        }
                    }
                    
                }
            }.navigationTitle("Home")
        }
        
        
    }

    
    
}





#Preview {
    HomeView()
}
