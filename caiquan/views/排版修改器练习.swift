//
//  自定义修改器.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/1.
//

import SwiftUI

struct LayoutModifierExampleView: View {
    var body: some View {
        
        VStack(spacing:10){
//            Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            
            // top
            HStack(spacing:10){
                VStack{
                    HStack{
                        Rectangle().foregroundColor(.orange)
                        Rectangle().foregroundColor(.gray).frame(minWidth: 120)
                        Rectangle().foregroundColor(.white).frame(minWidth: 100)
                    }.frame(height: 40)
                    
                    HStack{
                        VStack{
                            Rectangle().foregroundColor(.gray).frame(minWidth: 40)
                            Spacer().frame(minWidth: 40)
                        }
                        
                            VStack{
                                Spacer().frame(minWidth: 40)
                                Rectangle().foregroundColor(.gray).frame(minWidth: 40)
                            }
                        
                            VStack{
                                Spacer().frame(minWidth: 40)
                                Rectangle().foregroundColor(.gray).frame(minWidth: 40)
                            }
                        Rectangle().foregroundColor(.red).frame(minWidth: 160)
                            
                        
                    }.frame(minHeight: 100, maxHeight: 400)
                    
                }.frame(minWidth: 300, maxWidth: 1000)
                
                
                
                VStack{
                    Rectangle().foregroundColor(.gray)
                    Rectangle().foregroundColor(.white)
                    
                }.frame(width: 40)
                
                
                
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 100, idealHeight: 200, maxHeight: 200)
//            .background(Color.red)
                
            
            
            // bottom
            HStack{
                Rectangle().foregroundColor(.blue).frame(minWidth: 80)
                Rectangle().foregroundColor(.white).frame(minWidth: 40)
                
                VStack{
                    Rectangle().foregroundColor(.white).frame(minHeight: 20)
                    Rectangle().foregroundColor(.white).frame(minHeight: 20)
                }.frame(minWidth: 80)
                
                
                Rectangle().foregroundColor(.orange).frame(minWidth: 80)
                Rectangle().foregroundColor(.orange).frame(width: 40)
                
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 50, idealHeight: 100, maxHeight: 100)
//            .background(Color.gray)
            
            
            
            
        }
        .frame(  maxWidth:.infinity)
        .padding()
        .background(Color.black)
        
    }
}

#Preview {
    LayoutModifierExampleView()
}
