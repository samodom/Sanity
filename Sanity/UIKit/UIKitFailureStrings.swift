//
//  UIKitFailureStrings.swift
//  Sanity
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import Foundation

internal let DefaultCheckSquareConstraintMessage = "The view's aspect ratio should be constrained to a square"
internal let DefaultCheckAspectRatioConstraintMessageTokens =
(startToken: "The view's width should be ",
    equalToken: "equal to its height",
    multipleToken: " times its height",
    offsetToken: " plus an offset of ",
    endToken: " pt")