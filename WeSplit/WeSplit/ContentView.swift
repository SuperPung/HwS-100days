//
//  ContentView.swift
//  WeSplit
//
//  Created by SUPER on 2021/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .padding()
                    .keyboardType(.decimalPad)
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                            .padding()
                    }
                }
            }
            Section {
                Text("$\(checkAmount)")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
