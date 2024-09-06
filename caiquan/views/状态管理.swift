//
//  状态管理.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/8/5.
//

import SwiftUI


// 1. 定义数据模型
class UserData:ObservableObject {
// 2. @Published标注可响应的数据
    @Published var name = "cq"
    
}



struct StoreView: View {
// 3. 需要使用数据的最外层视图中，使用 @StateObject 初始化数据
    @StateObject var data = UserData()
    
    
    var body: some View {
        Button("set name"){
            data.name = "CaiQuan"
        }
// 4. 如果子孙视图中需要使用数据，需要在引用子视图的地方，使用.environmentObject(data)
        ChildrenView1().environmentObject(data)
    }
}

#Preview {
    StoreView()
}



struct ChildrenView1:View {
    
    var body: some View {
        ChildrenView2()
    }
}


struct ChildrenView2:View {
    
    var body: some View {
        ChildrenView3()
    }
}


struct ChildrenView3:View {
// 5. 在使用数据的子孙视图中， 使用 @EnvironmentObject 定义数据
    @EnvironmentObject var data:UserData
    
    var body: some View {
        
// 6. 使用数据
        Text("3 \(data.name)")
    }
}
