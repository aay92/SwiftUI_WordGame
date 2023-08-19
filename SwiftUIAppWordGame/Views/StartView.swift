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
                    isShotGame.toggle()
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
            .fullScreenCover(isPresented: $isShotGame) {
                GameView()
            }///fullScreenCover = переход на другой экран
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
