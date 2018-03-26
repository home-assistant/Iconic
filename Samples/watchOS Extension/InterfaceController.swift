//
//  InterfaceController.swift
//  watchOS Extension
//
//  Created by Ignacio Romero on 11/2/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import WatchKit
import Foundation
import Iconic

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var imageView: WKInterfaceImage!
    @IBOutlet weak var upButtonImageView: WKInterfaceImage!
    @IBOutlet weak var downButtonImageView: WKInterfaceImage!
        
    var scale: UInt = 10
    let maxScale: UInt = 30
    let imageSize = CGSize(width: 88, height: 88)
    let buttonSize = CGSize(width: 30, height: 30)
    
    let githubIcon = FontAwesomeIcon.githubIcon
    let upArrowIcon = FontAwesomeIcon.angleUpIcon
    let downArrowIcon = FontAwesomeIcon.angleDownIcon

    private static let runOnce: Void = {
        // It is important to register the icon font as soon as possible,
        // and make the resources available right after launching the app.
        //
        // This example uses Awesome Font
        // http://fontawesome.io/cheatsheet/

        FontAwesomeIcon.register()
    }()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        updateImage(scale)
        
        let upArrowImage = upArrowIcon.image(ofSize: buttonSize, color: .white)
        upButtonImageView.setImage(upArrowImage)
        
        let downArrowImage = downArrowIcon.image(ofSize: buttonSize, color: .white)
        downButtonImageView.setImage(downArrowImage)
    }
    
    @IBAction func didPressUp() {
        
        if scale > maxScale {
            return
        }
        
        scale += 1
        updateImage(scale)
    }
    
    @IBAction func didPressDown() {
        
        if scale <= 2 {
            return
        }
        
        scale -= 1
        updateImage(scale)
    }
    
    func updateImage(_ scale: UInt) {
        
        let width = CGFloat(4 * scale)
        let imgSize = CGSize(width: width, height: width)
        let image = githubIcon.image(ofSize: imgSize, color: .white)
        
        imageView.setImage(image)
    }
}
