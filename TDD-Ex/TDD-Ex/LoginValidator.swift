//
//  LoginValidator.swift
//  TDD-Ex
//
//  Created by 전도균 on 2022/11/14.
//

import Foundation

class LoginValidator {
    func isValid(id: String) -> Bool {
        return id.count > 3
    }
    
    func isValidPw(pw: String) -> Bool {
        return pw.count >= 5
    }
    
    func shouldLogin(user: User, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            completion(self.isValid(id: user.id) && self.isValidPw(pw: user.pw))
        })
    }
}
