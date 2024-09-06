//
//  手势.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/2.
//

import SwiftUI

struct GestureView: View {
    
    
    
    var body: some View {
        Text("长按  .onLongPressGesture")
            .onLongPressGesture{ print("长按")}
        
        
            Text("轻点  .onTapGesture")
                .onTapGesture{ print("轻点")}
        
        
        
    }
}

#Preview {
    GestureView()
}
