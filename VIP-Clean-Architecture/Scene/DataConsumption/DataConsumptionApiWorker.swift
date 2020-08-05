//
//  DataConsumptionApiWorker.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation
import Moya


public class DataConsumptionApiWorker: DataConsumptionApiWorkerProtocol {
    
    public weak var apiDelegate: DataConsumptionApiProtocol?
    let provider = MoyaProvider<DataUsageService>()
    public init() {}
    
    public func getDataConsumption(offset: Int, resourceId: String, limit: Int) {
        
        provider.request(.getDataUsage(offset: offset, limit: limit, resourceId: resourceId)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                do {
                    let dataUsage  = try? JSONDecoder().decode(SPHDataResponse.DataUsage.self, from: response.data)
                    self.apiDelegate?.didGetDataConsumption(response: dataUsage)
                }
            case .failure:
                self.apiDelegate?.didFailedDataConsumption()
                break
            }
        }
    }
}
