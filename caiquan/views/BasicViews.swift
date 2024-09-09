//
//  BasicViews.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import SwiftUI

struct BasicViews: View {
    var body: some View {
        ScrollView{
            
       
        VStack(spacing: 50){
            VStack{
                
                Text("Text、Spacer、Divider、EmptyView")
                Spacer()
                EmptyView().frame(width: 100, height: 40)
                
                Divider()
            }
            
            VStack{
                Text("HStack  VStack  ZStack")
            }
            
            Divider()
            VStack{
                Text("图标、图片")
                
                HStack{
                    Image(systemName: "folder")  // SF Symbols中的图标名
                    Image("img").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                }
            }
            
            Divider()
            VStack{
                Text("矩形、圆角矩形、圆形、胶囊、椭圆")
                
                HStack{
                    Rectangle().frame(width: 50,height: 50)
                    RoundedRectangle(cornerRadius: 10).frame(width: 50,height: 50)
                    Circle().frame(width: 50,height: 50)
                    Capsule().frame(width: 50,height: 20)
                    Ellipse().frame(width: 50,height: 20)
                    
                }
                
            }
            
            
        }
        }
        .navigationTitle("基础组件")
    }
}

#Preview {
    BasicViews()
}
