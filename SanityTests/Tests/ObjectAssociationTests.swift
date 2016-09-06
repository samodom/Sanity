//
//  ObjectAssociationTests.swift
//  Sanity
//
//  Created by Sam Odom on 12/8/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit
import XCTest

class ObjectAssociationTests: XCTestCase {

    let userObject = NSObject()
    let associatedObject = NSObject()
    var association: NSObject?

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()

        userObject.description
        associatedObject.description
    }

    func testObjectAssociation() {
        objc_setAssociatedObject(userObject, "key", associatedObject, UInt(OBJC_ASSOCIATION_RETAIN))
        association = objc_getAssociatedObject(userObject, "key") as? NSObject
        XCTAssertEqual(association!, associatedObject, "The object should now have a retained association")
    }

    func testSettingAssociatedObject() {
        userObject.associateKey("key", withObject: associatedObject)
        let association = objc_getAssociatedObject(userObject, "key") as? NSObject
        XCTAssertEqual(association!, associatedObject, "The object should now have a retained association")
    }

    func testGettingAssociatedObject() {
        objc_setAssociatedObject(userObject, "key", associatedObject, UInt(OBJC_ASSOCIATION_RETAIN))
        association = userObject.associationForKey("key") as NSObject?
        XCTAssertNotNil(association, "The object should return its association")
        XCTAssertEqual(association!, associatedObject, "The object should return its association")
    }

    func testRemovingAssociatedObject() {
        let anotherObject = NSObject()
        objc_setAssociatedObject(userObject, "key", associatedObject, UInt(OBJC_ASSOCIATION_RETAIN))
        objc_setAssociatedObject(userObject, "another key", anotherObject, UInt(OBJC_ASSOCIATION_RETAIN))
        userObject.dissociateKey("key")
        association = objc_getAssociatedObject(userObject, "key") as? NSObject
        XCTAssertNil(association, "The association should be cleared")
        association = objc_getAssociatedObject(userObject, "another key") as? NSObject
        XCTAssertEqual(association!, anotherObject, "Only the specified key should be dissociated")
    }

    func testEverythingTogetherForThreadingPurposes() {
        userObject.associateKey("key", withObject: associatedObject)
        XCTAssertEqual(userObject.associationForKey("key") as NSObject, associatedObject, "Both methods should work together")
    }

}
