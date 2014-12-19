//
//  SanityCheckTestCase.swift
//  Sanity
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest

internal class SanityCheckTestCase: XCTestCase {
    internal var sanityCheckFailures = [SanityCheckFailure]()
    internal var sanityCheckLineNumbers = [UInt]()
    internal var customFailureExpectations = [CustomSanityCheckFailureExpectation]()

    internal func nextLineIsSanityCheckFailure(fromLine: UInt = __LINE__) {
        let lineNumber = fromLine.successor()
        sanityCheckLineNumbers.append(lineNumber)
    }

    private func lineNumberIsForSanityCheck(lineNumber: UInt) -> Bool {
        return contains(sanityCheckLineNumbers, lineNumber)
    }

    internal func expectCustomFailureMessage(message: String) {
        assert(sanityCheckLineNumbers.count > 0, "There must be an expected failure before a custom failure message can be expected")
        let expectation = CustomSanityCheckFailureExpectation(message: message, index: sanityCheckLineNumbers.count - 1)
        customFailureExpectations.append(expectation)
    }

    internal func assessExpectedSanityCheckFailuresWithDefaultMessage(message defaultMessage: String, filePath: String = __FILE__) {
        let expectedFailureCount = sanityCheckLineNumbers.count
        XCTAssertEqual(sanityCheckFailures.count, expectedFailureCount, "There should be \(expectedFailureCount) failing sanity checks")

        for index in 0  ..< expectedFailureCount {
            let failure = sanityCheckFailures[index]
            if let expectedFailure = customFailureExpectationForIndex(index) {
                XCTAssertEqual(failure.description, expectedFailure.message, "The provided message should be used in the failure")
            }
            else {
                XCTAssertEqual(failure.description, defaultMessage, "A general description should be reported")
            }

            XCTAssertEqual(failure.filePath, filePath, "The calling file should be used")
            XCTAssertEqual(failure.lineNumber, sanityCheckLineNumbers[index], "The calling line number should be used")
            XCTAssertTrue(failure.expected, "The failure should be expected as it is a failed assertion")
        }
    }

    private func customFailureExpectationForIndex(index: Int) -> CustomSanityCheckFailureExpectation? {
        for failure in customFailureExpectations {
            if failure.index == index {
                return failure
            }
        }

        return nil
    }

}

internal extension SanityCheckTestCase {

    override internal func recordFailureWithDescription(description: String!, inFile filePath: String!, atLine lineNumber: UInt, expected: Bool) {
        if lineNumberIsForSanityCheck(lineNumber) {
            recordSanityCheckFailureWithDescription(description, inFile: filePath, atLine: lineNumber, expected: expected)
        }

        else {
            super.recordFailureWithDescription(description, inFile: filePath, atLine: lineNumber, expected: expected)
        }
    }

    private func recordSanityCheckFailureWithDescription(description: String!, inFile filePath: String!, atLine lineNumber: UInt, expected: Bool) {
        let failure = SanityCheckFailure(description: description, filePath: filePath, lineNumber: lineNumber, expected: expected)
        sanityCheckFailures.append(failure)
    }

}

internal struct CustomSanityCheckFailureExpectation {
    internal let message: String
    internal let index: Int
}
