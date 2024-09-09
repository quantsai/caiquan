//
//  ControlViews.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import SwiftUI
import MapKit

struct ControlViews: View {
    
    @State var toggleValue = true;
    
    @State var pickerValue = 1;
    var pickerOptions = ["步行","飞机","火车"]
    
    @State var sliderValue = 0.0
    
    @State var stepValue = 0
    
    @State var dateValue = Date()
    var dateRange:ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .day, value: -100, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 100, to: Date())!
        return min...max
    }
    
    @State var mapLocation = MKCoordinateRegion(center: .init(latitude: 31.231706, longitude: 121.472644), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    
    @State var color = Color(.sRGB, red: 1, green: 1, blue: 0);
    
    
    var body: some View {
        ScrollView{
            
            Button("Button"){}
            Button{} label: { Text("Button")}
            Divider()
            
            Toggle("开关", systemImage: "folder",isOn: $toggleValue)
            Divider()
            
            Picker("Picker",selection: $pickerValue){
                ForEach(pickerOptions.indices, id:\.self){ index in
                    Text(pickerOptions[index]).tag(index)
                }
            }
            
            Picker("Picker",selection: $pickerValue){
                ForEach(pickerOptions.indices, id:\.self){ index in
                    Text(pickerOptions[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Divider()
            
            
            
            // 滑动条
            Divider()
            Slider(value: $sliderValue, in:-5...5, step: 0.1)
            
            // 计数
            Divider()
            Stepper("计数器\(stepValue)", value: $stepValue, in:0...5, step: 2)
            
            // 时间选择器
            Divider()
            DatePicker(
                selection: $dateValue, in: dateRange,
                displayedComponents: [.hourAndMinute, .date],
                label: { Text("时间")}
            )
            
            // 长按弹出菜单
            Divider()
            Text("长按弹出菜单")
                .contextMenu(ContextMenu(menuItems: {
                    /*@START_MENU_TOKEN@*/Text("Menu Item 1")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                    Button("按钮"){}
                    /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
                }))
            
            
            // 进度条
            Divider()
            ProgressView(value: 0.2)
            ProgressView(value: 0.2).progressViewStyle(CircularProgressViewStyle())
            
            
            // 地图
            Divider()
//            Map(coordinateRegion: $mapLocation).frame( height: 100)
            
            // 颜色选择器
            ColorPicker("颜色选择器，支持iOS，iPadOS、macOS", selection: $color)
            
            
            // 菜单
            Menu("菜单"){
                Menu("menu2"){
                    Button("menu2-1"){}
                    Button("menu2-2"){}
                }
                Button("menu1"){}
            }
            
            
            
        }
    }
}

#Preview {
    ControlViews()
}
