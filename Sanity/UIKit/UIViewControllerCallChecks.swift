//
//  UIViewControllerCallChecks.swift
//  Sanity
//
//  Created by Sam Odom on 12/28/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import TestableUIKit
import XCTest

public extension XCTestCase {

    public func CheckViewDidLoadSuperclassCall(controller: UIKit.UIViewController, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        controller.viewDidLoad()
        if !controller.calledViewDidLoad {
            message = message ?? message = defaultCheckSuperclassCallMessage(subclassTypeName: "view controller", forSelectorName: "-viewDidLoad")
            let parameters = SanityCheckFailureReportParameters(message, file, line)
            recordSanityCheckFailure(parameters)
        }
    }

}

private func defaultCheckSuperclassCallMessage(subclassTypeName subclassName: String, forSelectorName selectorName: String) -> String {
    let tokens = DefaultCheckSuperclassCallMessageTokens
    return tokens.startToken + subclassName + tokens.shouldCallToken + selectorName + tokens.endToken
}
