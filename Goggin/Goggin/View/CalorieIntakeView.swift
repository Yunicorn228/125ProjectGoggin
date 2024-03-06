//
//  CalorieIntakeView.swift
//  Goggin
//
//  Created by Zixu Yu on 2/23/24.
//

import SwiftUI

struct CalorieIntakeView: View {
    // Replace with your actual data source
    @State private var calorieIntakeProgress: Float = 0.4
    let recommendedFoods = [("Fish", 500), ("Beef", 800), ("Veggie", 230)]
    
    var body: some View {
        VStack {
            // Back button and progress
            // Progress bar
            ProgressView("Calorie Intake Goal", value: calorieIntakeProgress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .scaleEffect(x: 1, y: 2, anchor: .center) // Modify for your desired thickness
                .padding()
            
            // Completion percentage text
            Text("You completed \(Int(calorieIntakeProgress * 100))% of calorie intake goal")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            // Recommended food list
            VStack(alignment: .leading) {
                Text("Recommended Food:")
                    .font(.headline)
                    .padding(.bottom, 5)
                ForEach(recommendedFoods, id: \.0) { food in
                    HStack {
                        Text(food.0) // Food name
                        Spacer()
                        Text("\(food.1) cal") // Calorie count
                    }
                    .padding(.vertical, 2)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            Spacer()
        }
        // If using a navigation view, to hide the back button
        .navigationBarTitleDisplayMode(.inline) // If using a navigation view, to adjust the title display mode
        .padding()
    }
}

struct CalorieIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieIntakeView()
    }
}

