//
//  ContentView.swift
//  Goggin
//
//  Created by Zixu Yu on 2/7/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if isActive {
                    UserInputView()
                } else {
                    ZStack{
                        Color(.black)
                        Image("logo") // Replace with your image name
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        VStack{
                            Image("logo")
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .padding(.all)
                            Text("Tap for Motivation")
                                .font(.largeTitle)
                                .padding(100)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    self.isActive = true
                                }
                        }
                    }
                    
                }
            }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(HealthManager())
    }
}
