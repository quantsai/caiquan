//
//  常用修改器.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/1.
//

import SwiftUI

struct NormalModifierView: View {
    var body: some View {
        
        ScrollView{
            
            
            // 图片填充
            Divider()
            Text("图片填充").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
            
            VStack{
                
                // 保持比例，填满区域，会显示溢出部分
                Text("保持比例，填满区域 .scaledToFill").foregroundColor(.blue).font(.footnote)
                HStack{
                    
                    Image("2")
                        .resizable()
                        .scaledToFill()
                }.frame(width: 100,height: 100).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
                
                // 保持比例，图片完全显示，多余的部分留空
                Text("保持比例，图片完全显示 .scaledToFit").foregroundColor(.blue).font(.footnote)
                HStack{
                    Image("2")
                        .resizable()
                        .scaledToFit()
                }.frame(width: 100,height: 100).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
                
                
                // 拉伸长宽比为5， 使用fit方式填充
                Text("拉伸长宽比为5， 使用fit方式填充 .aspectRatio").foregroundColor(.blue).font(.footnote)
                Image("2")
                    .resizable()
                    .aspectRatio(5, contentMode: .fit)
                
                
                // 蒙版
                Text("蒙版 .clipShape").foregroundColor(.blue).font(.footnote)
                Image("2")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1)
                    .frame(width: 200,height: 200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(color:.red,  radius: 10, x: 5, y: 5)
                
                
                // 缩小图片，不缩尺寸
                Text("缩小可见尺寸，不缩真实尺寸")
                Image("2")
                    .resizable()
                    .scaleEffect(0.8)
                    .scaledToFit()
                    .background(Color.red)
                
                Text("cai quan")
                    .textCase(.uppercase)
                    .font(.largeTitle)
                    .scaleEffect(0.3)
                    .background(Color.red)
                
            }.frame(width: 200)
            
            
            
            // 修改SF图标的尺寸
            Divider()
            Text("修改SF图标的尺寸 .imageScale").foregroundColor(.blue).font(.footnote)
            Image(systemName: "scribble.variable")
                .imageScale(.large)
            
            
            // 前景色 背景色
            Divider()
            Text("前景色 背景色").foregroundColor(.blue).font(.footnote)
            Text("前景色").foregroundColor(.red)
            Text("背景色").background(Color.red)
            Text("背景图").background(Image("2").resizable())
            
            // 覆盖
            Divider()
            Text("覆盖 .overlay").foregroundColor(.blue).font(.footnote)
            Image("2")
                .resizable()
                .scaleEffect(0.5)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .overlay(
                    HStack {
                        Spacer()
                        Text("Hello")
                        Spacer()
                    }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black),
                    alignment: .bottom
                )
                .background(Color.red)
            
            
            
            
            
            
            
            
            
        }
    }
}

#Preview {
    NormalModifierView()
}
