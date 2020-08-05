//
//  ViewController.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import  UIKit

class DataConsumptionViewController: UIViewController {
    
    var output: DataConsumptionInteractorInput?
    var router: DataConsumptionRouterProtocol?
    
    private var cellVMs: [DataConsumptionCellVM] = []
     let containerView = UIView()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    // MARK: - Configurator
    private func configure(configurator: PPBaseConfig = PCRHomeConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }
    
    deinit {
        //dealloc called
    }
    
    override func viewDidLoad() {
        setupViews()
        output?.getMobileDataConsumption()
    }

    
    func setupViews() {
        
        containerView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
    }
}

extension DataConsumptionViewController: DataConsumptionPresenterOutput {
    func displayDataConsumptionList(vm: [DataConsumptionCellVM]) {
        
    }
    
    func displayErrorMessage(message: String) {
    }
    
}
