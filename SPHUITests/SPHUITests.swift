//
//  SPHUITests.swift
//  SPHUITests
//
//  Created by Ahil Ahilendran on 6/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import XCTest
@testable import VIP_Clean_Architecture

class SPHUITests: XCTestCase {
    
    enum AccessIdentifier: String {
        case dataUsagetableView = "table--dataConsumptionTableView"
        case downButton = "button--downButton"
    }
    
    var app: XCUIApplication!
    static let timeOut = 20
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown()
    {
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func test_TableInteraction() {
        app.launch()
        let tableview = app.tables[AccessIdentifier.dataUsagetableView.rawValue]
        XCTAssertTrue(tableview.exists, "tableview not exists")
    }
    
    func test_ReloadButtonExists(){
        XCTAssertTrue(app.buttons[AccessIdentifier.downButton.rawValue].exists)
    }
    
    func test_tableviewCells() {
        let tableviewCell = app.tables.children(matching: .cell)
        XCTAssertEqual(tableviewCell.count, 10)
    }
    
    func test_tableviewCellLabels() {
        let collectionViewsQuery = app.tables
        for index in 0..<collectionViewsQuery.cells.count {
            let element = collectionViewsQuery.cells.element(boundBy: index)
            XCTAssertEqual(element.staticTexts.count, 2)
        }
    }
}

