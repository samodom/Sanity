//
//  XCTestCaseFailureReporting.swift
//  Sanity
//
//  Created by Sam Odom on 12/17/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest

internal extension XCTestCase {

    internal func recordSanityCheckFailure(parameters: SanityCheckFailureReportParameters) {
        recordFailureWithDescription(
            parameters.message,
            inFile: parameters.filePath,
            atLine: parameters.lineNumber,
            expected: true
        )
    }

}
