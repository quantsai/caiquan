//
//  列表.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/7/31.
//

import SwiftUI

struct ListView: View {
    
    let list = ["60s", "60min", "12hour"]
    
    
    // adaptive每列宽度min-max，不限制列数
    let rule = [GridItem(.adaptive(minimum: 100, maximum: 200))]
    // fixed固定每列宽度，限制列数
    let ruleFix = [GridItem(.fixed(80)), GridItem(.fixed(200))]
    // flexible宽度是区间内任意大小，限制列数
    let ruleFlex = [GridItem(.flexible(minimum: 50, maximum: 200)), GridItem(.fixed(100))]
    
    
    @State var isOn = true;
    @State var stepperValue = 30
    
    
    var body: some View {
        
       
        
        // 列表，循环
        List {
            Text("1")
            Text("2")
            
            ForEach(0..<list.count, id: \.self){
                Text(list[$0])
            }
        }
        
        
        // 网格
        LazyVGrid(columns: ruleFlex, alignment: .center, spacing: 20){
            Text("a b c d e f g h i j k l m n o")
            Text("a b c d e f g h i j k l m n o")
            Text("a b c d e f g h i j k l m n o")
            Text("a b c d e f g h i j k l m n o")
        }
        
        
        // 成组框
        GroupBox(label:Label("标题", systemImage: "pencil.tip")){
            Circle().frame(width: 100,height: 100)
        }.padding()
        
        
        // 表单 
        Form{
            Section(header: Text("title")){
                Toggle(isOn: $isOn){
                    Text("Label")
                }
                Stepper(value: $stepperValue){
                    Text("stepper")
                }
            }
            
            Section(header: Text("title2")){
                Button("按钮1"){}
                Button("按钮2"){}
            }
        }
        
        
    }
}

#Preview {
    ListView()
}
