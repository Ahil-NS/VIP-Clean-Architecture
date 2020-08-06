//
//  NSBaseViews.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

class NSView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    final private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    func setupConstraints() {
        //to be overriden in subClasses
    }
    
    
}

class NSLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private final func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class NSButton: UIButton {
    
    var indexPath: IndexPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private final func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

