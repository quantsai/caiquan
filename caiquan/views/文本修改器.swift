//
//  修改器.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/7/31.
//

import SwiftUI

struct TextModifierView: View {
    
    @State var inputValue = ""
    
    
    var body: some View {
        
        
        ScrollView{
            
            // 自定义字体
            Divider()
//            remove
//            Text("自定义字体").font(.custom("FZKai-Z03S", size: 24))
            
            
            // 字号
            Divider()
            HStack {
                Text("largeTitle").font(.largeTitle)
                Text("title").font(.title)
                Text("title2").font(.title2)
                Text("title3").font(.title3)
            }
            HStack{
                Text("headline").font(.headline)
                Text("subheadline").font(.subheadline)
            }
            HStack{
                Text("body").font(.body)
                Text("callout").font(.callout)
                Text("footnote").font(.footnote)
                Text("caption").font(.caption)
                Text("caption2").font(.caption2)
            }
            
            
            // 系统字体
            Divider()
            HStack{
                
                Text(".default  .rounded  .monospaced  .serif").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote).multilineTextAlignment(.leading).frame(width: nil)
                Spacer()
            }
            HStack {
                Text("系统字体")
                    .font(
                        .system(
                            size: 20,
                            weight: .regular,
                            design: .default
                        )
                )
                
                Text("默认").font( .system(size:20, design: .default))
                Text("圆角").font( .system(size:20, design: .rounded))
                Text("等宽").font( .system(size:20, design: .monospaced))
                Text("称线").font( .system(size:20, design: .serif))
            }
            
            
            // 字体样式
            Divider()
            HStack{
                Text("样式 .bold  .italic  .underline  .strikethrough ").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
                
                Spacer()
            }
            HStack{
                Text("加粗").bold()
                Text("斜体").italic()
                Text("下划线").underline()
                Text("删除线").strikethrough()
            }

            
            // 大小写
            Divider()
            HStack{
                Text("大小写 .uppercase  .lowercase  .none").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
                
                Spacer()
            }
            HStack{
                Text("全大写Hello").textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                Text("全小写Hello").textCase(.lowercase)
                Text("默认Hello").textCase(.none)
            }
            
            
            
            
            // 字重
            Divider()

            HStack{
                
                Text("字重 .fontWeight").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
                Spacer()
            }
            HStack{
                
                Text("ultraLight").fontWeight(.ultraLight)
                Text("thin").fontWeight(.thin)
                Text("light").fontWeight(.light)
            }
            HStack{
                Text("regular").fontWeight(.regular)
                Text("medium").fontWeight(.medium)
            }
            HStack{
                Text("semibold").fontWeight(.semibold)
                Text("bold").fontWeight(.bold)
                Text("heavy").fontWeight(.heavy)
                
            }
            
            
            
            
            
            // 字间距
            Divider()
            HStack{
                Text("字间距 .tracking   .kerning").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
                Spacer()
            }
            HStack{
                Text("tracking等距离").tracking(-0.6)
                Text("kerning根据字母不等距").kerning(-0.6)
            }
            
            // 基线
            Divider()
            HStack{
                
                Text("基线  .baselineOffset（用于纵向对齐文本）").foregroundColor(.blue).font(.footnote)
                Spacer()
            }
            HStack{
                Text("大文本").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("小文本").font(.footnote).baselineOffset(-12)
                
            }
            
            
            
            //行距
            Divider()
            HStack {
                Text("行间距 .lineSpacing").foregroundColor(.blue).font(.footnote)
                Spacer()
            }
            Text("行距  .lineSpacing s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s  s s s s s").lineSpacing(10)
            
            
            
            // 多行文本对齐
            Divider()
            HStack {
                Text("多行文本对齐 .multilineTextAlignment").foregroundColor(.blue).font(.footnote)
                Spacer()
            }
            Text("s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s ").multilineTextAlignment(.trailing)
            
            
            // 省略
            Divider()
            HStack {
                Text("限制行数.lineLimit、省略位置.truncationMode").foregroundColor(.blue).font(.footnote)
                Spacer()
            }
            Text("限制行数 .linelimit(2) s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s  s s s s s").frame(width: 200).lineLimit(1)
            Text("在哪里省略 .truncationMode s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s  s s s s s").lineLimit(1).truncationMode(.middle)
            
            
            
            
            
            
            //尽可能多的显示内容，允许缩紧间距
            Divider()
            
            HStack {
                Text("允许缩间距 .allowsTightening， 允许缩字体 .minimumScaleFactor").foregroundColor(.blue).font(.footnote)
                
            }
            Text("s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s  s s s s s").lineLimit(1).allowsTightening(true)
            Text("s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s  s s s s s").lineLimit(1).allowsTightening(true).minimumScaleFactor(0.5)
            
            
            
            
            // 文本输入框
            Divider()
            
            HStack {
                Text("文本框").foregroundColor(.blue).font(.footnote)
                Spacer()
            }
            TextField("边框样式 .textFieldStyle", text: $inputValue)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            
            TextField("自动大小写 .autocapitalization", text: $inputValue)
                .padding()
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.allCharacters)
            
            
            
            TextField("自动纠错 .disableAutocorrection", text: $inputValue)
                .padding()
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
            
            
            TextField("键盘.keyboardType  与  文本类型.textContentType", text: $inputValue)
                .padding()
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
            
            
            
        }
    }
}

#Preview {
    TextModifierView()
}
