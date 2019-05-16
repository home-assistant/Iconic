//
//  AppDelegate.swift
//  Example
//
//  Created by Ignacio Romero on 5/22/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import UIKit
import Iconic

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    override init() {
        super.init()
        
        // It is important to register the icon font as soon as possible,
        // and make the resources available right after launching the app.
        //
        // This example uses Awesome Font
        // http://fontawesome.io/cheatsheet/
        
        FontAwesomeIcon.register()
    }

    private func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}
