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
    @State private var inIndex = 0
    @State private var outIndex = 0
    
    var inArray: [VolumeUnit] {
        return isMetric2English ? MetricUnits : EnglishUnits
    }
    var outArray: [VolumeUnit] {
        return isMetric2English ? EnglishUnits : MetricUnits
    }
    
    var result: Double {
        var outNum: Double = 0
        
        let inRate = inArray[inIndex].ratio
        let outRate = outArray[outIndex].ratio
        
        let inNum = Double(input) ?? 0
        let rate = isMetric2English ? 1/28316.8466 : 28316.8466
        
        outNum = inNum * inRate * inNum * rate / outRate
        return outNum
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {self.isMetric2English.toggle()}) {
                    Text(isMetric2English ? "公制 -> 英制" : "英制 -> 公制")
                        .font(.headline)
                }
                .frame(width: 120, height: 40)
                .foregroundColor(.white)
                .background(Color(.black))
                .cornerRadius(CGFloat(10.0))
                .shadow(radius: CGFloat(15.0))
                
                Form {
                    Section (header: Text("将 \(isMetric2English ? "公制" : "英制")")
                                .font(.subheadline).bold()
                    ){
                        TextField("输入\(isMetric2English ? "公制" : "英制")容积", text: $input)
                            .frame(maxWidth: .infinity)
                            .keyboardType(.decimalPad)
                        
                        Picker("", selection: $inIndex) {
                            ForEach(0 ..< inArray.count) {index in
                                Text(self.inArray[index].unitName)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section (header: Text("转换为 \(!isMetric2English ? "公制" : "英制")")
                                .font(.subheadline).bold()
                    ){
                        Text("单位")
                        Picker("", selection: $outIndex) {
                            ForEach(0 ..< outArray.count) {index in
                                Text(self.outArray[index].unitName)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section (header: Text("结果")
                                .font(.subheadline).bold()
                    ) {
                        Text("\(result, specifier: "%.2f")")
                    }
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
