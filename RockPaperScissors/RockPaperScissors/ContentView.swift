//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by SUPER on 2021/7/17.
//

import SwiftUI

struct First {
    var id: Int
    var imageName = ""
    var name = ""
}

let firstArray = [
    First(id: 0, imageName: "cube.fill", name: "Rock"),
    First(id: 1, imageName: "scissors", name: "Scissors"),
    First(id: 2, imageName: "stop.fill", name: "Paper")
]

struct card: View {
    var playerName: String
    var first: First
    
    var body: some View {
        VStack {
            Text(playerName)
                .font(.title)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
            
            Image(systemName: first.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.red)
                .padding()
            
            Text(first.name)
                .font(.title)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 250)
        .border(Color.blue, width: 2)
    }
}

struct ContentView: View {
    
    @State var aiFirst = First(id: -1)
    @State var playerFirst = First(id: -1)
    @State var lastAiFirst = First(id: -1)
    
    @State var result = ""
    
    @State var games = 0
    @State var playerWin = 0
    @State var evenGames = 0
    
    func pk(ai: First, player: First) {
        games += 1
        
        if ai.id == player.id {
            result = "平局"
            evenGames += 1
        } else if (ai.id - player.id) == -1 || (ai.id - player.id) == 2 {
            result = "AI胜"
        } else {
            result = "玩家胜"
            playerWin += 1
        }
    }
    
    var body: some View {
        VStack {
            Text("Rocks, Paper, Scissors!")
                .font(.largeTitle)
                .padding()
            
            HStack {
                card(playerName: "AI", first: lastAiFirst)
                card(playerName: "Player", first: playerFirst)
            }
            
            HStack {
                ForEach (0 ..< 3) {index in
                    Button(action: {
                        self.aiFirst = firstArray[Int.random(in: 0...2)]
                        self.lastAiFirst = self.aiFirst
                        self.playerFirst = firstArray[index]
                        self.pk(ai: self.lastAiFirst, player: self.playerFirst)
                    }) {
                        Image(systemName: firstArray[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 80, height: 40)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            Text("本局结果：\(result)")
                .font(.title)
            
            Text("共 \(games) 局，玩家胜 \(playerWin) 局，负 \(games-playerWin-evenGames) 局，平 \(evenGames) 局")
            
            Spacer()
            
            Button(action: {
                self.games = 0
                self.playerWin = 0
                self.evenGames = 0
            }) {
                Text("重新开始")
            }
            .frame(width: 100, height: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            .shadow(radius: 3)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
