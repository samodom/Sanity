//
//  AutoLayoutCommon.swift
//  Sanity
//
//  Created by Sam Odom on 12/16/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest
import UIKit
import UIKitSwagger

internal extension XCTestCase {

    internal func CheckViewsAreRelated(view1: UIView, _ view2: UIView, var reportParameters: SanityCheckFailureReportParameters) -> Bool {
        let ancestor = view1.firstCommonAncestor(view2)
        if ancestor != nil {
            return true
        }

        reportParameters.message = reportParameters.message ?? DefaultUnrelatedViewsMessage
        recordSanityCheckFailure(reportParameters)
        return false
    }

    internal func CheckViewAlignment(item1: AutoLayoutAttributedItem, _ item2: AutoLayoutAttributedItem, var reportParameters: SanityCheckFailureReportParameters) {
        assert(item1.attribute == item2.attribute, "The attributes for the items must match")

        let view1 = item1.item as UIView
        let view2 = item2.item as UIView
        if !CheckViewsAreRelated(view1, view2, reportParameters: reportParameters) {
            return
        }

        let ancestor = view1.firstCommonAncestor(view2)!
        let expectedConstraint = item1 =* item2
        if !ancestor.hasConstraint(expectedConstraint) {
            reportParameters.message = reportParameters.message ?? defaultCheckAlignmentConstraintMessageWithAttribute(item1.attribute)
            recordSanityCheckFailure(reportParameters)
        }
    }

    private func defaultCheckAlignmentConstraintMessageWithAttribute(attribute: NSLayoutAttribute) -> String {
        let attributeName = MessageNamesForAttributes[attribute]
        assert(attributeName != nil, "There should be a message name defined for the layout attribute")
        return DefaultCheckAlignmentConstraintMessageTokens.startToken + attributeName! + DefaultCheckAlignmentConstraintMessageTokens.endToken
    }

}

private let MessageNamesForAttributes: [NSLayoutAttribute:String] = [
    .Leading: "leading",
    .Trailing: "trailing",
    .Left: "left",
    .Right: "right",
    .CenterX: "center X"
]
