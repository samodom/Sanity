//
//  GenericSanityChecksTests.swift
//  Sanity
//
//  Created by Sam Odom on 12/3/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest

class GenericSanityChecksTests: XCTestCase {

    var sanityCheck = SanityCheck()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSanityCheckSubclass() {
        XCTAssertTrue(sanityCheck.isKindOfClass(XCTestCase), "The sanity check test class should be a subclass of XCTestCase")
    }

}
