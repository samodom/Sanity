//
//  ViewControllerSuperclassChecksTests.swift
//  Sanity
//
//  Created by Sam Odom on 3/15/15.
//  Copyright (c) 2015 Sam Odom. All rights reserved.
//

import XCTest
import UIKit

class ViewControllerSuperclassChecksTests: SanityCheckTestCase {

    let goodController = GoodViewController()
    let emptyController = EmptyViewController()
    let plainController = UIViewController()
    let badController1 = BadViewController()
    let badController2 = BadViewController()
    let customMessage = "Superclass call should be made"

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFailingViewDidLoadSuperclassCheck() {
        nextLineIsSanityCheckFailure()
        CheckViewDidLoadSuperclassCall(badController1)

        nextLineIsSanityCheckFailure()
        CheckViewDidLoadSuperclassCall(badController2, customMessage)
        expectCustomFailureMessage(customMessage)

        assessExpectedSanityCheckFailuresWithDefaultMessage(message: "The view controller should call its superclass's -viewDidLoad implementation")
    }

    func testPassingViewDidLoadSuperclassCheck() {
        CheckViewDidLoadSuperclassCall(goodController)
        CheckViewDidLoadSuperclassCall(emptyController)
        CheckViewDidLoadSuperclassCall(plainController, customMessage)

        assessExpectedSanityCheckFailuresWithDefaultMessage(message: "The view controller should call its superclass's -viewDidLoad implementation")
    }

    func testFailingViewWillAppearSuperclassCheck() {

    }

    func testPassingViewWillAppearSuperclassCheck() {

    }

    func testFailingViewDidAppearSuperclassCheck() {

    }

    func testPassingViewDidAppearSuperclassCheck() {

    }

    func testFailingViewWillDisappearSuperclassCheck() {

    }

    func testPassingViewWillDisappearSuperclassCheck() {

    }

    func testFailingViewDidDisappearSuperclassCheck() {
        
    }
    
    func testPassingViewDidDisappearSuperclassCheck() {
        
    }

}
