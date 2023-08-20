//
//  ContentView.swift
//  SwiftUIAppWordGame
//
//  Created by Aleksey Alyonin on 19.08.2023.
//

import SwiftUI

struct StartView: View {
    
    @State var bigWord = ""
    @State var player1 = ""
    @State var player2 = ""
    
    @State var isShotGame = false
    @State var isAlert = false


    var body: some View {

            VStack {
                
                TitleView(nameTitle: "Game Word")
                WordTextField(word: $bigWord, placeholder: "Введите текст")
                    .padding(20)
                    .padding(.top, 32)
                
                WordTextField(word: $player1, placeholder: "Игрок 1")
                    .padding(.horizontal,20)
                
                
                WordTextField(word: $player2, placeholder: "Игрок 2")
                    .padding(.horizontal,20)

                Button {
                    if bigWord.count > 7 {
                        isShotGame.toggle()
                    } else {
                        self.isAlert.toggle()
                    }
                    
                } label: {
                    Text("Start")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                    Image(systemName: "")
                }
                .padding()
                .frame(width: 200)
                .background(Color("FirstPlayer"))
                .cornerRadius(50)
                .padding(.top, 20)

    

            }.background(Image(uiImage: UIImage(named: "back")!))
            .alert("Длинное слово слишколм короткое", isPresented: $isAlert, actions: {
                Text("Ok")
            })
            .fullScreenCover(isPresented: $isShotGame) {
                let name1 = player1 == "" ? "Игрок 1" : player1
                let name2 = player2 == "" ? "Игрок 2" : player2

                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
                
                let gameViewModel = GameViewModel(
                    player1:player1,
                    player2: player2,
                    word: bigWord)

                GameView(viewModel: gameViewModel)
            }///fullScreenCover = переход на другой экран
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
