//
//  UnitTestWithDelegatesTests.swift
//  UnitTestWithDelegatesTests
//
//  Created by EquipeSuporteAplicacao on 5/30/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import XCTest
@testable import UnitTestWithDelegates

class UnitTestWithDelegatesTests: XCTestCase {
    
    //SUT - System under test
    var loginManager : LoginManager!
    
    var loginViewMock : LoginViewFunctionsMock!
    
    override func setUp() {
        super.setUp()
        
        loginViewMock = LoginViewFunctionsMock()
        loginManager = LoginManager(loginViewDelegate: loginViewMock)
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWithEmptyMailAndPass() {
        let requestManager = RequestManager()
        loginManager.login(email: "", pass: "", requestManager: requestManager)
        
        XCTAssertTrue(loginViewMock.showIndicatorViewWasCalled)
        XCTAssertTrue(loginViewMock.hideIndicatorViewWasCalled)
        XCTAssertTrue(loginViewMock.alertMessageWasCalled)
        XCTAssertFalse(loginViewMock.showWelcomeScreenWasCalled)
    }
    
    func testWithErrorReturned() {
        let requestManager = ResquetManagerReturnError()
        loginManager.login(email: "teste", pass: "teste", requestManager: requestManager)
        
        XCTAssertTrue(loginViewMock.showIndicatorViewWasCalled)
        XCTAssertTrue(loginViewMock.hideIndicatorViewWasCalled)
        XCTAssertTrue(loginViewMock.alertMessageWasCalled)
        XCTAssertTrue(loginViewMock.message == "Deu ruim")
        XCTAssertFalse(loginViewMock.showWelcomeScreenWasCalled)
    }
    
    func testWithSuccess() {
        let requestManager = ResquetManagerReturnSuccess()
        loginManager.login(email: "teste", pass: "teste", requestManager: requestManager)
        
        XCTAssertTrue(loginViewMock.showIndicatorViewWasCalled)
        XCTAssertTrue(loginViewMock.hideIndicatorViewWasCalled)
        XCTAssertTrue(loginViewMock.showWelcomeScreenWasCalled)
        XCTAssertFalse(loginViewMock.alertMessageWasCalled)
    }
}

class LoginViewFunctionsMock: LoginViewFunctions {
    
    var showIndicatorViewWasCalled = false
    var hideIndicatorViewWasCalled = false
    var alertMessageWasCalled = false
    var showWelcomeScreenWasCalled = false
    var message : String = ""
    
    func showIndicatorView() {
        showIndicatorViewWasCalled = true
    }
    
    func hideIndicatorView() {
        hideIndicatorViewWasCalled = true
    }
    
    func showAlertMessage(message: String) {
        self.message = message
        alertMessageWasCalled = true
    }
    
    func showWelcomeScreen() {
        showWelcomeScreenWasCalled = true
    }
}

