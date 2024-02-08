//
//  UserInputView.swift
//  Goggin
//
//  Created by Zixu Yu on 2/7/24.
//

import SwiftUI

struct UserInputView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var age: String = ""
    @State private var selectedGender: Gender = .other
    
    enum Gender: String, CaseIterable, Identifiable {
        case male = "Male"
        case female = "Female"
        case other = "Other"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("User Details")
        }
    }
}

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}
