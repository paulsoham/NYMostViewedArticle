//
//  MostViewedInNYTimesTests.swift
//  MostViewedInNYTimesTests
//
//  Created by apple on 08/03/18.
//  Copyright © 2018 Soham Paul. All rights reserved.
//
import UIKit
import XCTest
@testable import MostViewedInNYTimes

class MostViewedInNYTimesTests: XCTestCase {
    var controller: MasterViewController!
    var testTable = UITableView()


    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testTable.register(NYMasterTableViewCell.self, forCellReuseIdentifier:"NYMasterTableViewCellID")

    }
    
    func testCustomCell() {
        let customCell: NYMasterTableViewCell = testTable.dequeueReusableCell(withIdentifier:"NYMasterTableViewCellID") as! NYMasterTableViewCell
        XCTAssertNotNil(customCell, "No Custom Cell Available")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    
   
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
