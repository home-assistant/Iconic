//
//  IconicFundamentalTests.swift
//  Playground
//
//  Created by Ignacio Romero on 6/9/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import XCTest

let IconMap = [
    "\u{F129}",
    "\u{F12D}",
    "\u{F143}",
    "\u{F14C}",
    "\u{F152}",
    "\u{F15E}",
    "\u{F164}",
    "\u{F165}",
    "\u{F186}",
    "\u{F18C}"
]

class FoundationTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
        Iconic.registerFont(withName: "FontAwesome", map: IconMap)
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUnicodeConstructor() {
        
        let str = Iconic.unicodeString(forIndex: 0)
        
        XCTAssertNotNil(str)
        XCTAssertEqual(str, "\u{F129}")
    }
    
    func testFontConstructor() {
        
        let font = Iconic.iconFont(ofSize: 20)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font!.familyName, "FontAwesome")
    }
    
    func testAttributedStringConstructor() {
        
        let att = Iconic.attributedString(forIndex: 0, size: 20, color: nil)
        
        XCTAssertNotNil(att)
        
        att!.enumerateAttribute(NSFontAttributeName, inRange: NSMakeRange(0, att!.length), options: NSAttributedStringEnumerationOptions(rawValue: 0)) { (value, range, stop) -> Void in
            if let font = value as? UIFont {
                XCTAssertEqual(font.familyName, "FontAwesome")
            }
        }
    }
    
    func testImageConstructor() {
        
        let img = Iconic.image(forIndex: 0, size: 20, color: nil)
        
        XCTAssertNotNil(img)
        XCTAssertEqual(img?.size, CGSizeMake(20, 20))
    }
    
    func testImageInsetsConstructor() {
        
        let insets = UIEdgeInsetsMake(-5, -5, -5, -5)
        let img = Iconic.image(forIndex: 0, size: 20, color: nil, edgeInsets: insets)
        
        XCTAssertNotNil(img)
        XCTAssertEqual(img?.size, CGSizeMake(30, 30))
    }
}
