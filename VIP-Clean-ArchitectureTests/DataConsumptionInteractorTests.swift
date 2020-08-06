//
//  DataConsumptionInteractorTests.swift
//  VIP-Clean-ArchitectureTests
//
//  Created by Ahil Ahilendran on 6/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import XCTest
@testable import VIP_Clean_Architecture

class DataConsumptionInteractorTests: XCTestCase {
    
    func testDidFailedDataConsumption() {
        // Given
        let presenter = DataConsumptionPresenterMock()
        let interactor = DataConsumptionInteractor(output: presenter)
        interactor.didFailedDataConsumption()
        XCTAssertEqual(interactor.isFetchInProgress, false, "")
    }
    
    func testGetMobileDataConsumption() {
        // Given
        let presenter = DataConsumptionPresenterMock()
        let interactor = DataConsumptionInteractor(output: presenter)
        interactor.getMobileDataConsumption()
        XCTAssertEqual(interactor.isFetchInProgress, true, "")
    }
    
    func testDidGetDataConsumption() {
         // Given
         let presenter = DataConsumptionPresenterMock()
         let interactor = DataConsumptionInteractor(output: presenter)
        let mockData: SPHDataResponse.DataUsage? = MockApiClient().mockResponse()
         interactor.didGetDataConsumption(response: mockData)
         XCTAssertEqual(interactor.limit, 30)
         XCTAssertEqual(interactor.offset, 40)
         XCTAssertEqual(interactor.isFetchInProgress, false, "")
     }
}
