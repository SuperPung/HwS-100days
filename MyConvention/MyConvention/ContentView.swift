//
//  ContentView.swift
//  MyConvention
//
//  Created by SUPER on 2021/6/9.
//

import SwiftUI

struct ContentView: View {
    @State private var isMetric2English = true
    @State private var input = ""
    @State private var output = ""
    
    var inArray: [VolumeUnit] {
        return isMetric2English ? MetricUnits : EnglishUnits
    }
    var outArray: [VolumeUnit] {
        return isMetric2English ? EnglishUnits : MetricUnits
    }
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
