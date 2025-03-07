//
//  ContentView.swift
//  MoodTracker-SwiftUI
//
//  Created by Aavash Kuikel on 2/26/25.
//

import Foundation
import SwiftUI
import SwiftData

struct MoodSelectionScreen: View {
    @Environment(\.modelContext) var context
    var viewModel = MoodSelectionScreenViewModel()
    @Query(sort: \SavedMood.date) var savedMoods: [SavedMood]
    

    var body: some View {
        ZStack {
            viewModel.selectedMood.color
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
           
            VStack {
                Text("How are you feeling today?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                
                BlobView(color: viewModel.selectedMood.color)
                    .onTapGesture {
                        savedMoods.forEach {mood in
                            print(mood.date)
                            print(mood.mood.rawValue)
                        }
                    }
                
                Spacer()
                
                
                Text(viewModel.selectedMood.rawValue)
                    .font(.title)
                
                Spacer()
                
                MoodSlider(viewModel: viewModel)
                
                Spacer()
                
                Button{
                    context.insert(SavedMood(date: Date(), mood: viewModel.selectedMood))
                    
                } label:{
                    Text("Save")
                        .font(.headline)
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(viewModel.selectedMood.color)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(40)
        }
        

        
    }
}

struct MoodSlider: View{
    var viewModel : MoodSelectionScreenViewModel
    
    private let size: CGFloat = 40
    private let trackWidth: CGFloat = 300
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
                    viewModel.updateMoodValue(sliderXValue: value.location.x, stepWidth: stepWidth, size: size, trackWidth: trackWidth)
                    xValue = CGFloat(viewModel.moodValue) * stepWidth
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
    MoodSelectionScreen()
}
