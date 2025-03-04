//
//  MoodSelectionScreenViewModel.swift
//  MoodTracker-SwiftUI
//
//  Created by Aavash Kuikel on 3/3/25.
//

import Foundation
import Observation

@Observable class MoodSelectionScreenViewModel {
    var moodValue: Double = 0
    var selectedMood: Mood {
        let index = Int(round(moodValue))
        return Mood.allCases[index]
        
    }
    
    func updateMoodValue(sliderXValue: CGFloat, stepWidth: CGFloat, size: CGFloat, trackWidth: CGFloat){
        let minX: CGFloat = 0
        let maxX: CGFloat = trackWidth - size
        let clampedX = min(max(minX, sliderXValue), maxX)
        
        let step = round(clampedX / stepWidth)
    
        self.moodValue = Double(step)
    
    }
}
