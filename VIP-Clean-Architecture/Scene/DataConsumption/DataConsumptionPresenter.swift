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
    func presentData(data: SPHDataResponse.Result?) {
        var cellVM: [DataConsumptionCellVM] = []
        
        //TODO isDecreaseVolume
        data?.records?.forEach{ item in
            let vm = DataConsumptionCellVM(year: item.year, quater: item.quarterStr, isDecreaseVolume: false)
            cellVM.append(vm)
        }
        output?.displayPlayList(vm: cellVM)
    }
    
    func displayErrorMessage(message: String) {
        output?.displayErrorMessage(message: message)
    }
}

