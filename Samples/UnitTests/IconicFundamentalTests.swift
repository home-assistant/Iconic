//
//  IconicFundamentalTests.swift
//  Playground
//
//  Created by Ignacio Romero on 6/9/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import XCTest

private enum FontAwesomeIcon: IconFont {
    case a, b, c, d, e
    
    var name:String {
        switch self {
        case .a: return "icon-a"
        case .b: return "icon-b"
        case .c: return "icon-c"
        case .d: return "icon-d"
        case .e: return "icon-e"
        }
    }
    var unicode:String {
        switch self {
        case .a: return "\u{F129}"
        case .b: return "\u{F12D}"
        case .c: return "\u{F143}"
        case .d: return "\u{F14C}"
        case .e: return "\u{F152}"
        }
    }
    static var familyName: String { return "FontAwesome" }
    static var count: Int { return 5 }
}

class IconicFundamentalTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
        FontAwesomeIcon.register()
    }
    override class func tearDown() {
        super.tearDown()
        
        FontAwesomeIcon.unregister()
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUnicodeConstructor() {
        
        let str = FontAwesomeIcon.a.unicode
        XCTAssertNotNil(str)
        XCTAssertEqual(str, "\u{F129}")
    }
    
    func testFontConstructor() {
        
        let font = FontAwesomeIcon.iconFont(pointSize: 20)
        
        XCTAssertNotNil(font)
        XCTAssertEqual(font!.familyName, "FontAwesome")
    }
    
    func testAttributedStringConstructor() {
        
        let att = FontAwesomeIcon.a.attributedString(pointSize: 20, color: nil)
        
        XCTAssertNotNil(att)
        
        att.enumerateAttribute(NSFontAttributeName, inRange: NSMakeRange(0, att.length), options: NSAttributedStringEnumerationOptions(rawValue: 0)) { (value, range, stop) -> Void in
            if let font = value as? UIFont {
                XCTAssertEqual(font.familyName, "FontAwesome")
            }
        }
    }
    
    func testImageConstructor() {
        
        let img = FontAwesomeIcon.a.image(size: CGSizeMake(20, 30), color: nil)
        
        XCTAssertNotNil(img)
        XCTAssertEqual(img.size, CGSizeMake(20, 30))
    }
    
    func testImageInsetsConstructor() {
        
        let insets = UIEdgeInsetsMake(-5, -5, -5, -5)
        let img = FontAwesomeIcon.a.image(size: CGSize(width: 30, height: 50), color: nil, edgeInsets: insets)
        
        XCTAssertNotNil(img)
        XCTAssertEqual(img.size, CGSizeMake(40, 60))
    }
}
