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
        
        Iconic.unregisterFont()
        
        super.tearDown()
    }
    
    func testRegisteringFontInBundle() {
        
        Iconic.registerFont(withName: kFontName, map: kFakeMap)
        
        let font = Iconic.iconFont(ofSize: 10)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font?.familyName, kFontName)
    }
    
    func testRegisteringFontAtPath() {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource(kFontName, ofType: "otf")
        
        Iconic.registerFont(withPath: path!, map: kFakeMap)
        
        let font = Iconic.iconFont(ofSize: 10)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font?.familyName, kFontName)
    }
    
    func testRegisteringEmptyMap() {
        
        let emptyMap = Array<String>()
        
        Iconic.registerFont(withPath: kFontName, map: emptyMap)
        
        let font = Iconic.iconFont(ofSize: 10)
        
        XCTAssertNil(font)
    }
    
    // Fonts with zero point size would return a system font object.
    func testFontSizeZero() {
        
        Iconic.registerFont(withName: kFontName, map: kFakeMap)
        
        let font = Iconic.iconFont(ofSize: 0)
        
        XCTAssertNil(font)
    }
}
