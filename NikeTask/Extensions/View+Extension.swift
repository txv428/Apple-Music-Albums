//
//  View+Extension.swift
//  NikeTask
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?,
                topVal: CGFloat,
                bottom: NSLayoutYAxisAnchor?,
                bottomVal: CGFloat,
                left: NSLayoutXAxisAnchor?,
                leftVal: CGFloat,
                right: NSLayoutXAxisAnchor?,
                rightVal: CGFloat,
                width: CGFloat,
                height: CGFloat,
                centerXVal: NSLayoutXAxisAnchor,
                centerX: Bool) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top { topAnchor.constraint(equalTo: top, constant: topVal).isActive = true }
        
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -bottomVal).isActive = true }
        
        if let right = right { rightAnchor.constraint(equalTo: right, constant: -rightVal).isActive = true }
        
        if let left = left { leftAnchor.constraint(equalTo: left, constant: leftVal).isActive = true }
        
        if width != 0 { widthAnchor.constraint(equalToConstant: width).isActive = true }
        
        if height != 0 { heightAnchor.constraint(equalToConstant: height).isActive = true }
        
        if centerX == true { centerXAnchor.constraint(equalTo: centerXVal).isActive = true }
    }
}

