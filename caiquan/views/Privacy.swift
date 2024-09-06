//
//  PrivacyDoc.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/9/5.
//

import SwiftUI
import BetterSafariView

struct PrivacyDoc: View {
    
    @State private var presentingSafariView = false;
    
    
    var body: some View {
        
        VStack{
            
            // 默认浏览器中打开网页
            Link( destination: URL(string: "https://www.baidu.com")!){
                RoundButton(text: "open in default brower", image: "lanyardcard.fill")
            }
            
            // 应用内打开网页
            Button{
                self.presentingSafariView = true
            }label: {
                RoundButton(text: "open in app", image: "safari.fill")
            }
            .safariView(isPresented: $presentingSafariView){
                SafariView(
                    url: URL(string: "https://www.baidu.com")!,
                    configuration: SafariView.Configuration(
                        entersReaderIfAvailable: true,
                        barCollapsingEnabled: true
                    )
                )
                .preferredBarAccentColor(.accent) // 导航栏颜色
                .preferredControlAccentColor(.red) // 按钮和字体颜色
                .dismissButtonStyle(.close) // 关闭按钮所显示的文字
            }
        }
        .navigationTitle("Privacy")
    }
}

#Preview {
    PrivacyDoc()
}
