//
//  LoginError.swift
//  TDD-Ex
//
//  Created by 전도균 on 2022/11/14.
//

import Foundation

enum LoginError: Error {
    case notEnoughInfo
    case idRequired
    case wrongPassword
}

extension LoginError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notEnoughInfo:
            return "아이디, 패스워드를 올바르게 입력하세요."
        case .idRequired:
            return "아이디를 입력하세요."
        case .wrongPassword:
            return "비밀번호가 잘못되었습니다."
        }
    }
}
