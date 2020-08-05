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
    
    func testDataConsumptionCell() {
        let cell = DataConsumptionCell()
        cell.cellVM = DataConsumptionCellVM(year: "11", quater: "Q1", isDecreaseVolume: false, dataUsage: "")
        
        XCTAssertEqual(cell.quaterLabel.numberOfLines, 0)
        XCTAssertEqual(cell.quaterLabel.text, "Q1")
        XCTAssertNotNil(cell)
    }
    
    func testDataConsumptionCellNil() {
        let cell = DataConsumptionCell()
        cell.cellVM = DataConsumptionCellVM(year: "11", quater: "Q1", isDecreaseVolume: nil, dataUsage: "")
        cell.downButtonTapped()
        XCTAssertEqual(cell.quaterLabel.numberOfLines, 0)
        XCTAssertEqual(cell.quaterLabel.text, "Q1")
        XCTAssertNotNil(cell)
    }
    
    func testDataConsumptionViewHeader() {
        let header = DataConsumptionViewHeader()
        XCTAssertNotNil(header)
    }
    
    func testDataConsumptionViewHeaderVM() {
        let header = DataConsumptionViewHeader()
        header.vm = "Header"
        XCTAssertEqual(header.titleLabel.text, "Header")
    }
    
    func testConstant() {
        let iconImage = SPHConstants.AssetString.downIcon.value
        XCTAssertEqual(iconImage, "down-icon")
    }
    
    func testPConfigurator() {
        let configurator = NSConfigurator.shared.self
        XCTAssertNotNil(configurator)
    }
    
    func testSpacer() {
        let spacer = NSSpacer.addSpacer(withWidth: 30, withHeight: 30)
        XCTAssertNotNil(spacer)
    }
    
    func testNSHorizontalSpacer() {
        let spacer = NSHorizontalSpacer.create(with: 40)
        XCTAssertNotNil(spacer)
    }
    
    
    func testNSVerticalSpacerr() {
        let spacer = NSVerticalSpacer.create(with: 40)
        XCTAssertNotNil(spacer)
    }
    func testNSHorizontal15Spacer() {
        let spacer = NSHorizontal15Spacer()
        XCTAssertNotNil(spacer)
    }
    
    func testNSVertical15Spacer() {
        let spacer = NSVertical15Spacer()
        XCTAssertNotNil(spacer)
    }
    
    func testNSStackView() {
        let view = NSStackView()
        XCTAssertNotNil(view)
    }
    
    func testNSVerticalStackView() {
        let view = NSVerticalStackView()
        XCTAssertNotNil(view)
    }
    
    func testNSHorizontalStackView() {
        let view = NSHorizontalStackView()
        XCTAssertNotNil(view)
    }
    
    
    func testNSButton() {
        let view = NSButton()
        XCTAssertNotNil(view)
    }
    
    func testNSView() {
        let view = NSView()
        XCTAssertNotNil(view)
    }
    
    
    func testNSLabel() {
        let view = NSLabel()
        XCTAssertNotNil(view)
    }
    
    
}
