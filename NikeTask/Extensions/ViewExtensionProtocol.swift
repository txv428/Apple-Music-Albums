//
//  ViewExtensionProtocol.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

protocol ViewExtensionProtocol {
    
    func anchor(top: NSLayoutYAxisAnchor?,
                paddingTop: CGFloat,
                bottom: NSLayoutYAxisAnchor?,
                paddingBottom: CGFloat,
                left: NSLayoutXAxisAnchor?,
                paddingLeft: CGFloat,
                right: NSLayoutXAxisAnchor?,
                paddingRight: CGFloat,
                width: CGFloat,
                height: CGFloat)
    
    func anchorWith(top: NSLayoutYAxisAnchor?,
                paddingTop: CGFloat,
                bottom: NSLayoutYAxisAnchor?,
                paddingBottom: CGFloat,
                left: NSLayoutXAxisAnchor?,
                paddingLeft: CGFloat,
                right: NSLayoutXAxisAnchor?,
                paddingRight: CGFloat,
                width: CGFloat,
                greaterHeight: CGFloat)
}

