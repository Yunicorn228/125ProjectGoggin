//
//  ContentView.swift
//  Goggin
//
//  Created by Zixu Yu on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                Image("logo")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                Text("GOGIN")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.pink)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
