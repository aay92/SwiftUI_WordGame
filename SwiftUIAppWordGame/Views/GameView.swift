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
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("tap")
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
            Text("Mагнитотерапия")
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(ColorGameWord.buttonColor)
            
            
            HStack(spacing: 12){
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 56))
                        .foregroundColor(ColorGameWord.buttonColor)
                    Text("Вася")
                        .font(.custom("AvenirNext-Bold", size: 26))
                        .foregroundColor(ColorGameWord.buttonColor)
                    
                }
                .padding(20)
                .frame(width: screen.width / 2.2)
                .background(ColorGameWord.cornerColorPlay1)
                .cornerRadius(26)
                .shadow(color: .red, radius: 5)
                

                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 56))
                        .foregroundColor(ColorGameWord.buttonColor)
                    Text("Вася")
                        .font(.custom("AvenirNext-Bold", size: 26))
                        .foregroundColor(ColorGameWord.buttonColor)
                    
                }
                .padding(20)
                .frame(width: screen.width / 2.2)
                .background(ColorGameWord.cornerColorPlay2)
                .cornerRadius(26)
                .shadow(color: .purple, radius: 5)
                

            }
            WordTextField(word: $word, placeholder: "Ваше слово")
                .padding(.horizontal)
            Button {
                print("")
                self.word = ""
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
                
            }.listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    
        }
        .background(Image("back"))
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
