//
//  SanityCheckFailureReportParameters.swift
//  Sanity
//
//  Created by Sam Odom on 12/17/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import Foundation

internal struct SanityCheckFailureReportParameters {
    internal var message: String?
    internal let filePath: String
    internal let lineNumber: UInt
    internal init(_ message: String?, _ filePath: String, _ lineNumber: UInt) {
        self.message = message
        self.filePath = filePath
        self.lineNumber = lineNumber
    }

}
