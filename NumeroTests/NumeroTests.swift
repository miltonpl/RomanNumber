//
//  NumeroTests.swift
//  NumeroTests
//
//  Created by Milton Palaguachi on 2/17/21.
//  Copyright © 2021 Facebook. All rights reserved.

@testable import Numero
import XCTest

class NumeroTests: XCTestCase {
    var converter: Converter?

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.converter = Converter()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.converter = nil
    }
    func testConversionForZero() throws {
        let result = self.converter?.convert(0)
        XCTAssertEqual(result, "", "Convert for 0 is correct")
    }

    func testConversionForOne() throws {
        let result = self.converter?.convert(1)
        XCTAssertEqual(result, "I", "Convert for 1 is correct")
    }
    
    func testConversionForTwo() throws {
        let result = self.converter?.convert(2)
        XCTAssertEqual(result, "II", "Convert for 2 is correct")
    }
    
    func testConversionForFive() throws {
        let result = self.converter?.convert(5)
        XCTAssertEqual(result, "V", "Convert for 5 is correct")
    }
    
    func testConversionForTen() throws {
        let result = self.converter?.convert(10)
        XCTAssertEqual(result, "X", "Convert for 10 is correct")
    }
    
    func testCovertionFor1To20() throws {
        let romanNumber = ["I", "II", "III", "IV", "V", "VI","VII", "VIII", "IX", "X","XI", "XII", "XIII", "XIV", "XV", "XVI","XVII", "XVIII", "XIX", "XX"]
        for (index,_) in romanNumber.enumerated() {
            let result = self.converter?.convert(index + 1)
            XCTAssertEqual(result, romanNumber[index], "Convert for \(index + 1) is correct")
        }
    }
    
    func testCovertionFor49() throws {
            let result = self.converter?.convert(49)
            XCTAssertEqual(result, "XLIX", "Convert for \(49) is correct")
    }
    
    func testCovertionFor50() throws {
            let result = self.converter?.convert(50)
            XCTAssertEqual(result, "L", "Convert for \(50) is correct")
    }
    
    func testCovertionFor55() throws {
            let result = self.converter?.convert(55)
            XCTAssertEqual(result, "LV", "Convert for \(50) is correct")
    }
    
    func testCovertionFor99() throws {
            let result = self.converter?.convert(99)
            XCTAssertEqual(result, "XCIX", "Convert for \(99) is correct")
    }
    
    func testCovertionFor100() throws {
            let result = self.converter?.convert(100)
            XCTAssertEqual(result, "C", "Convert for \(100) is correct")
    }
    
    func testCovertionFor2999() throws {
        let result = self.converter?.convert(2999)
            XCTAssertEqual(result, "MMCMXCIX", "Convert for \(100) is correct")
    }
    
    func testConverstionFor3999() {
        let result = self.converter?.convert(3999)
      XCTAssertEqual(result, "MMMCMXCIX", "Conversion for 3999 is incorrect")
    }
}
