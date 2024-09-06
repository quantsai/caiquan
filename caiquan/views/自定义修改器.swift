//
//  自定义修改器.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/1.
//

import SwiftUI


// step1: 自定义修改器
struct TitleModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
    }
}


// step2: 在View上扩展 自定义修改器TitleModifier
extension View {
    func titleStyle()->some View {
        self.modifier(TitleModifier())
    }
}


// step2: 在View扩展TitleModifier的基础上，再次在Text上扩展blueTitleStyle
extension Text {
    func blueTitleStyle()->some View{
        self
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .titleStyle()
    }
}



// 使用自定义扩展器
struct CustomModifierView: View {
    var body: some View {
        Text("Title")
            .titleStyle()
        
        Text("Title")
            .blueTitleStyle()
    }
}

#Preview {
    CustomModifierView()
}
