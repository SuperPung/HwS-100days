//
//  ContentView.swift
//  Voice
//
//  Created by SUPER on 2021/8/16.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "郁金香",
        "冷冻树芽",
        "向日葵",
        "焰火"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
//        Image(pictures[selectedPicture])
//            Image(decorative: "character")
//            .resizable()
//            .scaledToFit()
//            .onTapGesture {
//                self.selectedPicture = Int.random(in: 0...3)
//            }
//            .accessibility(label: Text(labels[selectedPicture]))
//            .accessibility(addTraits: .isButton)
//            .accessibility(removeTraits: .isImage)
//            .environment(\.locale, Locale(identifier: "zh_CN"))
        VStack {
            Text("你的分数是")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .combine)
        .environment(\.locale, Locale(identifier: "zh_CN"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
