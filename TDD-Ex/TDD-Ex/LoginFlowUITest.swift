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
    
    func testAuto() {
        let app = XCUIApplication()
        app.textFields["idTextField"].tap()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Continue"]/*[[".otherElements[\"UIContinuousPathIntroductionView\"]",".buttons[\"Continue\"].staticTexts[\"Continue\"]",".staticTexts[\"Continue\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let shiftButton = app/*@START_MENU_TOKEN@*/.buttons["shift"]/*[[".keyboards.buttons[\"shift\"]",".buttons[\"shift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        shiftButton.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        
        let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()
        dKey.tap()
        
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        mKey.tap()
        
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        iKey.tap()
        
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()
        nKey.tap()
        
        let pwtextfieldTextField = app.textFields["pwTextField"]
        pwtextfieldTextField.tap()
        pwtextfieldTextField.tap()
        shiftButton.tap()
        aKey.tap()
        aKey.tap()
        dKey.tap()
        dKey.tap()
        mKey.tap()
        mKey.tap()
        iKey.tap()
        iKey.tap()
        nKey.tap()
        nKey.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Button"]/*[[".buttons[\"Button\"].staticTexts[\"Button\"]",".buttons[\"loginButton\"].staticTexts[\"Button\"]",".staticTexts[\"Button\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
    }
}
