//
//  WordTextField.swift
//  SwiftUIAppWordGame
//
//  Created by Aleksey Alyonin on 19.08.2023.
//

import SwiftUI

struct WordTextField: View {
    @State var word: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: word)
            .font(.title)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
}


