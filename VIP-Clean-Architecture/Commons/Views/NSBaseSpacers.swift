//
//  NSBaseSpacers.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

class NSSpacer: NSView {
    
    public static func addSpacer(withWidth width: CGFloat? = nil, withHeight height: CGFloat? = nil ) -> NSSpacer {
        
        let spacer: NSSpacer = NSSpacer()
        
        if let widthVal: CGFloat = width {
            spacer.widthAnchor.constraint(equalToConstant: widthVal).isActive = true
        }
        
        if let withHeight: CGFloat = height {
            let constraint = spacer.heightAnchor.constraint(equalToConstant: withHeight)
            constraint.priority = UILayoutPriority(500)
            constraint.isActive = true
        }
        
        return spacer
    }
    
}

class NSHorizontalSpacer: NSSpacer {
    
    static func create(with width: CGFloat) -> NSHorizontalSpacer {
        let spacer: NSHorizontalSpacer = NSHorizontalSpacer()
        spacer.widthAnchor.constraint(equalToConstant: width).isActive = true
        return spacer
    }
    
}

class NSVerticalSpacer: NSSpacer {
    
    static func create(with height: CGFloat, stack: UIStackView? = nil) -> NSVerticalSpacer {
        let spacer: NSVerticalSpacer = NSVerticalSpacer()
        spacer.heightAnchor.constraint(equalToConstant: height).isActive = true
        stack?.addArrangedSubview(spacer)
        return spacer
    }
}

class NSHorizontal15Spacer: NSHorizontalSpacer {
    
    override func setupConstraints() {
        super.setupConstraints()
        widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
}

class NSVertical15Spacer: NSVerticalSpacer {
    override func setupConstraints() {
        super.setupConstraints()
        heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
}
