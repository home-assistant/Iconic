//
//  AppDelegate.swift
//  tvOS
//
//  Created by Ignacio Romero on 6/14/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import UIKit
import Iconic

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    override init() {
        super.init()
        
        // This example uses Awesome Font
        // http://fontawesome.io/cheatsheet/
        //
        // It is important to register the icon font when initializing the app delegate
        // Specially when using IB Storyboard, since the layout needs the resources available asap.
        
        FontAwesomeIcon.register()
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

