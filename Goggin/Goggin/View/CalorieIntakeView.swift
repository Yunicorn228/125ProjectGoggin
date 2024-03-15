//
//  CalorieIntakeView.swift
//  Goggin
//
//  Created by Zixu Yu on 2/23/24.
//

import SwiftUI


struct CalorieIntakeView: View {
    var progress: Float
        
    @EnvironmentObject var healthManager: HealthManager
    
//    let CalorieIntake: String

    let recommendedFoods = [("Fish", 410), ("Beef", 800), ("Chicken", 450), ("Egg", 70)]
    
    var body: some View {
        VStack {
//            Text("Sleep: \(healthManager.sleep)")
//                .font(.largeTitle)
//                .foregroundColor(.white) // Set title color to white
//                .padding(.bottom, 2)
            Text("Calorie Intake Goal")
                .font(.largeTitle)
                .foregroundColor(.white) // Set title color to white
                .padding(.bottom, 2)
            
            // Progress view without the built-in title
            ProgressView(value: progress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .scaleEffect(x: 1, y: 2, anchor: .center)
                .padding()
            
            Text("You completed \(Int(progress * 100))% of calorie intake goal")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white) // Set text color to white
                .padding()
            
            VStack(alignment: .leading) {
                Text("Recommended Food: ")
                    .font(.headline)
                    .foregroundColor(.white) // Set text color to white
                    .padding(.bottom, 5)
                
                ForEach(recommendedFoods, id: \.0) { food in
                    HStack {
                        Text(food.0)
                            .foregroundColor(.white) // Set text color to white
                        Spacer()
                        Text("\(food.1) cal")
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

// Add this extension if it's not already in your project
extension View {
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, tintColor: tintColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor
    var tintColor: UIColor
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = backgroundColor
                appearance.titleTextAttributes = [.foregroundColor: tintColor]
                appearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
                
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                UINavigationBar.appearance().tintColor = tintColor
            }
    }
}

struct CalorieIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieIntakeView(progress:0.5)
    }
}


