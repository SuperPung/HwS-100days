//
//  ContentView.swift
//  iExpense
//
//  Created by SUPER on 2021/7/20.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                self.tapCount += 1
                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            }
            
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
