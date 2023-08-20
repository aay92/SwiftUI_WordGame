//
//  TitleView.swift
//  SwiftUIAppWordGame
//
//  Created by Aleksey Alyonin on 19.08.2023.
//

import SwiftUI

struct TitleView: View {
    @State var nameTitle: String
    var body: some View {
        
        Text(nameTitle)
            .padding()
            .font(.custom("AvenirNext", size: 43))
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .foregroundColor(.white)
        
    }
}

