//
//  ViewControllerSupercallChecks.swift
//  Sanity
//
//  Created by Sam Odom on 3/29/15.
//  Copyright (c) 2015 Sam Odom. All rights reserved.
//

import XCTest
import UIKit

public extension XCTestCase {

    /**
      Sanity Check: Does my view controller call its superclass's -viewDidLoad implementation?
      @param            viewController View controller to check for a call to its superclass' -viewDidLoad implementation.
      @discussion       This method will check to see if the provided view controller makes a call to its superclass's -viewDidLoad implementation in its own implementation of that method.
    */
    public func CheckViewDidLoadSuperclassCall(viewController: UIViewController, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)

        viewController.viewDidLoad()
        if !viewController.calledViewDidLoad {
            recordSanityCheckFailure(reportParameters)
        }

    }

}
