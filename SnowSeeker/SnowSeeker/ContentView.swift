//
//  ContentView.swift
//  SnowSeeker
//
//  Created by SUPER on 2021/9/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New secondary")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Primary")

            Text("Secondary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
