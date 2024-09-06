//
//  排版修改器.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/1.
//

import SwiftUI

struct LayoutModifierView: View {
    var body: some View {
        
        
        // 宽度设置
        // 当固定宽度元素与自适应宽度元素，超过设备宽度，会根据固定的width和自适应minWidth按比例缩小
        // 如果有fixedSize，则是固定的width和自适应的idealWidth按比例分配
        Divider()
        Text("宽高 frame").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        HStack(alignment: .center, spacing:0) {
            Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(
                    minWidth: 100,
                    idealWidth: 200,
                    maxWidth: 300
                )
                .frame(
                    height: 100
                )
                .fixedSize() // 尽可能使用idealWidth，而不是minWidth或maxWidth
            
            
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 100  ,height: 100)
        }
        
        
        
        
        // 留白 .padding
        Divider();
        Text("留白 .padding").foregroundColor(.blue)
        Rectangle()
            .frame(height: 100)
            .padding(.leading, 10)
            .padding(.trailing, 40)
        
        
        
        
        // 忽略安全区域
        Divider()
        Text("忽略固定的非安全区域 .edgesIgnoringSafeArea").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        Rectangle()
            .foregroundColor(.accent)
            .edgesIgnoringSafeArea([.leading, .trailing])
        
        
        Text("忽略不固定的非安全区域(键盘) .ignoresSafeArea").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        Rectangle()
            .foregroundColor(.accent)
            .ignoresSafeArea(.keyboard)
        
        
        
        
        // 隐藏元素，
        Divider()
        Text("隐藏元素（只隐藏，留占位） .hidden").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
        Text("若要删除元素，使用 if !isHidden { Rectangle() }").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        Rectangle().hidden()
        
        
        
        
        
        // 占位符
        Divider()
        Text("占位符").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
        HStack{
            Text("title").font(.title)
            Text("content").font(.body)
        }
        
        HStack{
            Text("title").font(.title)
            Text("content").font(.body)
        }.redacted(reason: .placeholder)
        
    }
}

#Preview {
    LayoutModifierView()
}
