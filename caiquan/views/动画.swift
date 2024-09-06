//
//  动画.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/2.
//

import SwiftUI

struct AnimationView: View {
    
    @State var showAnimation = false;
    @State var isPlay = false;
    
    @State var progress:CGFloat = 0.0
    
    
    var body: some View {
        
        // .animation() 隐式写法：手动指定需要动画的元素
        // withAnimation{} 显式写法：所有用到变量的元素，都进行动画
        
//        // 显式
//        Button{
//            self.showAnimation.toggle()
//        }label: {
//            Text("Button").rotationEffect(.degrees(showAnimation ? 180 : 0)).animation(.easeInOut)
//        }
//        
//        
//        // 隐式写法
//        Button{
//            withAnimation(.easeInOut(duration: 1)){
//                self.showAnimation.toggle()
//            }
//        }label: {
//            Text("Button").rotationEffect(.degrees(showAnimation ? 180 : 0))
//        }
//        
//       
//       
//        Text("Button").rotationEffect(.degrees(showAnimation ? 180 : 0))
        
        
        
        // transition动画类型
        Divider();
        Text("transition动画类型").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
        Button("button"){
            withAnimation(.easeInOut(duration: 1)){
                self.showAnimation.toggle()
            }
        }
        
        if(showAnimation){
            Text(".scale + .opacity").transition(.scale.combined(with: .opacity))
            Text(".slide").transition(.slide)
            Text(".move").transition(.move(edge: .trailing))
            Text(".offset").transition(.offset(x:100,y:100))
            Text(".scale").transition(.scale)
            Text(".opacity").transition(.opacity)
        }
        
        
        
        // 图标交替
        Divider();
        Text("图标交替").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
        Button{
            withAnimation(.easeInOut(duration: 0.5)){
                self.isPlay.toggle();
            }
        }label: {
            isPlay ? Image(systemName: "play.fill") : Image(systemName: "pause.fill")
        }
        
        
        
        // 圆形进度
        Divider();
        Text("圆形进度").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.footnote)
        Button("点击加进度"){
            self.progress += 0.1
        }
        ZStack{
            
            Circle()
                .stroke(lineWidth: 6)
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemGray6))
            
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width: 90, height: 90)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration:  0.5))
                
            
            
            
        }
                                      
        
    }
}

#Preview {
    AnimationView()
}
