//
//  DataConsumptionProtocols.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation

protocol DataConsumptionPresenterInput {
    func displayErrorMessage(message: String)
    func presentData(data: SPHDataResponse.Result?)
}

protocol DataConsumptionPresenterOutput: AnyObject {
    func displayPlayList(vm: [DataConsumptionCellVM])
    func displayErrorMessage(message: String)
}

public protocol DataConsumptionApiProtocol: class {
    func didGetDataConsumption(response: SPHDataResponse.DataUsage?)
    func didFailedDataConsumption()
    
}

public protocol DataConsumptionApiWorkerProtocol {
    var apiDelegate: DataConsumptionApiProtocol? {get set}
    func getDataConsumption(offset: Int, resourceId: String, limit: Int)
}

protocol DataConsumptionInteractorInput {
    func getMobileDataConsumption()
}

protocol DataConsumptionRouterProtocol {
    var viewController: DataConsumptionViewController? { get }
}
