//
//  ContentView.swift
//  MoodTracker-SwiftUI
//
//  Created by Aavash Kuikel on 2/26/25.
//

import SwiftUI

enum Mood: String{
    case veryUnpleasent = "Very Unpleasent"
    case unpleasent = "Unpleasent"
    case neutral = "Neutral"
    case pleasent = "Pleasent"
    case veryPleasent = "Very Pleasent"
    
    var color: Color
    {
        switch self
        {
        case .veryUnpleasent: return Color.red
        case .unpleasent: return Color.orange
        case .neutral: return Color.yellow
        case .pleasent: return Color.green
        case .veryPleasent: return Color.blue
        }
    }
}

struct ContentView: View {
    
    @State private var moodValue: Double=0
    
    private var selectedMood: Mood {
        switch moodValue {
        case 0: return .veryPleasent
        case 1: return .unpleasent
        case 2: return .neutral
        case 3: return .pleasent
        case 4: return .veryPleasent
        default: return .neutral
        }
        
    }
    
    var body: some View {
        ZStack {
            selectedMood.color
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
           
            VStack {
                Text("How are you feeling today?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                
                BlobView(color: selectedMood.color)
                
                Spacer()
                
                
                Text(selectedMood.rawValue)
                    .font(.title)
                
                Spacer()
                
                MoodSlider(moodValue: $moodValue)
                
                Spacer()
                
                Button{
                    
                } label:{
                    Text("Save")
                        .font(.headline)
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(selectedMood.color)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(40)
        }
        

        
    }
}

struct MoodSlider: View{
    private let size: CGFloat = 40
    private let trackWidth: CGFloat = 300
    @Binding var moodValue : Double
    @State private var xValue: CGFloat = 0
    private let steps = 5
    
    
    var body: some View{
        let stepWidth = (trackWidth-size) / CGFloat (steps-1)
       
        ZStack(alignment: .leading){
            Capsule()
                .frame(width: trackWidth, height:size)
                .opacity(0.2)
                .foregroundStyle(Color.gray)
        

            Circle()
                .frame(width:size, height: size)
                .offset(x: xValue)
                .foregroundStyle(Color.white)
                .shadow(radius: 1)
                .gesture(DragGesture().onChanged {
                       value in
                    let minX: CGFloat = 0
                    let maxX: CGFloat = trackWidth - size
                    let clampedX = min(max(minX, value.location.x), maxX)
                    let step = round(clampedX / stepWidth)
                

                    self.xValue = step * stepWidth
                    self.moodValue = Double(step)
                })
            
            
        }
    }
}

struct BlobView: View {
    
    var color: Color
    
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .frame(width:200, height: 200)
    }
}

#Preview {
    ContentView()
}
