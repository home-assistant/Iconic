//
//  UIExtensionTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase
import Iconic

class UIExtensionTests: BaseSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
//        self.recordMode = false
    }
    
    func testUIBarButtonItem() {
        
        let buttonItem = UIBarButtonItem(icon: .spinner, size: 40, target: nil, action: #selector(tearDown))
        
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = buttonItem
        
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        navbar.setItems([navItem], animated: false)
        
        self.verifyView(navbar, withIdentifier: "")
    }
    
    func testUITabBarItem() {
        
        let item = UITabBarItem(icon: .sun, size: 40, title: "tab", tag: 0)
        let tabbar = UITabBar(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        tabbar.items = [item]
        
        self.verifyView(tabbar, withIdentifier: "")
    }
    
    func testUIButton() {
        
        let button = UIButton(type: .system)
        button.setIcon(.download, size: 40, forState: .normal)
        button.sizeToFit()
        
        self.verifyView(button, withIdentifier: "")
    }
}
