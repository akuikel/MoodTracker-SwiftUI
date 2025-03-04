//
//  SavedMood.swift
//  MoodTracker-SwiftUI
//
//  Created by Aavash Kuikel on 3/3/25.
//

import Foundation
import SwiftData

@Model
class SavedMood {
    var date : Date
    var mood : Mood
    
    init(date: Date, mood: Mood) {
        self.date = date
        self.mood = mood
    }
    
}
