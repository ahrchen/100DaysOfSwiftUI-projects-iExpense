//
//  ContentView.swift
//  iExpense
//
//  Created by Raymond Chen on 2/20/22.
//

import SwiftUI

struct User: Codable {
    let firstUser: String
    let lastUser: String
}
struct ContentView: View {
    @State private var user = User(firstUser: "Taylor", lastUser: "Swift")
        
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
