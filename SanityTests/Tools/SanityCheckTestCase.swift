//
//  SanityCheckTestCase.swift
//  Sanity
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest

public class SanityCheckTestCase: XCTestCase {
    internal var sanityCheckFailures = [SanityCheckFailure]()
    internal var sanityCheckLineNumbers = [UInt] ()

    internal func nextLineIsSanityCheckFailure(fromLine: UInt = __LINE__) {
        let lineNumber = fromLine.successor()
        sanityCheckLineNumbers.append(lineNumber)
    }

    private func lineNumberIsForSanityCheck(lineNumber: UInt) -> Bool {
        return contains(sanityCheckLineNumbers, lineNumber)
    }

    override public func recordFailureWithDescription(description: String!, inFile filePath: String!, atLine lineNumber: UInt, expected: Bool) {
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
