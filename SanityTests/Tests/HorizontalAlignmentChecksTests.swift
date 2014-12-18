//
//  HorizontalAlignmentChecksTests.swift
//  Sanity
//
//  Created by Sam Odom on 12/11/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit
import UIKitSwagger
import XCTest

class HorizontalAlignmentChecksTests: SanityCheckTestCase {

    let superview = UIView()
    let anchorView = UIView()
    let subview1 = UIView()
    let subview2 = UIView()
    let unrelated = UIView()
    var allConstraints: [Constraint]!

    override func setUp() {
        super.setUp()

        anchorView += subview1
        superview += [anchorView, subview2]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFailingLeadingAlignmentChecks() {
        AlignLeft(superview, anchorView)
        nextLineIsSanityCheckFailure()
        CheckLeadingAlignment(superview, anchorView)

        superview.clearConstraints()
        (subview2.leading =* anchorView.leading + 4).apply()
        nextLineIsSanityCheckFailure()
        CheckLeadingAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignTrailing(subview1, subview2)
        nextLineIsSanityCheckFailure()
        CheckLeadingAlignment(subview1, subview2, "The subviews should be leading-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckLeadingAlignment(subview1, unrelated)

        XCTAssertEqual(sanityCheckFailures.count, 4, "There should be four total sanity check failures")
        for index in 0 ..< sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            switch index {
            case 2:
                XCTAssertEqual(failure.description, "The subviews should be leading-aligned with one another", "The provided message should be used in the failure")

            case 3:
                XCTAssertEqual(failure.description, "The provided views are unrelated", "The message should express the inability to check constraints due to the views not sharing the same hierarchy")

            default:
                XCTAssertEqual(failure.description, "The two views should be aligned by their leading attributes", "A general description should be reported")
            }

            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingLeadingAlignmentChecks() {
        AlignLeading(superview, anchorView)
        CheckLeadingAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignLeading(anchorView, subview2)
        CheckLeadingAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignLeading(subview1, subview2)
        CheckLeadingAlignment(subview1, subview2, "The subviews should be leading-aligned with one another")

        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

    func testFailingTrailingAlignmentChecks() {
        AlignRight(superview, anchorView)
        nextLineIsSanityCheckFailure()
        CheckTrailingAlignment(superview, anchorView)

        superview.clearConstraints()
        (subview2.trailing =* anchorView.trailing + 4).apply()
        nextLineIsSanityCheckFailure()
        CheckTrailingAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignLeading(subview1, subview2)
        nextLineIsSanityCheckFailure()
        CheckTrailingAlignment(subview1, subview2, "The subviews should be trailing-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckTrailingAlignment(subview1, unrelated)

        XCTAssertEqual(sanityCheckFailures.count, 4, "There should be four total sanity check failures")
        for index in 0 ..< sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            switch index {
            case 2:
                XCTAssertEqual(failure.description, "The subviews should be trailing-aligned with one another", "The provided message should be used in the failure")

            case 3:
                XCTAssertEqual(failure.description, "The provided views are unrelated", "The message should express the inability to check constraints due to the views not sharing the same hierarchy")

            default:
                XCTAssertEqual(failure.description, "The two views should be aligned by their trailing attributes", "A general description should be reported")
            }

            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingTrailingAlignmentChecks() {
        AlignTrailing(superview, anchorView)
        CheckTrailingAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignTrailing(anchorView, subview2)
        CheckTrailingAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignTrailing(subview1, subview2)
        CheckTrailingAlignment(subview1, subview2, "The subviews should be trailing-aligned with one another")

        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

    func testFailingLeftAlignmentChecks() {
        AlignLeading(superview, anchorView)
        nextLineIsSanityCheckFailure()
        CheckLeftAlignment(superview, anchorView)

        superview.clearConstraints()
        (subview2.left =* anchorView.left + 4).apply()
        nextLineIsSanityCheckFailure()
        CheckLeftAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignRight(subview1, subview2)
        nextLineIsSanityCheckFailure()
        CheckLeftAlignment(subview1, subview2, "The subviews should be left-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckLeftAlignment(subview1, unrelated)

        XCTAssertEqual(sanityCheckFailures.count, 4, "There should be four total sanity check failures")
        for index in 0 ..< sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            switch index {
            case 2:
                XCTAssertEqual(failure.description, "The subviews should be left-aligned with one another", "The provided message should be used in the failure")

            case 3:
                XCTAssertEqual(failure.description, "The provided views are unrelated", "The message should express the inability to check constraints due to the views not sharing the same hierarchy")

            default:
                XCTAssertEqual(failure.description, "The two views should be aligned by their left attributes", "A general description should be reported")
            }

            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingLeftAlignmentChecks() {
        AlignLeft(superview, anchorView)
        CheckLeftAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignLeft(anchorView, subview2)
        CheckLeftAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignLeft(subview1, subview2)
        CheckLeftAlignment(subview1, subview2, "The subviews should be left-aligned with one another")

        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

    func testFailingRightAlignmentChecks() {
        AlignTrailing(superview, anchorView)
        nextLineIsSanityCheckFailure()
        CheckRightAlignment(superview, anchorView)

        superview.clearConstraints()
        (subview2.right =* anchorView.right + 4).apply()
        nextLineIsSanityCheckFailure()
        CheckRightAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignLeft(subview1, subview2)
        nextLineIsSanityCheckFailure()
        CheckRightAlignment(subview1, subview2, "The subviews should be right-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckRightAlignment(subview1, unrelated)

        XCTAssertEqual(sanityCheckFailures.count, 4, "There should be four total sanity check failures")
        for index in 0 ..< sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            switch index {
            case 2:
                XCTAssertEqual(failure.description, "The subviews should be right-aligned with one another", "The provided message should be used in the failure")

            case 3:
                XCTAssertEqual(failure.description, "The provided views are unrelated", "The message should express the inability to check constraints due to the views not sharing the same hierarchy")

            default:
                XCTAssertEqual(failure.description, "The two views should be aligned by their right attributes", "A general description should be reported")
            }

            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingRightAlignmentChecks() {
        AlignRight(superview, anchorView)
        CheckRightAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignRight(anchorView, subview2)
        CheckRightAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignRight(subview1, subview2)
        CheckRightAlignment(subview1, subview2, "The subviews should be right-aligned with one another")
        
        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

    func testFailingHorizontalAlignmentChecks() {
        nextLineIsSanityCheckFailure()
        CheckHorizontalAlignment(superview, anchorView)

        (subview2.centerX =* anchorView.centerX + 4).apply()
        nextLineIsSanityCheckFailure()
        CheckHorizontalAlignment(anchorView, subview2)

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckHorizontalAlignment(subview1, subview2, "The subviews should be horizontally center-aligned with one another")

        superview.clearConstraints()
        nextLineIsSanityCheckFailure()
        CheckHorizontalAlignment(subview1, unrelated)

        XCTAssertEqual(sanityCheckFailures.count, 4, "There should be four total sanity check failures")
        for index in 0 ..< sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            switch index {
            case 2:
                XCTAssertEqual(failure.description, "The subviews should be horizontally center-aligned with one another", "The provided message should be used in the failure")

            case 3:
                XCTAssertEqual(failure.description, "The provided views are unrelated", "The message should express the inability to check constraints due to the views not sharing the same hierarchy")

            default:
                XCTAssertEqual(failure.description, "The two views should be aligned by their center X attributes", "A general description should be reported")
            }

            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingCenterXAlignmentChecks() {
        AlignHorizontally(superview, anchorView)
        CheckHorizontalAlignment(superview, anchorView)

        superview.clearConstraints()
        AlignHorizontally(anchorView, subview2)
        CheckHorizontalAlignment(anchorView, subview2)

        superview.clearConstraints()
        AlignHorizontally(subview1, subview2)
        CheckHorizontalAlignment(subview1, subview2, "The subviews should be horizontally center-aligned with one another")

        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no sanity check failures")
    }

}
