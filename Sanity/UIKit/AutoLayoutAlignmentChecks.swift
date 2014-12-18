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
      Sanity Check: Are my views leading-edge aligned?
      @param            view1 View to check for leading-edge alignment.
      @param            view2 View to check for leading-edge alignment.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the leading edges of the views.
    */
    public func CheckLeadingAlignment(view1: UIView, _ view2: UIView, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.leading, view2.leading, reportParameters: reportParameters)
    }

    /**
      Sanity Check: Are my views trailing-edge aligned?
      @param            view1 View to check for trailing-edge alignment.
      @param            view2 View to check for trailing-edge alignment.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the trailing edges of the views.
    */
    public func CheckTrailingAlignment(view1: UIView, _ view2: UIView, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.trailing, view2.trailing, reportParameters: reportParameters)
    }

    /**
      Sanity Check: Are my views left-edge aligned?
      @param            view1 View to check for left-edge alignment.
      @param            view2 View to check for left-edge alignment.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the left edges of the views.
    */
    public func CheckLeftAlignment(view1: UIView, _ view2: UIView, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.left, view2.left, reportParameters: reportParameters)
    }

    /**
      Sanity Check: Are my views right-edge aligned?
      @param            view1 View to check for right-edge alignment.
      @param            view2 View to check for right-edge alignment.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the right edges of the views.
    */
    public func CheckRightAlignment(view1: UIView, _ view2: UIView, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.right, view2.right, reportParameters: reportParameters)
    }

    /**
      Sanity Check: Are my views horizontally aligned?
      @param            view1 View to check for horizontal alignment.
      @param            view2 View to check for horizontal alignment.
      @param            message (Optional) Custom message to report with test failure.  Suitable default provided.
      @param            file (Optional) Custom file path to report with test failure.  File path of calling test file used by default.
      @param            line (Optional) Custom line number to report with test failure.  Calling line number used by default.
      @discussion       This method will check to see if the first common ancestor of the provided views has an applied constraint that aligns the horizontal centers of the views.
    */
    public func CheckHorizontalAlignment(view1: UIView, _ view2: UIView, var _ message: String! = nil, file: String = __FILE__, line: UInt = __LINE__) {
        let reportParameters = SanityCheckFailureReportParameters(message, file, line)
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        CheckViewAlignment(view1.centerX, view2.centerX, reportParameters: reportParameters)
    }

}
