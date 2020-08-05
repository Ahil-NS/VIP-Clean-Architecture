//
//  DataConsumptionRouter.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//


import UIKit


final class DataConsumptionRouter {

    weak var viewController: DataConsumptionViewController?

    // MARK: - Initializers

    init(viewController: DataConsumptionViewController?) {
        self.viewController = viewController
    }
}

// MARK: - DataConsumptionRouterProtocol
extension DataConsumptionRouter: DataConsumptionRouterProtocol {
    // MARK: - Navigation
    
}

