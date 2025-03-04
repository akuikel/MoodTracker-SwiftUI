//
//  MoodTracker_SwiftUIApp.swift
//  MoodTracker-SwiftUI
//
//  Created by Aavash Kuikel on 2/26/25.
//

import SwiftUI
import SwiftData

@main
struct MoodTracker_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MoodSelectionScreen()
        }
        .modelContainer(for: SavedMood.self)
    }
}
