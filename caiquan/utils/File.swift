//
//  File.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import Foundation
import LocalAuthentication


// 脸部识别登录
func authorize(completion: @escaping (Bool)->Void) {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error:  &error){
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "应用解锁"){
            result, _ in
            completion(result)
        }
    }else{
        completion(false)
    }
}

