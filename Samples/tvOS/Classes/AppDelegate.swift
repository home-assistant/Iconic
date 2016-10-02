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
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }
}

