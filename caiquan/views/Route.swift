//
//  Route.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import SwiftUI

struct Route: View {
    var body: some View {
        
        
        TabView{
            
            Examples()
                .tabItem { Label("Note", systemImage: "note.text") }
            
            
            Privacy()
                .tabItem { Label("privacy", systemImage: "note.text") }        

        }
    }
}

#Preview {
    Route()
}
