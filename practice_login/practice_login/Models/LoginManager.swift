//
//  LoginManager.swift
//  practice_login
//
//  Created by 전도균 on 2022/08/10.
//

import Foundation

struct LoginManager {
    private let id = "admin"
    private let password = "temp"
    
    func check(id: String, password: String) -> Bool {
        return id == self.id && password == self.password
    }
}
