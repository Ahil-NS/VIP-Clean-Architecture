//
//  DataConsumptionPresenterTests.swift
//  VIP-Clean-ArchitectureTests
//
//  Created by Ahil Ahilendran on 6/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import XCTest
import Moya
@testable import VIP_Clean_Architecture

class DataConsumptionPresenterTests: XCTestCase {
    
    var viewController: DataConsumptionViewController!
    var window: UIWindow!
    
    // MARK: - Test setup
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    func loadView()
    {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    func setupViewController()
    {
        viewController = DataConsumptionViewController()
        let presenter = DataConsumptionPresenter(output: viewController)
        let interactor = DataConsumptionInteractor(output: presenter)
        viewController.output = interactor
    }
    
    func test_PresentData() {
        let interactor = DataConsumptionInteractorMock()
        let presenter = DataConsumptionPresenter(output: viewController)
        viewController.output = interactor
        let record : [[SPHDataResponse.Record]] = [[SPHDataResponse.Record(volumeOfMobileData: "123", quarter: "23", id: 33)]]
        presenter.presentData(data: record)
        XCTAssertEqual(viewController.vmMain.count, 1)
    }
    
    func test_DisplayErrorMessage() {
        let interactor = DataConsumptionInteractorMock()
        let presenter = DataConsumptionPresenter(output: viewController)
        viewController.output = interactor
        presenter.displayErrorMessage(message: "")
        XCTAssertEqual(viewController.vmMain.count, 0)
    }
    
    func test_GenerateListVM() {
        let interactor = DataConsumptionInteractorMock()
        let presenter = DataConsumptionPresenter(output: viewController)
        viewController.output = interactor
        let record : [[SPHDataResponse.Record]] = [[SPHDataResponse.Record(volumeOfMobileData: "123.123", quarter: "2019", id: 33)]]
        
        let generatedVM = presenter.generateListVM(data: record)
        XCTAssertEqual(generatedVM[0].title, "Year: 2019 - 123.123")
    }
    
    func test_generateListVMNil() {
        let interactor = DataConsumptionInteractorMock()
        let presenter = DataConsumptionPresenter(output: viewController)
        viewController.output = interactor
        let record : [[SPHDataResponse.Record]] = [[SPHDataResponse.Record(volumeOfMobileData: nil, quarter: "2019", id: 33)]]
        let generatedVM = presenter.generateListVM(data: record)
        XCTAssertEqual(generatedVM[0].title, "Year: 2019 - 0.0")
    }
    
  
    
    func test_getMobileDataConsumption_calledLoadView() {
        // Given
        let interactor = DataConsumptionInteractorMock()
        viewController.output = interactor
        viewController.output?.getMobileDataConsumption()
        loadView()
        XCTAssertEqual(interactor.isGetMobileDataConsumptionCalled, true, "GetMobileDataConsumptionCalled not called")
    }
    
    func test_getMobileDataConsumption_called() {
        // Given
        let interactor = DataConsumptionInteractorMock()
        viewController.output = interactor
        viewController.output?.getMobileDataConsumption()
        XCTAssertEqual(interactor.isGetMobileDataConsumptionCalled, true, "GetMobileDataConsumptionCalled not called")
    }
    
  
    
    func test_DataParsing() {
        let sampleResponse = """
    {"help": "https://data.gov.sg/api/3/action/help_show?name=datastore_search", "success": true, "result": {"resource_id": "a807b7ab-6cad-4aa6-87d0-e283a7353a0f", "fields": [{"type": "int4", "id": "_id"}, {"type": "text", "id": "quarter"}, {"type": "numeric", "id": "volume_of_mobile_data"}], "records": [{"volume_of_mobile_data": "0.000384", "quarter": "2004-Q3", "_id": 1}], "_links": {"start": "/api/action/datastore_search?limit=1&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f", "next": "/api/action/datastore_search?offset=1&limit=1&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f"}, "offset": 1, "limit": 1, "total": 59}}
    """
        let jsonData = sampleResponse.data(using: .utf8)
        
        XCTAssertNotNil(jsonData)
        
        let model = try! JSONDecoder().decode(SPHDataResponse.DataUsage.self, from: jsonData!)
        
        XCTAssertNotNil(model)
        XCTAssertNotNil(model.result?.records)
        XCTAssertEqual(model.result?.records?.count, 1)
        XCTAssertEqual(model.result?.offset, 1)
        XCTAssertEqual(model.result?.limit, 1)
        XCTAssertEqual(model.result?.total, 59)
    }
    
}

class DataConsumptionPresenterMock : DataConsumptionPresenterInput  {
    
    var isPresentDataCalled = false
    var isDisplayErrorMessageCalled = false
    
    func displayErrorMessage(message: String) {
        isDisplayErrorMessageCalled = true
    }
    
    func presentData(data: [[SPHDataResponse.Record]]) {
        isPresentDataCalled = true
    }
}

class DataConsumptionInteractorMock: DataConsumptionInteractorInput {
    
    var isGetMobileDataConsumptionCalled = false
    
    func getMobileDataConsumption() {
        isGetMobileDataConsumptionCalled = true
    }
}
