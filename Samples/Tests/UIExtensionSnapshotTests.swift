//
//  UIExtensionSnapshotTests.swift
//  Iconic
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
//

class UIExtensionSnapshotTests: BaseSnapshotTestCase {

    let defaultSize = CGSize(width: 40, height: 40)

    override func setUp() {
        super.setUp()

        // Toggle on for recording a new snapshot. Remember to turn it back off to validate the test.
        self.recordMode = false
    }

    func testUIBarButtonItem() {

        let buttonItem = UIBarButtonItem(withIcon: .spinnerIcon, size: defaultSize, target: nil, action: #selector(tearDown))
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = buttonItem

        navbar.setItems([navItem], animated: false)

        self.verifyView(navbar, withIdentifier: "")
    }

    func testUITabBarItem() {

        let tabItem = UITabBarItem(withIcon: .sunIcon, size: defaultSize, title: "tab")
        let tabbar = UITabBar(frame: CGRect(x: 0, y: 0, width: 80, height: 80))

        tabbar.items = [tabItem]

        self.verifyView(tabbar, withIdentifier: "")
    }

    func testUIButton() {

        let button = UIButton(type: .system)
        button.setIconImage(withIcon: .downloadIcon, size: defaultSize, color: nil, forState: UIControlState())
        button.sizeToFit()

        self.verifyView(button, withIdentifier: "")
    }
}
