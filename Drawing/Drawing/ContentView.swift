//
//  ContentView.swift
//  Drawing
//
//  Created by SUPER on 2021/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 30)
            .frame(width: 300, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
