//
//  MeditationViewModel.swift
//  Meditatr
//
//  Created by Frank on 3/20/25.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}


struct Meditation {
  
    
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 minute relaxing meditation", description: "clear your mind and begin slumber", duration: 70, track: "MeditationSound", image: "pic1")
    
}
