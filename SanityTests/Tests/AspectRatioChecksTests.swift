//
//  AspectRatioChecksTests.swift
//  Sanity
//
//  Created by Sam Odom on 12/3/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit
import UIKitSwagger
import XCTest

class AspectRatioChecksTests: SanityCheckTestCase {

    let squareView1 = UIImageView()
    let squareView2 = UIImageView()
    let aspectRatioView = UIImageView()
    let offsetAspectRatioView = UIImageView()
    let dimensionOffsetView = UIImageView()

    override func setUp() {
        super.setUp()

        squareView1.constrainWidthToHeight()
        squareView2.constrainHeightToWidth()

        aspectRatioView.constrainWidthToHeight(2.5)
        offsetAspectRatioView.constrainWidthToHeight(2.5, offset: 10)
        dimensionOffsetView.constrainWidthToHeight(offset: 10)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFailingSquareConstraintsCheck() {
        nextLineIsSanityCheckFailure()
        CheckConstrainedToSquare(aspectRatioView)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToSquare(offsetAspectRatioView)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToSquare(dimensionOffsetView, "The image should be constrained to a square")

        XCTAssertEqual(sanityCheckFailures.count, 3, "There should be three failing sanity checks")
        for index in 0..<sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            if index == 2 {
                XCTAssertEqual(failure.description, "The image should be constrained to a square", "The provided message should be used in the failure")
            }
            else {
                XCTAssertEqual(failure.description, "The view's aspect ratio should be constrained to a square", "A general description should be reported")
            }
            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingSquareConstraintsCheck() {
        CheckConstrainedToSquare(squareView1)
        CheckConstrainedToSquare(squareView2, "The image should be constrained to a square")

        XCTAssertEqual(sanityCheckFailures.count, 0, "There should be no failing sanity checks")
    }

    func testFailingAspectRatioConstraintsCheck() {
        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(squareView1, ratio: 2.5)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(offsetAspectRatioView, ratio: 2.5)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(dimensionOffsetView, ratio: 2.5, "The image should be constrained to an aspect ratio of 5:2")

        XCTAssertEqual(sanityCheckFailures.count, 3, "There should be three failing sanity checks")
        for index in 0..<sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            if index == 2 {
                XCTAssertEqual(failure.description, "The image should be constrained to an aspect ratio of 5:2", "The provided message should be used in the failure")
            }
            else {
                XCTAssertEqual(failure.description, "The view's width should be 2.5 times its height", "A general description should be reported")
            }
            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingAspectRatioConstraintsCheck() {
        CheckConstrainedToAspectRatio(squareView1)
        CheckConstrainedToAspectRatio(squareView2, ratio: 1)
        CheckConstrainedToAspectRatio(aspectRatioView, ratio: 2.5)
    }

    func testFailingOffsetAspectRatioConstraintsCheck() {
        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(squareView1, ratio: 2.5, offset: 10)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(aspectRatioView, ratio: 2.5, offset: 10)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(dimensionOffsetView, ratio: 2.5, offset: 10, "The image should be constrained to an aspect ratio of 5:2 with an additional 10 pt offset")

        XCTAssertEqual(sanityCheckFailures.count, 3, "There should be three failing sanity checks")
        for index in 0..<sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            if index == 2 {
                XCTAssertEqual(failure.description, "The image should be constrained to an aspect ratio of 5:2 with an additional 10 pt offset", "The provided message should be used in the failure")
            }
            else {
                XCTAssertEqual(failure.description, "The view's width should be 2.5 times its height plus an offset of 10.0 pt", "A general description should be reported")
            }
            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingOffsetAspectRatioConstraintsCheck() {
        CheckConstrainedToAspectRatio(squareView2, ratio: 1, offset: 0)
        CheckConstrainedToAspectRatio(offsetAspectRatioView, ratio: 2.5, offset: 10)
    }

    func testFailingDimensionOffsetConstraintsCheck() {
        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(squareView1, offset: 10)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(aspectRatioView, offset: 10)

        nextLineIsSanityCheckFailure()
        CheckConstrainedToAspectRatio(offsetAspectRatioView, offset: 10, "The image's width should be 10 pt greater than its height")

        XCTAssertEqual(sanityCheckFailures.count, 3, "There should be three failing sanity checks")
        for index in 0..<sanityCheckFailures.count {
            let failure = sanityCheckFailures[index]
            if index == 2 {
                XCTAssertEqual(failure.description, "The image's width should be 10 pt greater than its height", "The provided message should be used in the failure")
            }
            else {
                XCTAssertEqual(failure.description, "The view's width should be equal to its height plus an offset of 10.0 pt", "A general description should be reported")
            }
            XCTAssertEqual(failure.filePath, __FILE__, "The calling file should be used")
            let lineNumber = sanityCheckLineNumbers[index]
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    func testPassingDimensionOffsetConstraintsCheck() {
        CheckConstrainedToAspectRatio(squareView1, offset: 0)
        CheckConstrainedToAspectRatio(dimensionOffsetView, offset: 10)
    }

}
