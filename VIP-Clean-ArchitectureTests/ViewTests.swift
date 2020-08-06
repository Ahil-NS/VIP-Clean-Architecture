//
//  ViewTests.swift
//  VIP-Clean-ArchitectureTests
//
//  Created by Ahil Ahilendran on 6/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import XCTest
@testable import VIP_Clean_Architecture

class ViewTests: XCTestCase {
    
    func test_DataConsumptionCell() {
        let cell = DataConsumptionCell()
        cell.cellVM = DataConsumptionCellVM(year: "11", quater: "Q1", isDecreaseVolume: false, dataUsage: "")
        XCTAssertEqual(cell.quaterLabel.numberOfLines, 0)
        XCTAssertEqual(cell.quaterLabel.text, "Q1")
        XCTAssertNotNil(cell)
    }
    
    func test_DataConsumptionCellNil() {
        let cell = DataConsumptionCell()
        cell.cellVM = DataConsumptionCellVM(year: "11", quater: "Q1", isDecreaseVolume: nil, dataUsage: "")
        cell.downButtonTapped()
        XCTAssertEqual(cell.quaterLabel.numberOfLines, 0)
        XCTAssertEqual(cell.quaterLabel.text, "Q1")
        XCTAssertNotNil(cell)
    }
    
    func test_DataConsumptionViewHeader() {
        let header = DataConsumptionViewHeader()
        XCTAssertNotNil(header)
    }
    
    func test_DataConsumptionViewHeaderVM() {
        let header = DataConsumptionViewHeader()
        header.vm = "Header"
        XCTAssertEqual(header.titleLabel.text, "Header")
    }
    
    func test_Constant() {
        let iconImage = SPHAssets.downIcon.value
        XCTAssertEqual(iconImage, "down-icon")
    }
    
    func test_PConfigurator() {
        let configurator = NSConfigurator.shared.self
        XCTAssertNotNil(configurator)
    }
    
    func test_Spacer() {
        let spacer = NSSpacer.addSpacer(withWidth: 30, withHeight: 30)
        XCTAssertNotNil(spacer)
    }
    
    func test_NSHorizontalSpacer() {
        let spacer = NSHorizontalSpacer.create(with: 40)
        XCTAssertNotNil(spacer)
    }
    
    func test_NSVerticalSpacerr() {
        let spacer = NSVerticalSpacer.create(with: 40)
        XCTAssertNotNil(spacer)
    }
    func test_NSHorizontal15Spacer() {
        let spacer = NSHorizontal15Spacer()
        XCTAssertNotNil(spacer)
    }
    
    func test_NSVertical15Spacer() {
        let spacer = NSVertical15Spacer()
        XCTAssertNotNil(spacer)
    }
    
    func test_NSStackView() {
        let view = NSStackView()
        XCTAssertNotNil(view)
    }
    
    func test_NSVerticalStackView() {
        let view = NSVerticalStackView()
        XCTAssertNotNil(view)
    }
    
    func test_NSHorizontalStackView() {
        let view = NSHorizontalStackView()
        XCTAssertNotNil(view)
    }
    
    func test_NSButton() {
        let view = NSButton()
        XCTAssertNotNil(view)
    }
    
    func test_NSView() {
        let view = NSView()
        XCTAssertNotNil(view)
    }
    
    func test_NSLabel() {
        let view = NSLabel()
        XCTAssertNotNil(view)
    }

}
