//
//  RPTestUITests.swift
//  RPTestUITests
//
//  Created by ROMAN VRONSKY on 04.05.2023.
//

import XCTest

final class RPTestUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShowAlert() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let searchButton = app.buttons["SearchButton"]
        searchButton.tap()
        
        XCTAssert(app.alerts["Введите запрос"].waitForExistence(timeout: 1))
        
    }
}
/*
 В этoм тесте проверяем появляется ли алерт на HomeView при нажатии на кнопку "Сгенерировать" если TextField пуст
 */
