//
//  层级.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import SwiftUI

struct TierView: View {
    
    @State var showActionSheet = false;
    @State var showAlert = false;
    
    
    var body: some View {
        TabView{
            
            // 滑动页面
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Rectangle().frame(width: 100, height: 100)
                    Circle().frame(width: 200,height: 100)
                    Capsule().frame(width: 200,height: 100)
                    Ellipse().frame(width: 200, height: 100)
                    
                }
                
            }
            .tabItem { Image(systemName: "calendar.day.timeline.trailing"); Text("SLIDER") }
            
            
            // 导航页面
            NavigationView {
                VStack{
                    VStack(spacing: 30){
                        NavigationLink(destination: BasicViews() ){
                            Text("link")
                        }
                    }
                }
                .navigationBarTitle("title1",displayMode: .inline)
                .navigationBarItems(
                    leading: Button("leading"){},
                    trailing: HStack{
                        Button("trailing"){}
                        Button("trailing"){}
                })
            }
            .tabItem { Image(systemName: "text.line.first.and.arrowtriangle.forward"); Text("NAV") }
            
            
            // 底部弹框sheet
            HStack{
                Button("显示长弹窗"){ showActionSheet.toggle(); }
            }
            .actionSheet(isPresented: $showActionSheet){
                ActionSheet(
                    title: Text("Title"),
                    message: Text("Intro"),
                    buttons: [
                        .default(Text("确认")){},
                        .destructive(Text("删除")){},
                        .cancel(Text("取消"))                    ]
                )
            }
            .tabItem { Image(systemName: "filemenu.and.cursorarrow"); Text("POP") }
            
            
            // 警告页面
            HStack{
                Button("显示警告"){ showAlert.toggle(); }
            }
            .alert(isPresented: $showAlert){
                Alert(
                    title: Text("删除"),
                    message: Text("确认删除吗？"),
//                    primaryButton: .destructive(Text("确认")),
//                    secondaryButton: .default(Text("取消")),
                    dismissButton: .default(Text("我知道了"))
                )
            }
            .tabItem { Image(systemName: "exclamationmark.triangle"); Text("WARNING") }
        }
        
        
    }
}

#Preview {
    TierView()
}
