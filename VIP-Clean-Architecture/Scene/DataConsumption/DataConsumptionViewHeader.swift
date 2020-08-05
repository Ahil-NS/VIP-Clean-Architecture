//
//  DataConsumptionViewHeader.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

class DataConsumptionViewHeader: UITableViewHeaderFooterView {
    
    var vm: String? {
        didSet {
            titleLabel.text = vm
        }
    }
    private let titleLabel : NSLabel = {
        let lbl = NSLabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    static var reuseIdentifier: String {
        return String(describing: DataConsumptionViewHeader.self)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        contentView.backgroundColor = .orange
        addSubview(titleLabel)
        titleLabel.fill(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
