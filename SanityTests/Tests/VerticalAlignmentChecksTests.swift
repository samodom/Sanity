//
//  VerticalAlignmentChecksTests.swift
//  Sanity
//
//  Created by Sam Odom on 12/11/14.
//  Copybottom (c) 2014 Sam Odom. All bottoms reserved.
//

import XCTest
import UIKitSwagger
@testable import Sanity

class VerticalAlignmentChecksTests: SanityCheckTestCase {

    let superview = UIView()
    let anchorView = UIView()
    let subview1 = UIImageView()
    let subview2 = UIButton()
    let unrelated = UIView()
    var allConstraints: [NSLayoutConstraint]!

    override func setUp() {
        super.setUp()

        anchorView += subview1
        superview += [anchorView, subview2]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFailingTopAlignmentChecks() {
        nextLineIsSanityCheckFailure()
        CheckTopAlignment(superview, anchorView)

        (subview2.top =* anchorView.top + 4).activate()
        nextLineIsSanityCheckFailure()
        CheckTopAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignBottom(subview1, subview2)
        nextLineIsSanityCheckFailure()
        CheckTopAlignment(subview1, subview2, "The subviews should be top-aligned with one another")
        expectCustomFailureMessage("The subviews should be top-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckTopAlignment(subview1, unrelated)
        expectCustomFailureMessage(DefaultUnrelatedViewsMessage)

        assessExpectedSanityCheckFailuresWithDefaultMessage(message: "The two views should be aligned by their top attributes")
    }

    func testPassingTopAlignmentChecks() {
        AlignTop(superview, anchorView)
        CheckTopAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignTop(anchorView, subview2)
        CheckTopAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignTop(subview1, subview2)
        CheckTopAlignment(subview1, subview2, "The subviews should be top-aligned with one another")

        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

    func testFailingBottomAlignmentChecks() {
        nextLineIsSanityCheckFailure()
        CheckBottomAlignment(superview, anchorView)

        superview.clearConstraints()
        (subview2.bottom =* anchorView.bottom + 4).activate()
        nextLineIsSanityCheckFailure()
        CheckBottomAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignTop(subview1, subview2)
        nextLineIsSanityCheckFailure()
        CheckBottomAlignment(subview1, subview2, "The subviews should be bottom-aligned with one another")
        expectCustomFailureMessage("The subviews should be bottom-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckBottomAlignment(subview1, unrelated)
        expectCustomFailureMessage(DefaultUnrelatedViewsMessage)

        assessExpectedSanityCheckFailuresWithDefaultMessage(message: "The two views should be aligned by their bottom attributes")
    }

    func testPassingBottomAlignmentChecks() {
        AlignBottom(superview, anchorView)
        CheckBottomAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignBottom(anchorView, subview2)
        CheckBottomAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignBottom(subview1, subview2)
        CheckBottomAlignment(subview1, subview2, "The subviews should be bottom-aligned with one another")
        
        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

    func testFailingVerticalAlignmentChecks() {
        nextLineIsSanityCheckFailure()
        CheckVerticalAlignment(superview, anchorView)

        (subview2.centerY =* anchorView.centerY + 4).activate()
        nextLineIsSanityCheckFailure()
        CheckVerticalAlignment(anchorView, subview2)

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckVerticalAlignment(subview1, subview2, "The subviews should be vertically center-aligned with one another")
        expectCustomFailureMessage("The subviews should be vertically center-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckVerticalAlignment(subview1, unrelated)
        expectCustomFailureMessage(DefaultUnrelatedViewsMessage)

        assessExpectedSanityCheckFailuresWithDefaultMessage(message: "The two views should be aligned by their center Y attributes")
        XCTAssertEqual(sanityCheckFailures.count, 4, "There should be four total sanity check failures")
    }

    func testPassingCenterYAlignmentChecks() {
        AlignVertically(superview, anchorView)
        CheckVerticalAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignVertically(anchorView, subview2)
        CheckVerticalAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignVertically(subview1, subview2)
        CheckVerticalAlignment(subview1, subview2, "The subviews should be vertically center-aligned with one another")

        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

}
