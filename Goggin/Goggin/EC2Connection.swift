//
//  EC2Connection.swift
//  Goggin
//
//  Created by Zixu Yu on 3/13/24.
//

// swift-tools-version:5.3
//import Foundation
//
//// Example data to send
//let userData: [String: Any] = ["name": "Jane Doe", "age": 28, "gender": "female"]
//
//// Convert your data to JSON
//guard let jsonData = try? JSONSerialization.data(withJSONObject: userData) else {
//  print("Error: Cannot convert data to JSON")
//  return
//}
//
//// Specify the URL of your EC2 instance running the Node.js app
//let url = URL(string: "http://your-ec2-instance-public-ip:3000/data")!
//
//// Create a URLRequest object
//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//request.httpBody = jsonData
//request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//// Send the request
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//  guard let data = data, error == nil else {
//    print("Error: \(error?.localizedDescription ?? "Unknown error")")
//    return
//  }
//  // Process the response here
//  print(String(data: data, encoding: .utf8) ?? "")
//}
//
//task.resume()

