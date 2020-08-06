//
//  DataConsumptionPresenter.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation

final class DataConsumptionPresenter {
    
    private(set) weak var output: DataConsumptionPresenterOutput?
    
    init(output: DataConsumptionPresenterOutput) {
        self.output = output
    }
}

extension DataConsumptionPresenter: DataConsumptionPresenterInput {
    
    func presentData(data: [[SPHDataResponse.Record]]) {
        output?.displayDataConsumptionList(vm: generateListVM(data: data))
    }
    
    func displayErrorMessage(message: String) {
        output?.displayErrorMessage(message: message)
    }
    
    func generateListVM(data: [[SPHDataResponse.Record]]) ->  [(title: String, vms: [DataConsumptionCellVM])]{
        var vmData: [(title: String, vms: [DataConsumptionCellVM])] = []
        
        data.forEach{ item in
            var cellVM: [DataConsumptionCellVM] = []
            var year = ""
          
            item.forEach{ singleData in
                let minimumVolume = item.map{ Float($0.volumeOfMobileData ?? "0")}.compactMap({$0}).min()
                let isDown = (minimumVolume ==  Float(singleData.volumeOfMobileData ?? "0")) ? true : false
                let vm: DataConsumptionCellVM = DataConsumptionCellVM(year: singleData.year,
                                                                      quater: singleData.quarterStr,
                                                                      isDecreaseVolume: isDown,
                                                                      dataUsage: singleData.volumeOfMobileData)
                cellVM.append(vm)
                let totalAmount = item.map({Float($0.volumeOfMobileData ?? "0") ?? 0}).reduce(0, +)
                year = "\(SPHL.year.localized) \(singleData.year) - \(totalAmount)"
            }
            vmData.append((year, cellVM))
        }
        return vmData
    }
}


