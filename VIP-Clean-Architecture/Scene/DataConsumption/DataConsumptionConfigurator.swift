//
//  DataConsumptionConfigurator.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit
import UIKit

final class PCRHomeConfigurator: NSBaseConfig {
    
    // MARK: - Singleton
    static let sharedInstance: PCRHomeConfigurator = PCRHomeConfigurator()
    
    // MARK: - Configuration
    func configure(viewController: UIViewController)  {
        
        if let viewControllerUW = viewController as? DataConsumptionViewController {
            let router = DataConsumptionRouter(viewController: viewControllerUW)
            let presenter = DataConsumptionPresenter(output: viewControllerUW)
            let interactor = DataConsumptionInteractor(output: presenter)
            viewControllerUW.output = interactor
            viewControllerUW.router = router
        }
    }
}


