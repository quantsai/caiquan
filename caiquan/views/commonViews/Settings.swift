//
//  Settings.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/7/31.
//

import SwiftUI

struct Settings: View {
    @Binding var darkMode:Bool
    var body: some View {
        Button{
            
        }label: {
            Button{
                darkMode.toggle()
            } label: {
                Image(systemName: darkMode ? "sun.max.fill" : "moon.fill").font(.system(.headline, design: .rounded))
            }
        }
    }
}

#Preview {
    Settings(darkMode: .constant(false))
}
