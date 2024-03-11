//
//  GogginApp.swift
//  Goggin
//
//  Created by Zixu Yu on 2/7/24.
//

import SwiftUI

@main
struct GogginApp: App {
    @StateObject var manager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
