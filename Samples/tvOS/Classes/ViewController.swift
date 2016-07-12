//
//  ViewController.swift
//  tvOS
//
//  Created by Ignacio Romero on 6/14/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import UIKit
import Iconic

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    var scale:UInt = 10
    let maxScale:UInt = 50

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        upButton.setIcon(.AngleUp, size: 60, forState: .Normal)
        downButton.setIcon(.AngleDown, size: 60, forState: .Normal)
        
        updateImage(scale)
    }
    
    @IBAction func didPressUp(sender: UIButton) {
        
        if scale > maxScale {
            return
        }
        
        scale += 2
        updateImage(scale)
    }
    
    @IBAction func didPressDown(sender: UIButton) {
        
        if scale <= 2 {
            return
        }
        
        scale -= 2
        updateImage(scale)
    }
    
    func updateImage(scale: UInt) {
        
        let size = 20 * scale
        let image = Iconic.image(forIcon: .GithubAlt, size: CGFloat(size), color: .blackColor())
        
        imageView.image = image
        
        let transition = CATransition()
        transition.duration = 0.05
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        transition.type = kCATransitionFade
        
        imageView.layer.addAnimation(transition, forKey: nil)
    }
}

