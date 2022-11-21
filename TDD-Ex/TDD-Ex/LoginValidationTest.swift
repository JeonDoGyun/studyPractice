//
//  LoginValidationTest.swift
//  TDD-ExTests
//
//  Created by 전도균 on 2022/11/21.
//

import XCTest
@testable import TDD_Ex

final class LoginValidationTest: XCTestCase {
    
    var validator: LoginValidator!

    override func setUpWithError() throws {
        validator = LoginValidator()
    }

    override func tearDownWithError() throws {
        validator = nil
    }

    func testLoginValidator_whenValidIdProvided_shouldReturnTrue() {
        measure {
            let user = User(id: "Ad", pw: "Admin")
            let isValid = validator.isValid(id: user.id)
            XCTAssertTrue(isValid, "아이디는 4글자 이상이어야 합니다.")
        }
    }
}
