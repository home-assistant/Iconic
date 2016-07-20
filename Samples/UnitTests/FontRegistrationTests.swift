//
//  FontRegistrationTests.swift
//  UnitTests
//
//  Created by Ignacio Romero on 6/9/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import XCTest

private enum FontAwesomeIcon: IconFont {
    var name:String { return ""}
    var unicode:String {return ""}
    static var familyName: String { return "FontAwesome" }
    static var count: Int { return 0 }
}

class FontRegistrationTests: XCTestCase {
    
//    let kFontName: String = "FontAwesome"
//    let kFakeMap = ["",""]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        
        FontAwesomeIcon.unregister()
        
        super.tearDown()
    }
    
    func testRegisteringFontInBundle() {
        
        FontAwesomeIcon.register()
        
        let font = FontAwesomeIcon.iconFont(pointSize: 10)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font?.familyName, FontAwesomeIcon.familyName)
    }
    
    func testRegisteringFontAtPath() {
        //Note: not implemented, not clear about the use case...
        
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let path = bundle.pathForResource(kFontName, ofType: "otf")
//        
//        Iconic.registerFont(withPath: path!, map: kFakeMap)
//        
//        let font = Iconic.iconFont(ofSize: 10)
//        
//        XCTAssertNotNil(font)
//        XCTAssertEqual(font?.familyName, kFontName)
    }
    
    func testRegisteringEmptyMap() {
        
        FontAwesomeIcon.register()
        
        let font = FontAwesomeIcon.iconFont(pointSize: 10)
        
        XCTAssertNotNil(font)
       
    }
    
    // Fonts with zero point size would return a system font object.
    func testFontSizeZero() {
        
        FontAwesomeIcon.register()
        
        let font = FontAwesomeIcon.iconFont(pointSize: 0)
        
        XCTAssertNil(font)
    }
}
