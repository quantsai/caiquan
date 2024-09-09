//
//  RoundButton.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import SwiftUI

struct RoundButton: View {
    let text:String
    let image: String
    
    
    var body: some View {
        HStack{
            Image(systemName: image)
            Text(text)
        }
        .font(.headline)
        .padding(.horizontal, 10)
        .padding(.vertical,5)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    RoundButton(text: "button", image: "square.and.pencil")
}
