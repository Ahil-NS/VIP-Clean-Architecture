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
        //TODO isDecreaseVolume
        var vmData: [(title: String, vms: [DataConsumptionCellVM])] = []
        
        data.forEach{ item in
            var cellVM: [DataConsumptionCellVM] = []
            var year = ""
            item.forEach{ singleData in
                let vm: DataConsumptionCellVM = DataConsumptionCellVM(year: singleData.year,
                                                                      quater: singleData.quarterStr,
                                                                      isDecreaseVolume: false,
                                                                      dataUsage: singleData.volumeOfMobileData)
                cellVM.append(vm)
                year = singleData.year
            }
            vmData.append((year, cellVM))
        }
        return vmData
    }
}


