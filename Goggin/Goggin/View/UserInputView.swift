import SwiftUI

struct UserInputView: View {
    
    @EnvironmentObject var healthManager: HealthManager

    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var age: String = ""
    @State private var selectedGender: Gender = .other
    @State private var shouldNavigate = false
    @State private var calculatedBMR: Float?
    
    enum Gender: String, CaseIterable, Identifiable {
        case male = "Male"
        case female = "Female"
        case other = "Other"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Your Details")) {
                        TextField("Height (cm)", text: $height)
                            .keyboardType(.numberPad)
                        TextField("Weight (kg)", text: $weight)
                            .keyboardType(.numberPad)
                        TextField("Age", text: $age)
                            .keyboardType(.numberPad)
                        Picker("Gender", selection: $selectedGender) {
                            ForEach(Gender.allCases) { gender in
                                Text(gender.rawValue).tag(gender)
                            }
                        }
                    }
                }
                .background(Color.black.edgesIgnoringSafeArea(.all)) // Set the form's background to black

                Button(action: {
                    // Validate input and navigate to LandingView
                    self.shouldNavigate = true
                    if let weight = Double(weight), let height = Double(height), let age = Int(age) {
                        calculatedBMR = calculateBMR(weight: weight, height: height, age: age, gender: selectedGender)
                        shouldNavigate = true
                    }
                }) {
                    Text("Submit")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 70)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding()
                
                // Invisible NavigationLink that will activate when shouldNavigate is true
                NavigationLink(destination: LandingView(bmr: calculatedBMR), isActive: $shouldNavigate) {
                    EmptyView()
                }
            }
            .onAppear{
                healthManager.fetchTodayCal()
                healthManager.fetchTodaySleep()
                healthManager.fetchTodaySteps()
            }
            
            .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    

    func calculateBMR(weight: Double, height: Double, age: Int, gender: Gender) -> Float {
        let weightComponent: Double
        let heightComponent: Double
        let ageComponent: Double
        let baseValue: Double

        switch gender {
        case .female:
            weightComponent = 9.6 * weight
            heightComponent = 1.8 * height
            ageComponent = 4.7 * Double(age)
            baseValue = 655
        case .male:
            weightComponent = 13.7 * weight
            heightComponent = 5 * height
            ageComponent = 6.8 * Double(age)
            baseValue = 66
        case .other:
            let maleBMR = 66 + (13.7 * weight) + (5 * height) - (6.8 * Double(age))
            let femaleBMR = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * Double(age))
            return Float((maleBMR + femaleBMR) / 2)
        }

        return Float(baseValue + weightComponent + heightComponent - ageComponent)
    }


}

// LandingView struct here

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}
