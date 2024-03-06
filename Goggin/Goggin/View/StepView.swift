//
//  StepView.swift
//  Goggin
//
//  Created by Zixu Yu on 3/6/24.
//

import SwiftUI

struct StepView: View {
    @State private var calorieIntakeProgress: Float = 0.4
    let recommendedFoods = [("Park", 5.2), ("UTC", 1.2), ("Gym", 0.8)]
    
    var body: some View {
        VStack {
            Text("Step Count Goal")
                .font(.largeTitle)
                .foregroundColor(.white) // Set title color to white
                .padding(.bottom, 2)
            
            // Progress view without the built-in title
            ProgressView(value: calorieIntakeProgress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .scaleEffect(x: 1, y: 2, anchor: .center)
                .padding()
            
            Text("You completed \(Int(calorieIntakeProgress * 100))% of step count goal")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white) // Set text color to white
                .padding()
            
            VStack(alignment: .leading) {
                Text("Recommended Run:")
                    .font(.headline)
                    .foregroundColor(.white) // Set text color to white
                    .padding(.bottom, 5)
                
                ForEach(recommendedFoods, id: \.0) { food in
                    HStack {
                        Text(food.0)
                            .foregroundColor(.white) // Set text color to white
                        Spacer()
                        Text(String(format: "%g mile", food.1))
                            .foregroundColor(.white) // Set text color to white
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
        .padding()
        .background(Color.black) // Set the background to black
        .navigationBarTitleDisplayMode(.inline)
        // Set navigation bar elements to white if this view is embedded in a NavigationView

        .navigationBarColor(backgroundColor: .black, tintColor: .white) // This is a custom modifier, see below
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView()
    }
}
