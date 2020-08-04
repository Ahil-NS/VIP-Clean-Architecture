//
//  NSBaseStackView.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

class NSStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    final private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        alignment = .fill
        spacing = 0
        setupViews()
    }

    func setupViews() {
        //to be overriden in subClasses
    }
}

class NSVerticalStackView: NSStackView {

    override func setupViews() {
        super.setupViews()
        axis = .vertical
    }
}

class NSHorizontalStackView: NSStackView {

    override func setupViews() {
        super.setupViews()
        axis = .horizontal
    }
}
