//
//  UIExtensionSnapshotTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase

class UIExtensionSnapshotTests: BaseSnapshotTestCase {
    
    let size = CGSize(width: 40, height: 40)
    
    override func setUp() {
        super.setUp()
        
//        self.recordMode = false
    }
    
    func testUIBarButtonItem() {
        
        let buttonItem = UIBarButtonItem(withIcon: .Spinner, size: size, target: nil, action: #selector(tearDown))
        
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = buttonItem
        
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        navbar.setItems([navItem], animated: false)
        
        self.verifyView(navbar, withIdentifier: "")
    }
    
    func testUITabBarItem() {
        
        let tabItem = UITabBarItem(withIcon: .Sun, size: size, title: "tab")
        let tabbar = UITabBar(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        tabbar.items = [tabItem]
        
        self.verifyView(tabbar, withIdentifier: "")
    }
    
    func testUIButton() {
        
        let button = UIButton(type: .System)
        button.setIconImage(withIcon: .Download, size: size, color: nil, forState: .Normal)
        button.sizeToFit()
        
        self.verifyView(button, withIdentifier: "")
    }
}
