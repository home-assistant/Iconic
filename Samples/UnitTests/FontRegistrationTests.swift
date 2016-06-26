//
//  FontRegistrationTests.swift
//  UnitTests
//
//  Created by Ignacio Romero on 6/9/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import XCTest

class FontRegistrationTests: XCTestCase {
    
    let kFontName: String = "FontAwesome"
    let kFakeMap = ["",""]
    
    override func setUp() {
        
        super.setUp()
    }
    
    override func tearDown() {
        
        Iconic.unregisterAllFonts()
        
        super.tearDown()
    }
    
    func testRegisteringFontInBundle() {
        
        Iconic.registerFont(kFontName, map: kFakeMap)
        
        let font = Iconic.iconFontOfSize(10)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font?.familyName, kFontName)
    }
    
    func testRegisteringFontAtPath() {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource(kFontName, ofType: "otf")
        
        Iconic.registerFontWithPath(path!, map: kFakeMap)
        
        let font = Iconic.iconFontOfSize(10)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font?.familyName, kFontName)
        
        let zeroFont = Iconic.iconFontOfSize(0)
        
        XCTAssertNil(zeroFont)
    }
    
    func testRegisteringEmptyMap() {
        
        let emptyMap = Array<String>()
        
        Iconic.registerFont(kFontName, map: emptyMap)
        
        let font = Iconic.iconFontOfSize(10)
        
        XCTAssertNil(font)
    }
    
    func testRegisteringMultipleFonts() {
        
        Iconic.registerFont("MaterialIcons-Regular", map: kFakeMap)
        Iconic.registerFont("open-iconic", map: kFakeMap)
        Iconic.registerFont("FontAwesome", map: kFakeMap)

        XCTAssertEqual(Iconic.icons.count, 3)
    }
}
