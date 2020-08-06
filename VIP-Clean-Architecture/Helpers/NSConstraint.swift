//
//  NSConstraint.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

public extension UIView {
    
    func constrainWidth(to containerView: UIView) {
        widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
    }
    
    func fill(_ containerView: UIView, withMargin margin: CGFloat = 0.0) {
        leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin).isActive = true
        trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin).isActive = true
        bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -margin).isActive = true
        topAnchor.constraint(equalTo: containerView.topAnchor, constant: margin).isActive = true
    }
    
    func constrainHeight999Priority(to height: CGFloat) {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.priority = UILayoutPriority(999)
        constraint.isActive = true
    }
}

