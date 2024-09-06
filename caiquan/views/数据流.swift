//
//  数据流.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/2.
//

import SwiftUI

struct DataFlowView: View {
    @State var isTrue = true;
    
    
    
    var body: some View {
        Button{ isTrue.toggle();  }label: {Text("Click FatherView:\(isTrue)")}
        
        // 给子视图传递数据
        ChildrenView(isTrue: $isTrue)
        
        
    }
}


struct ChildrenView:View {
    
    // @Binding 接住父级传递过来的数据
    @Binding var isTrue:Bool
    
    var body: some View {
        Button("ChildrenView: \(isTrue)"){
            isTrue.toggle()
        }
        
    }
}




#Preview {
    DataFlowView()
}
