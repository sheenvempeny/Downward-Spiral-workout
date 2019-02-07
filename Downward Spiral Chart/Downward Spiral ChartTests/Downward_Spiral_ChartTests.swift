//
//  Downward_Spiral_ChartTests.swift
//  Downward Spiral ChartTests
//
//  Created by sheen vempeny on 4/15/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import XCTest

class Downward_Spiral_ChartTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchSpiral(){
        let fetcher: DataFetcher = DataFetcher()
        fetcher.fetchSpirals { (collection: SpiralCollection?) in
           assert( collection != nil , "Problem in downloading sprial")
            guard let sprials = collection?.spirals else {
                assertionFailure("No Spirals available")
                return
            }
            assert( sprials.count > 0, "No Spirals available")
        }
        
        
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
