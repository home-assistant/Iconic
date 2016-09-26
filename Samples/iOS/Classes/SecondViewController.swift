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
    
    @IBOutlet weak var iconImageView: IconImageView!
    @IBOutlet weak var iconWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var slider: UISlider!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
        
        let tabItem = UITabBarItem(withFontAwesomeIcon: .Picture, size: CGSize(width: 20, height: 20), title: "As Image")
        
        self.title = tabItem.title;
        self.tabBarItem = tabItem;
        
        let buttonItem = UIBarButtonItem(withFontAwesomeIcon: .Cog, size: CGSize(width: 24, height: 24), target: self, action: #selector(didTapRightItem))
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTitleView()
        updateIcon(200)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func didTapRightItem() {
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func didChangeScale(_ sender: UISlider) {
        print("did change scale to '\(sender.value)'")
        
        updateIcon(sender.value)
    }
    
    func updateIcon(_ scale: Float) {
        
        let size = CGFloat(ceil(scale))
        
        // TODO: Need to figure out a better way to update both axis with 1 single constraint.
        // Maybe with aspect ratio 1:1 ?
        iconWidthConstraint.constant = size
        iconHeightConstraint.constant = size
    }
}

class StepSlider: UISlider {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(StepSlider.didTapSlider(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    func didTapSlider(_ gesture: UIGestureRecognizer) {
        
        let location = gesture.location(in: gesture.view)
        
        let maxValue = CGFloat(self.maximumValue)
        let newValue = location.x * maxValue / self.frame.width
        
        self.value = Float(newValue)
        
        self.sendActions(for: .valueChanged)
    }
}

