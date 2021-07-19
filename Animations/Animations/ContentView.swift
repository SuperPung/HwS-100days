//
//  ContentView.swift
//  Animations
//
//  Created by SUPER on 2021/7/18.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            
            Button("Tap me") {
                withAnimation {
                    self.animationAmount += 360
                }
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(
                .degrees(animationAmount),
                axis: (x: 0.0, y: 0.0, z: 1.0)
            )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
