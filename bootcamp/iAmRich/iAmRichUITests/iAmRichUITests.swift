//
//  iAmRichUITests.swift
//  iAmRichUITests
//
//  Created by andronick martusheff on 4/6/22.
//

import XCTest

class iAmRichUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        lazy var txtTitle = app.staticTexts["IAmRichTitleLabel"].firstMatch
        lazy var imgDiamond = app.images["IAmRichImage"].firstMatch
        
        XCTAssertTrue(txtTitle.exists)
        XCTAssertEqual(txtTitle.label, "I Am Rich")
        XCTAssertTrue(imgDiamond.exists)
        XCTAssertEqual(imgDiamond.label, "Diamond")
        
    }
}
