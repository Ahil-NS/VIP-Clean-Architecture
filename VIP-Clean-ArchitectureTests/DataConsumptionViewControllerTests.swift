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
    
    func test_DataHasTableViewCorrectRows() {
        let cellVM = [DataConsumptionCellVM(year: "", quater: "", isDecreaseVolume: false, dataUsage: "")]
        let mainVM: [(title: String, vms: [DataConsumptionCellVM])] = [(("title", cellVM))]
        viewController.vmMain = mainVM
        loadView()
        let numberOfRows = viewController.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 1, "number of rows in table should match ")
    }
    
    func testTableViewHasCells() {
        let _ = viewController.view
        let cell = viewController.tableView.dequeueReusableCell(withIdentifier: DataConsumptionCell.reuseIdentifier)
        
        XCTAssertNotNil(cell,"dequeueReusableCell cell not found'")
    }
    
    func testHeaderView() {
        let _ = viewController.view
        let headerView = viewController.tableView.dequeueReusableHeaderFooterView(withIdentifier: DataConsumptionViewHeader.reuseIdentifier)
        
        XCTAssertNotNil(headerView,"headerView not found'")
    }
    
    func test_ViewFound() {
        loadView()
        XCTAssertNotNil(viewController, "View controller found nil")
        XCTAssertNotNil(viewController.tableView, "tableView contentView not found")
    }
    
    func test_ReloadTableView() {
        viewController.reloadTableView()
        XCTAssertNotNil(viewController, "View controller found nil")
        XCTAssertNotNil(viewController.tableView, "tableView contentView not found")
    }
    
    func test_ConstrainWidth() {
        viewController.view.constrainWidth(to: viewController.tableView)
        XCTAssertNotNil( viewController.tableView.frame.width)
    }
    
    func test_TableViewRowHeight() {
        let expectedHeight: CGFloat = UITableView.automaticDimension
        let actualHeight = viewController?.tableView.rowHeight
        XCTAssertEqual(expectedHeight, actualHeight, "Cell hights not equal")
    }
}
