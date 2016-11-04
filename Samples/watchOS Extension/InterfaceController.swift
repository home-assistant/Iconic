//
//  InterfaceController.swift
//  watchOS Extension
//
//  Created by Ignacio Romero on 11/2/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import WatchKit
import Foundation
import Iconic

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var imageView: WKInterfaceImage!
    
    override class func initialize() {
        
        // It is important to register the icon font as soon as possible,
        // and make the resources available right after launching the app.
        //
        // This example uses Awesome Font
        // http://fontawesome.io/cheatsheet/
        
        FontAwesomeIcon.register()
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let icon = FontAwesomeIcon.Github
        let image = icon.image(ofSize: CGSizeMake(88, 88), color: .whiteColor())
        
        imageView.setImage(image)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
