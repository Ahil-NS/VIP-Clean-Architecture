//
//  DataConsumptionViewControllerTests.swift
//  VIP-Clean-ArchitectureTests
//
//  Created by Ahil Ahilendran on 6/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import XCTest
@testable import VIP_Clean_Architecture

class DataConsumptionViewControllerTests: XCTestCase {
    
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
    
    func test_001_sportshome_loaded() {
        loadView()
        XCTAssertNotNil(viewController, "View controller found nil")
        XCTAssertNotNil(viewController.tableView, "tableView contentView not found")
    }
    
    func test_002_reloadTableView() {
        viewController.reloadTableView()
        XCTAssertNotNil(viewController, "View controller found nil")
        XCTAssertNotNil(viewController.tableView, "tableView contentView not found")
    }
    
    func test_ConstrainWidth() {
        viewController.view.constrainWidth(to: viewController.tableView)
        XCTAssertNotNil( viewController.tableView.frame.width)
    }
}
