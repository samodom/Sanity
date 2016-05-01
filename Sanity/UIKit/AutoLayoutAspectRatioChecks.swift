//
//  AutoLayoutChecks.swift
//  Sanity
//
//  Created by Sam Odom on 12/4/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest
import UIKitSwagger

public extension XCTestCase {

    /**
     ***Sanity Check:*** Is my view constrained to be square?
     
     This method will check to see if the provided view has an applied constraint that constrains the dimensions of the view to be equal.

     - Parameters:
       - view: View to check for square aspect ratio constraint.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckConstrainedToSquare(view: UIView, _ message: String = DefaultCheckSquareConstraintMessage, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        CheckWidthToHeightConstraint(view, widthToHeightRatio: 1, widthToHeightOffset: 0, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Is my view constrained to a particular aspect ratio?
     
     This method will check to see if the provided view has an applied constraint that constrains the dimensions of the view to the specified width-to-height ratio.
     
     - Parameters:
       - view: View to check for aspect ratio constraint.
       - ratio: Expected width-to-height ratio.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckConstrainedToAspectRatio(view: UIView, ratio widthToHeightRatio: CGFloat = 1, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        CheckConstrainedToAspectRatio(view, ratio: widthToHeightRatio, offset: 0, message, file: file, line: line)
    }

    /**
     ***Sanity Check:*** Is my view constrained to a particular aspect ratio plus an offset?  Is its width a constant amount greater or lesser than its height?
     
     This method will check to see if the provided view has an applied constraint that constrains the dimensions of the view to the specified width-to-height ratio plus a constant offset.
     
     - Parameters:
       - view: View to check for aspect ratio constraint.
       - ratio: Expected width-to-height ratio.
       - offset: Expected offset to the constrained aspect ratio.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckConstrainedToAspectRatio(view: UIView, ratio widthToHeightRatio: CGFloat = 1, offset widthToHeightOffset: CGFloat, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let messageToUse = message ??
            defaultCheckAspectRatioConstraintMessage(ratio: widthToHeightRatio, offset: widthToHeightOffset)

        let reportParameters = SanityCheckFailureReportParameters(messageToUse, file, line)
        CheckWidthToHeightConstraint(view, widthToHeightRatio: widthToHeightRatio, widthToHeightOffset: widthToHeightOffset, reportParameters: reportParameters)
    }

    private func CheckWidthToHeightConstraint(view: UIView, widthToHeightRatio: CGFloat, widthToHeightOffset: CGFloat, reportParameters: SanityCheckFailureReportParameters) {
        let constraint = view.width =* widthToHeightRatio * view.height + widthToHeightOffset
        if !view.hasConstraint(constraint) {
            recordSanityCheckFailure(reportParameters)
        }
    }

}

private func defaultCheckAspectRatioConstraintMessage(ratio ratio: CGFloat, offset: CGFloat) -> String {
    let tokens = DefaultCheckAspectRatioConstraintMessageTokens
    var message = tokens.startToken

    if ratio == 1 {
        message += tokens.equalToken
    }
    else {
        message += "\(ratio)" + tokens.multipleToken
    }

    if offset != 0 {
        message += tokens.offsetToken + "\(offset)" + tokens.endToken
    }

    return message
}
