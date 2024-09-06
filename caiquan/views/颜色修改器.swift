//
//  颜色修改器.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/1.
//

import SwiftUI


// 使用十六进制颜色
extension Color {
    init(hex:String){
        
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        var int: UInt64 = 0;
        
        Scanner(string: hex).scanHexInt64(&int)
        
        let a,r,g,b:UInt64
        
        switch hex.count {
        case 3: (r,g,b,a) = ( (int>>8)*17, (int >> 4 & 0xF) * 17, (int & 0xF)*17,255)
        case 6: (r,g,b,a) = ( int >> 16, int >> 8 & 0xFF, int & 0xFF,255)
        case 8: (r,g,b,a) = ( int >> 24 & 0xFF, int >> 16 & 0xFF, int >> 8 & 0xFF,int & 0xFF)
            
        default: (r,g,b,a) = (1,1,0,1)
        }
        
        self.init(.sRGB, red: Double(r)/255, green: Double(g)/255, blue: Double(b)/255, opacity: Double(a)/255)
        
    }
}


// 毛玻璃特效
struct GlassEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
    
}
extension View {
    func glassEffect()->some View {
        self.background(GlassEffect())
    }
}



struct ColorModifierView: View {
    var body: some View {
        ScrollView{
            
            // 色值
            Divider()
            Text("色值").foregroundColor(.blue).font(.footnote)
            HStack{
                Color.red
                Color.orange
                Color.yellow
                Color.green
                Color.blue
                Color.primary
                Color.secondary
                Color(red:0, green:50, blue:100)
                Color(hex: "ff000066")
            }.frame(height: 40)
            
            
            // 渐变色
            Divider()
            Text("渐变色").foregroundColor(.blue).font(.footnote)
            HStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(LinearGradient(
                        colors: [.red, .yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 100,height: 100)
                
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(RadialGradient(
                        colors: [.red, .yellow],
                        center: .center ,
                        startRadius: 1,
                        endRadius: 100
                    ))
                    .frame(width: 100,height: 100)
                
                
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(AngularGradient(
                        colors: [.red, .blue],
                        center: .center
                    ))
                    .frame(width: 100,height: 100)
                
            }
            
            
            
            
            // border
            Divider()
            Text("border、strokeBorder").foregroundColor(.blue).font(.footnote)
            HStack{
                Circle().frame(width: 100).border(.red, width: 5).overlay(Text("border").foregroundColor(.white), alignment: .center)
                Circle().strokeBorder(.red, lineWidth: 5).frame(width: 100).overlay(Text("strokeBorder"))
            }
            
            
            
            
            // 圆角、阴影
            Divider()
            Text("圆角、阴影").foregroundColor(.blue).font(.footnote)
            HStack{
                Rectangle()
                    .cornerRadius(10)
                    .shadow(color:.red, radius: 10, x: 5, y:5)
            }.frame(width: 200, height: 50)
            
            
            
            // 透明度、毛玻璃
            Divider()
            Text("透明度、毛玻璃").foregroundColor(.blue).font(.footnote)
            HStack{
                
                
                Text("  半透明       ")
                    .background(Color.white)
                    .opacity(0.5)
                
                Text("  模糊       ")
                    .background(Color.white)
                    .blur(radius: 2)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                
                Text("   毛玻璃       ")
                    .background(Color.white)
                    .glassEffect()
                    .opacity(0.5)
                
            }
            .frame(width: 300, height: 200)
            .background(Image("2")
                .resizable()
                .scaledToFit())
            
            
            
            // 旋转、缩放
            Divider()
            Text("旋转及缩放.rotationEffect()、.scaleEffect()").foregroundColor(.blue).font(.footnote)
            HStack{
                Rectangle().rotationEffect(.degrees(15))
                Rectangle().scaleEffect(0.5)
                
                Rectangle().rotation3DEffect(.degrees(30),axis: (x: 0.0, y: 1.0, z: 0.0))
            }.foregroundColor(.red).frame(width:200, height: 50)
            
            
            
            
            
            
            
            
        }
    }
}

#Preview {
    ColorModifierView()
}
