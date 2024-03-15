//
//  mongoDB.swift
//  Goggin
//
//  Created by Zixu Yu on 3/13/24.
//
import Foundation
//import MongoSwift

struct UserData: Codable {
    var height: Double
    var weight: Double
    var age: Int
    var gender: String
}

func sendDataToServer(userData: UserData) {
    guard let url = URL(string: "https://yourbackendserver.com/api/storeUserData") else {
        print("Invalid URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        let jsonData = try JSONEncoder().encode(userData)
        request.httpBody = jsonData
    } catch {
        print("Failed to encode user data: \(error)")
        return
    }
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Client error: \(error)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("Server error: \(response.debugDescription)")
            return
        }
        
        if let mimeType = httpResponse.mimeType, mimeType == "application/json",
           let data = data,
           let dataString = String(data: data, encoding: .utf8) {
            print("Server response: \(dataString)")
        }
    }
    
    task.resume()
}
