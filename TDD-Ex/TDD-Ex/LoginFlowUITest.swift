//
//  LoginFlowUITest.swift
//  TDD-ExUITests
//
//  Created by 전도균 on 2022/11/14.
//

import XCTest

final class LoginFlowUITest: XCTestCase {
    
    private var app: XCUIApplication!
    private var idTextField: XCUIElement!
    private var pwTextField: XCUIElement!
    private var loginButton: XCUIElement!
    
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        idTextField = app.textFields["idTextField"]
        pwTextField = app.textFields["pwTextField"]
        loginButton = app.buttons["loginButton"]
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginSuccess() throws {
        let app = XCUIApplication()
        app.textFields["idTextField"].tap()
        app.textFields["idTextField"].typeText("Admin")
        app.textFields["pwTextField"].tap()
        app.textFields["pwTextField"].typeText("Admin")
        loginButton.tap()
        
    }
}
