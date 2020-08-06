//
//  DataConsumptionCell.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

protocol  DataConsumptionCellDelagate: class {
    func downButtonTapped()
}

class DataConsumptionCell: UITableViewCell {
    
    weak var delegate: DataConsumptionCellDelagate?
    
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
    
    let quaterLabel : NSLabel = {
        let lbl = NSLabel()
        lbl.textColor = SPHC.SPHBlue
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let dataUsageLabel : NSLabel = {
        let lbl = NSLabel()
        lbl.textColor = SPHC.SPHBlue
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var cellStackView: NSVerticalStackView = {
        let stackView: NSVerticalStackView = NSVerticalStackView()
        stackView.addArrangedSubview(NSVertical15Spacer())
        stackView.addArrangedSubview(quaterLabel)
        stackView.addArrangedSubview(NSVertical5Spacer())
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
        containerView.backgroundColor = SPHC.paleBlue
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
        let downImage = UIImage(named: SPHAssets.downIcon.value)
        downButton.setBackgroundImage(downImage, for: .normal)
        downButton.tintColor = .white
        downButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        downButton.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
    }
    
    @objc func downButtonTapped() {
        delegate?.downButtonTapped()
    }
}
