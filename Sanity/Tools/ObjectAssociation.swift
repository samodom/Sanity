//
//  ObjectAssociation.swift
//  Sanity
//
//  Created by Sam Odom on 12/8/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import Foundation

public protocol ObjectAssociable {
    func associateKey(key: String, withObject: AnyObject)
    func associationForKey(key: String) -> AnyObject?
    func dissociateKey(key: String)
}

private let RetainAssociationPolicy: objc_AssociationPolicy = UInt(OBJC_ASSOCIATION_RETAIN)
private let AssignAssociationPolicy: objc_AssociationPolicy = UInt(OBJC_ASSOCIATION_ASSIGN)

extension NSObject: ObjectAssociable {

    public func associateKey(key: String, withObject object: AnyObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            objc_setAssociatedObject(self, key, object, RetainAssociationPolicy)
        })
    }

    public func associationForKey(key: String) -> AnyObject? {
//        dispatch_sync(dispatch_get_main_queue(), {
            return objc_getAssociatedObject(self, key) as AnyObject?
//        })
    }

    public func dissociateKey(key: String) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            objc_setAssociatedObject(self, key, nil, AssignAssociationPolicy)
        })
    }

}
