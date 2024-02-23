import SwiftUI

struct LandingView: View {
    // Sample values for progress, replace with your actual data source
    @State private var foodIntakeProgress: Float = 0.5
    @State private var stepsProgress: Float = 0.7
    @State private var sleepProgress: Float = 0.65

    var body: some View {
        
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Spacer() // Adds space at the top
                
                // Food Intake Block
                VStack(alignment: .leading) { // Aligns content to the leading edge
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Calorie Intake")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            ProgressView(value: foodIntakeProgress, total: 1.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: .white))
                                .scaleEffect(x: 1, y: 3, anchor: .center) // Thicker progress bar
                                .frame(height: 20)
                                .padding(.leading)
                        }
                        Spacer() // Pushes content to the left
                    }
                    .frame(maxWidth: .infinity, maxHeight: 220)
                }
                .padding()
                .background(
                    Image("food") // Replace with your image name
                    .resizable()
                    .scaledToFill())
                .cornerRadius(10)
                
                Spacer() // Adds space between blocks
                
                // Steps Block
                VStack(alignment: .leading) { // Aligns content to the leading edge
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Steps")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            ProgressView(value: stepsProgress, total: 1.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: .white))
                                .scaleEffect(x: 1, y: 3, anchor: .center) // Thicker progress bar
                            
                                .frame(height: 20)
                                .padding(.leading)
                        }
                        Spacer() // Pushes content to the left
                    }
                    .frame(maxWidth: .infinity, maxHeight: 220)
                }
                .padding()
                .background(
                    Image("step") // Replace with your image name
                    .resizable()
                    .scaledToFill())
                .cornerRadius(10)
                
                Spacer() // Adds space between blocks
                
                // Sleep Block
                VStack(alignment: .leading) { // Aligns content to the leading edge
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Sleep")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            ProgressView(value: sleepProgress, total: 1.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: .white))
                                .scaleEffect(x: 1, y: 3, anchor: .center) // Thicker progress bar
                            
                                .frame(height: 20)
                                .padding(.leading)
                        }
                        Spacer() // Pushes content to the left
                    }
                    .frame(maxWidth: .infinity, maxHeight: 220)
                }
                .padding()
                .background(
                    Image("sleep") // Replace with your image name
                    .resizable()
                    .scaledToFill())
                .cornerRadius(10)
                
                Spacer() // Adds space at the bottom
            }
        }
        .padding() // Adds margin around the entire VStack
        .background(Color(.black))
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true) // This hides the back button
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}



