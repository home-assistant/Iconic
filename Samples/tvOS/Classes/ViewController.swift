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
    
    var scale = 10
    let maxScale = 50
    let buttonSize = CGSize(width: 60, height: 60)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        upButton.setIconImage(withIcon: .AngleUp, size: buttonSize, color: nil, forState: .Normal)
        downButton.setIconImage(withIcon: .AngleDown, size: buttonSize, color: nil, forState: .Normal)
        
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
        
        let width = CGFloat(20 * scale)
        let imgSize = CGSize(width: width, height: width)
        let image = FontAwesomeIcon.GithubAlt.image(ofSize: imgSize, color: .blackColor())
        
        imageView.image = image
        
        let transition = CATransition()
        transition.duration = 0.05
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        transition.type = kCATransitionFade
        
        imageView.layer.addAnimation(transition, forKey: nil)
    }
}
