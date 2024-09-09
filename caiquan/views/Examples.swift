//
//  Examples.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/9/5.
//

import SwiftUI

struct ListItem<Content:View>:View {
    var title:String
    var content:String?
    var view:()->Content
    
    init(_ title: String, _ content: String?, _ view: @escaping ()-> Content) {
        self.title = title
        self.content = content
        self.view = view
    }
    
    
    var body: some View {
        NavigationLink(destination: view()){
            VStack(alignment: .leading, spacing: 6){
                Text(title).font(.headline)
                if content != nil {
                    Text(content!).font(.callout).foregroundColor(.gray)
                }
            }
        }
    }
}



struct Examples: View {
    
    
    @AppStorage("darkMode") var darkMode = false
    
    
    var body: some View {
        
        NavigationView{
            List{
                
                ListItem( "基础组件",  nil,  {BasicViews()})
                ListItem( "控件",  "按钮、开关、计数器、选择器、时间选择器、长按弹出菜单、滑动条、进度条、地图、颜色选择器、菜单",  {ControlViews()})
                ListItem("层级","菜单栏、导航栏、滑动页面、地图弹框sheet、警告弹框",{TierView()})
                ListItem("列表","列表、网格、成组、表单",{ListView()})
                ListItem("文本修改器",nil,{TextModifierView()})
                ListItem("排版修改器",nil,{LayoutModifierView()})
                ListItem("排版修改器-练习",nil,{LayoutModifierExampleView()})
                ListItem("图片和尺寸修改器",nil,{NormalModifierView()})
                ListItem("颜色修改器",nil,{ColorModifierView()})
                ListItem("自定义修改器",nil,{CustomModifierView()})
                ListItem("手势",nil,{GestureView()})
                ListItem("动画",nil,{AnimationView()})
                ListItem("数据流",nil,{DataFlowView()})
                ListItem("状态管理","",{StoreView()})
                //                ListItem("","",)
                //                ListItem("","",)
                //                ListItem("","",)
                //                ListItem("","",)
                //                ListItem("","",)
                //                ListItem("","",)
                //                ListItem("","",)
                //                ListItem("","",)
                //                ListItem("","",)
                
                
                
                ListItem("打开网页", "默认浏览器 / APP内部",{Privacy()})
                ListItem("本地读写","JSON/图片",{Articles()})
                
            }.navigationTitle("Examples")
                .toolbar{
                    Settings(darkMode: $darkMode)
                }
            
        }
        .preferredColorScheme(darkMode ? .dark : .light)
        
        
        
        
        
        
    }
}

#Preview {
    Examples()
}
