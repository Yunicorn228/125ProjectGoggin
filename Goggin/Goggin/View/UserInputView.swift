import SwiftUI

struct UserInputView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var age: String = ""
    @State private var selectedGender: Gender = .other
    @State private var shouldNavigate = false // State to control navigation
    
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
                }) {
                    Text("Submit")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                // Invisible NavigationLink that will activate when shouldNavigate is true
                NavigationLink(destination: LandingView(), isActive: $shouldNavigate) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

// LandingView struct here

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}
