//
//  SanityCheckFailure.swift
//  Sanity
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import Foundation

internal class SanityCheckFailure {
    let description: String
    let filePath: String
    let lineNumber: UInt
    let expected: Bool
    internal init(description: String, filePath: String, lineNumber: UInt, expected: Bool) {
        self.description = description
        self.filePath = filePath
        self.lineNumber = lineNumber
        self.expected = expected
    }
}
