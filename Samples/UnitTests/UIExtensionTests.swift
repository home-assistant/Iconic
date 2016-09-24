//
//  UIExtensionTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 6/9/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import XCTest

class UIExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBarButtonItem() {
        
        let item = UIBarButtonItem(idx: 0, size: 20, target: nil, action: nil)
        
        XCTAssertNotNil(item)
        XCTAssertEqual(item.image?.size, CGSizeMake(20, 20))
    }
    
    func testTabBarItem() {
        
        let item = UITabBarItem(idx: 0, size:20, title: "", tag: 0)
        
        XCTAssertNotNil(item)
        XCTAssertEqual(item.image?.size, CGSizeMake(20, 20))
    }
    
    func testButton() {
        
        let button = UIButton(type: .System)
        button.setIcon(forIndex: 0, size: 20, forState: .Normal)
        
        let image = button.imageForState(.Normal)
        
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.size, CGSizeMake(20, 20))
    }
}
