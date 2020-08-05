//
//  DataConsumptionInteractor.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation
import Alamofire

final class DataConsumptionInteractor {
    
    let output: DataConsumptionPresenterInput
    let apiWorker: DataConsumptionApiWorker = DataConsumptionApiWorker()
    
    // MARK: - Initializers
    init(output: DataConsumptionPresenterInput) {
        self.output = output
        apiWorker.apiDelegate = self
    }
}

extension DataConsumptionInteractor: DataConsumptionInteractorInput {
    func getMobileDataConsumption() {
        apiWorker.getDataConsumption(offset: 10, resourceId: "a807b7ab-6cad-4aa6-87d0-e283a7353a0f", limit: 10)
    }
}

extension  DataConsumptionInteractor: DataConsumptionApiProtocol {
    func didGetDataConsumption(response: SPHDataResponse.DataUsage?) {
        self.output.presentData(data: response?.result)
    }
    
    func didFailedDataConsumption() {
        self.output.displayErrorMessage(message: "")
    }
}
