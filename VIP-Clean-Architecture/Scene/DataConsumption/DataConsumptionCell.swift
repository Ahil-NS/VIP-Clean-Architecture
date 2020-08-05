//
//  DataConsumptionCell.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

class DataConsumptionCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: DataConsumptionCell.self)
    }
    
    var cellVM: DataConsumptionCellVM? {
        didSet {
            quaterLabel.text = cellVM?.quater
            dataUsageLabel.text = cellVM?.dataUsage
            downButton.isHidden = !(cellVM?.isDecreaseVolume ?? false)
        }
    }
    
    private let quaterLabel : NSLabel = {
        let lbl = NSLabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    private let dataUsageLabel : NSLabel = {
        let lbl = NSLabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var cellStackView: NSVerticalStackView = {
        let stackView: NSVerticalStackView = NSVerticalStackView()
        stackView.addArrangedSubview(NSVertical15Spacer())
        stackView.addArrangedSubview(quaterLabel)
        stackView.addArrangedSubview(NSVertical15Spacer())
        stackView.addArrangedSubview(dataUsageLabel)
        stackView.addArrangedSubview(NSVertical15Spacer())
        return stackView
    }()
    
    lazy var cellHorizontalStackView: NSHorizontalStackView = {
        let stackView:NSHorizontalStackView = NSHorizontalStackView()
        stackView.alignment = .center
        stackView.addArrangedSubview(NSHorizontalSpacer.create(with: 15))
        stackView.addArrangedSubview(cellStackView)
        stackView.addArrangedSubview(NSHorizontalSpacer.create(with: 15))
        stackView.addArrangedSubview(downButton)
        stackView.addArrangedSubview(NSHorizontalSpacer.create(with: 15))
        return stackView
    }()
    
    
    var containerView = NSView()
    
    var downButton = NSButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        setupCloseButton()
        containerView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        containerView.layer.cornerRadius = 10
        
        
        containerView.addSubview(cellHorizontalStackView)
        cellHorizontalStackView.fill(containerView)
        
        
        contentView.addSubview(containerView)
        containerView.fill(contentView, withMargin: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCloseButton() {
        downButton.setTitle("Down", for: .normal)
        
        downButton.tintColor = .white
        downButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        downButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        downButton.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
    }
    
    @objc func downButtonTapped() {
        downButton.isHidden = true
        
    }
    
}
