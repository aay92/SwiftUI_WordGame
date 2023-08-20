//
//  GameView.swift
//  SwiftUIAppWordGame
//
//  Created by Aleksey Alyonin on 19.08.2023.
//

import SwiftUI

let screen = UIScreen.main.bounds

enum ColorGameWord {
    static let exit = Color.orange.opacity(0.7)
    static let buttonColor = Color.white
    static let cornerColorPlay1 = Color(uiColor: UIColor.systemRed.withAlphaComponent(0.5))
    static let cornerColorPlay2 = Color(uiColor: UIColor.systemBlue.withAlphaComponent(0.5))

}

struct GameView: View {
    
    @State private var word = ""
    var viewModel: GameViewModel
    @Environment(\.dismiss) var dismiss
    @State var confirmation = false
    @State var isAlertPresent = false
    @State var alertText = ""

    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmation.toggle()
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(ColorGameWord.exit)
                        .cornerRadius(12)
                        .padding()
                        .foregroundColor(ColorGameWord.buttonColor)
                        .font(.custom("AvenirNext-Bold", size: 18))
                }
                Spacer()
                
            }
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(ColorGameWord.buttonColor)
            
            
            HStack(spacing: 12){
                VStack {
                    Text("\(viewModel.player1.score)")
                        .font(.custom("AvenirNext-Bold", size: 56))
                        .foregroundColor(ColorGameWord.buttonColor)
                    Text("\(viewModel.player1.name)")
                        .font(.custom("AvenirNext-Bold", size: 26))
                        .foregroundColor(ColorGameWord.buttonColor)
                    
                }
                .padding(20)
                .frame(width: screen.width / 2.2)
                .background(ColorGameWord.cornerColorPlay1)
                .cornerRadius(26)
                .shadow(color: viewModel.isFirst ? .red : .clear, radius: 5)
                

                VStack {
                    Text("\(viewModel.player2.score)")
                        .font(.custom("AvenirNext-Bold", size: 56))
                        .foregroundColor(ColorGameWord.buttonColor)
                    Text("\(viewModel.player2.name)")
                        .font(.custom("AvenirNext-Bold", size: 26))
                        .foregroundColor(ColorGameWord.buttonColor)
                    
                }
                .padding(20)
                .frame(width: screen.width / 2.2)
                .background(ColorGameWord.cornerColorPlay2)
                .cornerRadius(26)
                .shadow(color: viewModel.isFirst ? .clear : .purple, radius: 5)
                

            }
            WordTextField(word: $word, placeholder: "Ваше слово")
                .padding(.horizontal)
            
            Button {
                var score = 0
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.bofforeWord {
                    alertText = "Прояви фонтазию и придумай новое слово"
                    isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = "Слишком короткое слово"
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = "Думаешь самый умный, составленное слово не должно быть исходным"
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "Такое слово не может быть составленно"
                    isAlertPresent.toggle()
                } catch {}
                
                if score > 0 {
                    self.word = ""
                }
            } label: {
                Text("Готово")
            }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .foregroundColor(Color.white)
            .cornerRadius(20)
            .font(.custom("AvenirNext-Bold", size: 26))
            .padding(.horizontal)
            
            List {
                ForEach(0 ..< self.viewModel.words.count, id: \.description) { item in
                    WordCell(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color("FirstPlayer") : Color.blue.opacity(0.5))
                        .listRowInsets(EdgeInsets())
                }
            }.listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Image("back"))
        .confirmationDialog("Вы уверены что хотите завершить игру?",
                            isPresented: $confirmation,
                            titleVisibility: .visible) {
            Button(role: .destructive) {
                self.dismiss()
            } label: {
                Text("Yes")
            }
            
            Button(role: .cancel) {} label: {
                Text("No")
            }

        }.alert(alertText,
                isPresented: $isAlertPresent) {
            Text("Ok")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Вася"), player2: Player(name: "Петя"), word: "Рекогноцировка"))
    }
}
