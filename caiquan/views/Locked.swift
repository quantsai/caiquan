//
//  Locked.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import SwiftUI
import LocalAuthentication

struct Locked: View {
    
    @Binding var locked:Bool
    
    
    var body: some View {
        Button("点击验证"){
            authorize{ result in
                DispatchQueue.main.async {
                    locked = !result
                }
            }
        }
    }
    
    
    
}

#Preview {
    @State var locked = false;
    return Locked(locked: $locked)
}
