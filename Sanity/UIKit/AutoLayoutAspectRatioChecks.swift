//
//  AutoLayoutChecks.swift
//  Sanity
//
//  Created by Sam Odom on 12/4/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit
import UIKitSwagger
import XCTest

public extension XCTestCase {

    /**
      Sanity Check: Is my view constrained to be square?
      @param            view View to check for square aspect ratio constraint.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the provided view has an applied constraint that constrains the dimensions of the view to be equal.
    */
    public func CheckConstrainedToSquare(view: UIView, _ message: String = DefaultCheckSquareConstraintMessage, file: String = __FILE__, line: UInt = __LINE__) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        CheckWidthToHeightConstraint(view, widthToHeightRatio: 1, widthToHeightOffset: 0, reportParameters: reportParameters)
    }

    /**
      Sanity Check: Is my view constrained to a particular aspect ratio?
      @param            view View to check for aspect ratio constraint.
      @param            ratio Expected width-to-height ratio.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the provided view has an applied constraint that constrains the dimensions of the view to the specified width-to-height ratio.
    */
    public func CheckConstrainedToAspectRatio(view: UIView, ratio widthToHeightRatio: CGFloat = 1, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        CheckConstrainedToAspectRatio(view, ratio: widthToHeightRatio, offset: 0, message, file: file, line: line)
    }

    /**
    Sanity Check: Is my view constrained to a particular aspect ratio plus an offset?  Is its width a constant amount greater or lesser than its height?
      @param            view View to check for aspect ratio constraint.
      @param            ratio Expected width-to-height ratio.
      @param            offset Expected offset to the constrained aspect ratio.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the provided view has an applied constraint that constrains the dimensions of the view to the specified width-to-height ratio plus a constant offset.
    */
    public func CheckConstrainedToAspectRatio(view: UIView, ratio widthToHeightRatio: CGFloat = 1, offset widthToHeightOffset: CGFloat, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        if message == nil {
            message = defaultCheckAspectRatioConstraintMessage(ratio: widthToHeightRatio, offset: widthToHeightOffset)
        }

        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        CheckWidthToHeightConstraint(view, widthToHeightRatio: widthToHeightRatio, widthToHeightOffset: widthToHeightOffset, reportParameters: reportParameters)
    }

}


////////////////////////////////////////////////////////////////////////////////

private extension XCTestCase {

    private func defaultCheckAspectRatioConstraintMessage(#ratio: CGFloat, offset: CGFloat) -> String {
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

    private func CheckWidthToHeightConstraint(view: UIView, widthToHeightRatio: CGFloat, widthToHeightOffset: CGFloat, reportParameters: SanityCheckFailureReportParameters) {
        let constraint = view.width =* widthToHeightRatio * view.height + widthToHeightOffset
        if !view.hasConstraint(constraint) {
            recordSanityCheckFailure(reportParameters)
        }
    }

}
