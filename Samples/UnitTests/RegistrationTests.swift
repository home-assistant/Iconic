//
//  FontRegistrationTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 6/9/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import XCTest

private let fontName: String = "FontAwesome"
private let emptyMap = ["",""]

class RegistrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        
        Iconic.unregisterFont()
        
        super.tearDown()
    }
    
    func testRegisteringFontInBundle() {
        
        Iconic.registerFont(withName: fontName, map: emptyMap)
        
        let font = Iconic.iconFont(ofSize: 10)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font?.familyName, fontName)
    }
    
    func testRegisteringFontAtPath() {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource(fontName, ofType: "otf")
        
        Iconic.registerFont(withPath: path!, map: emptyMap)
        
        let font = Iconic.iconFont(ofSize: 10)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font?.familyName, fontName)
    }
    
    func testRegisteringEmptyMap() {
        
        let emptyMap = Array<String>()
        
        Iconic.registerFont(withPath: fontName, map: emptyMap)
        
        let font = Iconic.iconFont(ofSize: 10)
        
        XCTAssertNil(font)
    }
    
    // Fonts with zero point size would return a system font object.
    func testFontSizeZero() {
        
        Iconic.registerFont(withName: fontName, map: emptyMap)
        
        let font = Iconic.iconFont(ofSize: 0)
        
        XCTAssertNil(font)
    }
}
