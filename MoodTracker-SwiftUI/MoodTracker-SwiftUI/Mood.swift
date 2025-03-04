//
//  Mood.swift
//  MoodTracker-SwiftUI
//
//  Created by Aavash Kuikel on 3/3/25.
//

import Foundation
import SwiftUI

enum Mood: String, CaseIterable, Codable{
    case veryUnpleasent = "Very Unpleasent"
    case unpleasent = "Unpleasent"
    case neutral = "Neutral"
    case pleasent = "Pleasent"
    case veryPleasent = "Very Pleasent"
    
    var color: Color
    {
        switch self
        {
        case .veryUnpleasent: return .red
        case .unpleasent: return .orange
        case .neutral: return .yellow
        case .pleasent: return .green
        case .veryPleasent: return .blue
        }
    }
}
