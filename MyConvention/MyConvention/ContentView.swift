//
//  ContentView.swift
//  MyConvention
//
//  Created by SUPER on 2021/6/9.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var output = ""
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("from", text: $input)
                    
                }
                
                Section {
                    Text("\(output)")
                }
            }
            .navigationBarTitle("MyConvertion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
