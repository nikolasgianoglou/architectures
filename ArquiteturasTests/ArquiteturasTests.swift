//
//  ArquiteturasTests.swift
//  ArquiteturasTests
//
//  Created by Nikolas Gianoglou Coelho on 19/09/2023.
//

import XCTest
@testable import Arquiteturas

final class ArquiteturasTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegister() throws {
        let manager = UserManager(business: UserBusiness())
        var userModel = UserModel()
        
        let expectations = expectation(description: "Check log in succesfull")
        
        manager.register(email: "aaaaaaa", password: "12345") { model in
            print(model.email)
            userModel = model
        } failureHandler: { error in
            print(error.localizedDescription)
        }
        
        manager.register(email: "teste@gmail.com", password: "12345") { model in
            print(model.email)
            userModel = model
        } failureHandler: { error in
            print(error.localizedDescription)
        }
        
        manager.register(email: "teste@gmail.com", password: "12345") { model in
            print(model.email)
            userModel = model
        } failureHandler: { error in
            print(error.localizedDescription)
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail()
            }
            XCTAssertNotNil(userModel)
        }

    }
    
    func testLogin() throws {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: "aaaaa", password: "12345") { result in
            switch result {
            case .success(let userModel):
                print(userModel.email)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        manager.login(email: "teste@teste.com", password: "12345") { result in
            switch result {
            case .success(let userModel):
                print(userModel.email)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
