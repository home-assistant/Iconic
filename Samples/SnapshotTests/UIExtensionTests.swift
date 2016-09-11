//
//  UIExtensionTests.swift
//  Samples
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase
import Iconic

class UIExtensionTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        self.recordMode = false
    }
    
    func testUIBarButtonItem() {
        
        let buttonItem = UIBarButtonItem(icon: .Spinner, size: 40, target: nil, action: nil)
        
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = buttonItem
        
        let navbar = UINavigationBar(frame: CGRectMake(0, 0, 44, 44))
        
        navbar.setItems([navItem], animated: false)
        
        self.verifyView(navbar, withIdentifier: "")
    }
    
    func testUITabBarItem() {
        
        let item = UITabBarItem(icon: .Sun, size: 40, title: "tab", tag: 0)
        let tabbar = UITabBar(frame: CGRectMake(0, 0, 80, 80))
        
        tabbar.items = [item]
        
        self.verifyView(tabbar, withIdentifier: "")
    }
    
    func testUIButton() {
        
        let button = UIButton(type: .System)
        button.setIcon(.Download, size: 40, forState: .Normal)
        button.sizeToFit()
        
        self.verifyView(button, withIdentifier: "")
    }
}
