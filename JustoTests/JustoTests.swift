//
//  JustoTests.swift
//  JustoTests
//
//  Created by Gersain Aguilar on 14/08/21.
//

import XCTest
@testable import Justo

class JustoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testErrorAboutDeveloper() throws {
        
        let mainVC = ViewController()
        XCTAssertEqual(mainVC.viewModel.getUSerName(), "Gersain", "The code was modified")
    }
    
    func testSuccessAboutDeveloper(){
        
        let mainVC = ViewController()
        XCTAssertEqual(mainVC.viewModel.getUSerName(), "Gersaín Aguilar Pardo", "The code was correct")
    }
    
    func testWSRandom(){
        
        let mainVC = ViewController()
        XCTAssertEqual(mainVC.viewModel.getUSerName(), "Gersaín Aguilar Pardo", "The code was correct")
    }
    
    func testExample() throws {
        
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
