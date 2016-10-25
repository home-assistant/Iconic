//
//  IconDrawableTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 6/9/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import XCTest
import Iconic

enum TestIcon : Int {
    case icon1
    case icon2
    case icon3
    case icon4
    case icon5
}

extension TestIcon : IconDrawable {
    
    static var count: Int { return 5 }
    
    static var familyName:String {
        return "FontAwesome"
    }
    
    init(named iconName: String) {
        switch iconName.lowercaseString {
        case "icon1": self = .icon1
        case "icon2": self = .icon2
        case "icon3": self = .icon3
        case "icon4": self = .icon4
        case "icon5": self = .icon5
        default: self = TestIcon(rawValue: 0)!
        }
    }
    
    var name: String {
        switch self {
        case .icon1: return "icon1"
        case .icon2: return "icon2"
        case .icon3: return "icon3"
        case .icon4: return "icon4"
        case .icon5: return "icon5"
        }
    }
    
    var unicode:String {
        switch self {
        case .icon1: return "\u{F129}"
        case .icon2: return "\u{F12D}"
        case .icon3: return "\u{F143}"
        case .icon4: return "\u{F14C}"
        case .icon5: return "\u{F152}"
        }
    }
}

class IconDrawableTests: XCTestCase {
    
    override func setUp() {
        
        super.setUp()
        
        FontAwesomeIcon.register()
    }
    
    override func tearDown() {
        
        FontAwesomeIcon.unregister()
        
        super.tearDown()
    }
    
    func testFundamentals() {
        
        let iconA = TestIcon(rawValue: 4)
        let iconB = TestIcon(named: "icon5")
        let iconC = TestIcon(named: "")
        
        XCTAssertNotNil(iconA?.name)
        XCTAssertNotNil(iconA?.unicode)
        XCTAssertNotNil(TestIcon.familyName)
        
        XCTAssertEqual(iconA, iconB)
        XCTAssertEqual(iconA?.name, "icon5")
        XCTAssertEqual(iconA?.unicode, "\u{F152}")
        
        XCTAssertNotEqual(iconC, iconA)
        XCTAssertEqual(iconC.rawValue, 0)
        
        XCTAssertEqual(TestIcon.count, 5)
    }
    
    func testUnicodeConstructor() {
        
        measureBlock() {
            let str = TestIcon.icon1.unicode
        
            XCTAssertNotNil(str)
            XCTAssertEqual(str, "\u{F129}")
        }
    }
    
    func testFontConstructor() {
        
        measureBlock() {
            let font = TestIcon.font(ofSize: 20)
        
            XCTAssertNotNil(font)
            XCTAssertEqual(font.familyName, TestIcon.familyName)
        }
    }
    
    func testFontSizeZero() {

        measureBlock() {
            // Fonts with zero point size, default to 10, to avoid returning a system font.
            let font = TestIcon.font(ofSize: 0)
        
            XCTAssertNotNil(font)
            XCTAssertEqual(font.pointSize, 10.0)
            XCTAssertEqual(font.familyName, TestIcon.familyName)
        }
    }
    
    func testAttributedStringConstructor() {
        
        measureBlock() {
            let string = TestIcon.icon1.attributedString(ofSize: 20, color: nil)
            let range = NSMakeRange(0, string.length)
        
            XCTAssertNotNil(string)
        
            string.enumerateAttribute(NSFontAttributeName, inRange: range, options: NSAttributedStringEnumerationOptions(rawValue: 0)) { (value, range, stop) -> Void in
                if let font = value as? UIFont {
                    XCTAssertEqual(font.familyName, TestIcon.familyName)
                }
            }
        }
    }
    
    func testImageConstructor() {

        measureBlock() {
            let size = CGSize(width: 20, height: 20)
        
            let image = TestIcon.icon1.image(ofSize: size, color: nil)
        
            XCTAssertNotNil(image)
            XCTAssertEqual(image.size, size)
        }
    }

    func testImageInsetsConstructor() {
        
        measureBlock() {
            let insets = UIEdgeInsetsMake(-5, -5, -5, -5)
            let size = CGSize(width: 20, height: 20)

            let image = TestIcon.icon1.image(ofSize: size, color: nil, edgeInsets: insets)
        
            XCTAssertNotNil(image)
            XCTAssertEqual(image.size, CGSize(width: 30, height: 30))
        }
    }
}
