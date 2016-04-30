//
//  ViewHierarchy.swift
//  Sanity
//
//  Created by Sam Odom on 4/30/16.
//  Copyright © 2016 Sam Odom. All rights reserved.
//

import UIKit

internal extension UIView {

    /**
     Searches for the first common view at or above this view and the provided view.

     :param:       view View whose hierarchy should be searched along with the current view.
     :returns:     First common ancestor of the current and provided views, if they share one.
     */
    internal func firstCommonAncestor(view: UIView) -> UIView? {
        if isDescendantOfView(view) {
            return view
        }

        if view.isDescendantOfView(self) {
            return self
        }
        
        return superview?.firstCommonAncestor(view)
    }
    
    
}
