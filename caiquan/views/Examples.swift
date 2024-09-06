//
//  Examples.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/9/5.
//

import SwiftUI

struct Examples: View {
    var body: some View {
        
        NavigationView{
            List{
                
                NavigationLink {
                    PrivacyDoc()
                }label:{
                    VStack(alignment: .leading, spacing: 6){
                        Text("Privacy").font(.headline)
                        Text("open web: brower & app").font(.callout).foregroundColor(.gray)
                    }
                }
                
                
                NavigationLink {
                    NoteView()
                }label:{
                    VStack(alignment: .leading, spacing: 6){
                        Text("Note").font(.headline)
                        Text("sendbox read & write").font(.callout).foregroundColor(.gray)
                    }
                }
                
            }.navigationTitle("Examples")
            
        }
        
        
        
        
        
        
    }
}

#Preview {
    Examples()
}
