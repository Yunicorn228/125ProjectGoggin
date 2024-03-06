import SwiftUI

struct LandingView: View {
    @State private var foodIntakeProgress: Float = 0.5
    @State private var stepsProgress: Float = 0.7
    @State private var sleepProgress: Float = 0.65
    @State private var navigateToCalorieIntake = false
    @State private var navigateToSteps = false // State for Steps navigation
    @State private var navigateToSleep = false // State for Sleep navigation
    var bmr: Double?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black).ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    // Food Intake Block
                    Button(action: {
                        self.navigateToCalorieIntake = true
                    }) {
                        blockView(title: "Calorie Intake", progress: foodIntakeProgress, imageName: "food")
                    }
                    .background(NavigationLink(destination: CalorieIntakeView(), isActive: $navigateToCalorieIntake) { EmptyView() }.hidden())
                    
                    Spacer()
                    
                    // Steps Block
                    Button(action: {
                        self.navigateToSteps = true // Trigger navigation to Steps
                    }) {
                        blockView(title: "Steps", progress: stepsProgress, imageName: "step")
                    }
                    .background(NavigationLink(destination: StepView(), isActive: $navigateToSteps) { EmptyView() }.hidden()) // Steps navigation
                    
                    Spacer()
                    
                    // Sleep Block
                    Button(action: {
                        self.navigateToSleep = true // Trigger navigation to Sleep
                    }) {
                        blockView(title: "Sleep", progress: sleepProgress, imageName: "sleep")
                    }
                    .background(NavigationLink(destination: SleepView(), isActive: $navigateToSleep) { EmptyView() }.hidden()) // Sleep navigation
                    
                    Spacer()
                }
                .padding()
                .background(Color(.black))
                .edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
    
    // Refactored view for blocks
    func blockView(title: String, progress: Float, imageName: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .padding(.leading)
                    Spacer()
                    ProgressView(value: progress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                        .scaleEffect(x: 1, y: 3, anchor: .center)
                        .frame(height: 20)
                        .padding(.leading)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 220)
        }
        .padding()
        .background(
            Image(imageName)
                .resizable()
                .scaledToFill())
        .cornerRadius(10)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}




