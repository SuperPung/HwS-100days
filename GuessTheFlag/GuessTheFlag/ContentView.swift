//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by SUPER on 2021/7/9.
//

import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: Color.black, radius: 2)
    }
}

extension View {
    func flagImageStyle() -> some View {
        self.modifier(FlagImage())
    }
}

struct ContentView: View {
    let labels = [
        "Estonia": "国旗有三个大小相等的横纹。蓝色条纹,中间黑色条纹,底部白色条纹",
        "France": "国旗有三个同等大小的垂直条纹。留下条纹蓝色,中间白色条纹,条纹的红色",
        "Germany": "国旗有三个大小相等的横纹。顶级条纹的黑色,中间红色条纹,条纹底黄金",
        "Ireland": "国旗有三个同等大小的垂直条纹。离开绿色条纹,条纹中间白色,橙色条纹",
        "Italy": "国旗有三个同等大小的垂直条纹。留下条纹绿色,中间白色条纹,条纹的红色",
        "Nigeria": "国旗有三个同等大小的垂直条纹。留下条纹绿色,中间白色条纹,条纹绿色",
        "Poland": "旗帜上写着两个相等大小的横纹。上条纹的白色,下条纹红色",
        "Russia": "国旗有三个大小相等的横纹。条纹的白色,中间条纹蓝色,底部红色条纹",
        "Spain": "国旗有三横纹。细条纹的红色,中间粗条纹黄金波峰左边,底部红色细条纹",
        "UK": "国旗与重叠的红色和白色的十字架,直和对角线,在蓝色的背景上",
        "US": "国旗的红色和白色条纹大小相等,与白色星星左上角的蓝色背景"
    ]
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.red, .blue, .purple, .pink, .red]), center: .center)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) {number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .flagImageStyle()
                            .accessibility(label: Text(self.labels[self.countries[number], default: "未知国旗"]))
                    }
                }
                
                Text("Your score is \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        .environment(\.locale, Locale(identifier: "zh_CN"))
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage = "Congratulations! Have another try?"
        } else {
            scoreTitle = "Wrong"
            score -= 1
            scoreMessage = "Wrong! That's the flag of \(countries[number])!"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
