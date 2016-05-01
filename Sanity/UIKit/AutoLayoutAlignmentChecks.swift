//
//  AutoLayoutAlignmentChecks.swift
//  Sanity
//
//  Created by Sam Odom on 12/11/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit
import UIKitSwagger
import XCTest

public extension XCTestCase {

    /**
     ***Sanity Check:*** Are my views leading-edge aligned?
    
     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the leading edges of the views.
     - Parameters:
       - view1: View to check for leading-edge alignment.
       - view2: View to check for leading-edge alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckLeadingAlignment(view1: UIView, _ view2: UIView, _ message: String? = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.leading, view2.leading, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Are my views trailing-edge aligned?

     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the trailing edges of the views.

     - Parameters:
       - view1: View to check for trailing-edge alignment.
       - view2: View to check for trailing-edge alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckTrailingAlignment(view1: UIView, _ view2: UIView, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.trailing, view2.trailing, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Are my views left-edge aligned?
     
     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the left edges of the views.

     - Parameters:
       - view1: View to check for left-edge alignment.
       - view2: View to check for left-edge alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckLeftAlignment(view1: UIView, _ view2: UIView, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.left, view2.left, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Are my views right-edge aligned?

     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the right edges of the views.

     - Parameters:
       - view1: View to check for right-edge alignment.
       - view2: View to check for right-edge alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       -line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckRightAlignment(view1: UIView, _ view2: UIView, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.right, view2.right, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Are my views horizontally aligned?
     
     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the horizontal centers of the views.

     - Parameters:
       - view1: View to check for horizontal alignment.
       - view2: View to check for horizontal alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckHorizontalAlignment(view1: UIView, _ view2: UIView, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.centerX, view2.centerX, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Are my views top-edge aligned?

     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the top edges of the views.

     - Parameters:
       - view1: View to check for top-edge alignment.
       - view2: View to check for top-edge alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckTopAlignment(view1: UIView, _ view2: UIView, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.top, view2.top, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Are my views bottom-edge aligned?

     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the bottom edges of the views.

     - Parameters:
       - view1: View to check for bottom-edge alignment.
       - view2: View to check for bottom-edge alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckBottomAlignment(view1: UIView, _ view2: UIView, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.bottom, view2.bottom, reportParameters: reportParameters)
    }

    /**
     ***Sanity Check:*** Are my views vertically aligned?

     This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the vertical centers of the views.

     - Parameters:
       - view1: View to check for vertical alignment.
       - view2: View to check for vertical alignment.
       - message: (Optional) Custom message to report with test failure.  Suitable default provided.
       - file: (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
       - line: (Optional) Custom line number to report with test failure.  Calling line number used by default.
     */
    public func CheckVerticalAlignment(view1: UIView, _ view2: UIView, _ message: String! = nil, file: String = #file, line: UInt = #line) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.centerY, view2.centerY, reportParameters: reportParameters)
    }

}
