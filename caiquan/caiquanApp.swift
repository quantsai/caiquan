//
//  caiquanApp.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import SwiftUI
import LocalAuthentication

@main
struct caiquanApp: App {
    
    
//    let motionManager = MotionManager()
    @State var locked = false;
    
    var body: some Scene {
        WindowGroup {
            Group{
                if locked {
                    Locked(locked: $locked)
                }else {
                    Route()
                }
            }
            .onAppear{
//                authorize{ result in
//                    DispatchQueue.main.async {
//                        locked = !result
//                    }
//                }
            }
        }
    }
}

// test1
// test2
// test3
