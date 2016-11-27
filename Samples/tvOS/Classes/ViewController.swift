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
    let buttonSize:CGSize = CGSize(width: 60, height: 60)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        upButton.setIconImage(withIcon: .angleUp, size: buttonSize, color: nil, forState: .normal)
        downButton.setIconImage(withIcon: .angleDown, size: buttonSize, color: nil, forState: .normal)
        
        updateImage(scale)
    }
    
    @IBAction func didPress(up sender: UIButton) {
        
        if scale > maxScale {
            return
        }
        
        scale += 2
        updateImage(scale)
    }
    
    @IBAction func didPress(down sender: UIButton) {
        
        if scale <= 2 {
            return
        }
        
        scale -= 2
        updateImage(scale)
    }
    
    func updateImage(_ scale: UInt) {
        
        let width = CGFloat(20 * scale)
        let imgSize = CGSize(width: width, height: width)
        let image = FontAwesomeIcon.githubAlt.image(ofSize: imgSize, color: .black)
        
        imageView.image = image
        
        let transition = CATransition()
        transition.duration = 0.05
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        transition.type = kCATransitionFade
        
        imageView.layer.add(transition, forKey: nil)
    }
}

