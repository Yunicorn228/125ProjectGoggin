import SwiftUI

struct LandingView: View {
    
    @EnvironmentObject var manager: HealthManager
    
    
//    @State private var foodIntakeProgress: Float = 0.7
//    @State private var stepsProgress: Float = 0.7
//
//
//    @State private var sleepProgress: Float = 0.65
    @State private var navigateToCalorieIntake = false
    @State private var navigateToSteps = false // State for Steps navigation
    @State private var navigateToSleep = false // State for Sleep navigation
    var bmr: Float?
    
    
    
    var body: some View {
//        Text("Your BMR is \(bmr ?? 0)")
        NavigationView {
            ZStack {
                Color(.black).ignoresSafeArea()
                VStack {
                    Spacer()
                    let progressValue = min(max(manager.cal / (bmr ?? 200), 0), 1)
                    // Food Intake Block
                    Button(action: {
                        
                        self.navigateToCalorieIntake = true
                    }) {
                        
                        blockView(title: "Calorie Intake", progress: progressValue, imageName: "food")
                    }
                    .background(NavigationLink(destination: CalorieIntakeView(progress: progressValue), isActive: $navigateToCalorieIntake) { EmptyView() }.hidden())
                    
                    Spacer()
                    let stepsProgress = min(max(manager.step / 50000, 0), 1)
                    // Steps Block
                    Button(action: {
                        self.navigateToSteps = true // Trigger navigation to Steps
                    }) {
                        
                        blockView(title: "Steps", progress: stepsProgress, imageName: "step")
                    }
                    .background(NavigationLink(destination: StepView(progress: stepsProgress), isActive: $navigateToSteps) { EmptyView() }.hidden()) // Steps navigation
                    
                    Spacer()
                    let sleepProgress = min(max(manager.sleep / 8, 0), 1)
                    // Sleep Block
                    Button(action: {
                        self.navigateToSleep = true // Trigger navigation to Sleep
                    }) {
                        
                        blockView(title: "Sleep", progress: sleepProgress, imageName: "sleep")
                    }
                    .background(NavigationLink(destination: SleepView(progress: sleepProgress), isActive: $navigateToSleep) { EmptyView() }.hidden()) // Sleep navigation
                    
                    Spacer()
                }
//                .padding()
//                .background(Color(.black))
//                .edgesIgnoringSafeArea(.all)
//                .navigationBarBackButtonHidden(true)
//                .navigationBarTitle("", displayMode: .inline)
            }
            .padding()
            .background(Color(.black))
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        }
        .padding()
        .background(Color(.black))
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
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
            .frame(maxWidth: .infinity, maxHeight: 180)
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




