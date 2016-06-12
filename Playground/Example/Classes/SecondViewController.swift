//
//  SecondViewController.swift
//  Example
//
//  Created by Ignacio Romero on 5/22/16.
//  Copyright © 2016 DZN Labs All rights reserved.
//

import UIKit
import Iconic

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
        let tabItem = UITabBarItem(fontAwesomeIcon: .Picture, size:20, title: "As Image", tag: 1)
        
        self.title = tabItem.title;
        self.tabBarItem = tabItem;
        
        let buttonItem = UIBarButtonItem(fontAwesomeIcon: .Cog, size:24, target: self, action: NSSelectorFromString("didTapRightItem"))
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateImage(5.0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func didTapRightItem() {
        navigationController?.navigationBar.hidden = true
        tabBarController?.tabBar.hidden = true
    }
    
    @IBAction func didChangeScale(sender: UISlider) {
        print("did change scale to '\(sender.value)'")
        
        updateImage(sender.value)
    }
    
    func updateImage(scale: Float) {
        
        let size = ceil(20.0 * scale)
        let image = Iconic.imageForFontAwesomeIcon(.GithubAlt, size: CGFloat(size), color: .blackColor())
        
        imageView.image = image
    }
}

class StepSlider: UISlider {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(StepSlider.didTapSlider(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    func didTapSlider(gesture: UIGestureRecognizer) {
        
        let location = gesture.locationInView(gesture.view)
        
        let maxValue = CGFloat(self.maximumValue)
        let newValue = location.x * maxValue / CGRectGetWidth(self.frame)
        
        self.value = Float(newValue)
        
        self.sendActionsForControlEvents(.ValueChanged)
    }
}

