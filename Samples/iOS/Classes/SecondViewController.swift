//
//  SecondViewController.swift
//  Example
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic

import UIKit
import Iconic

class SecondViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scaleSlider: UISlider!
    @IBOutlet weak var colorSlider: UISlider!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() -> Void {

        let tabItem = UITabBarItem(withIcon: .pictureIcon, size: CGSize(width: 20, height: 20), title: "As Image")

        self.title = tabItem.title
        self.tabBarItem = tabItem

        let buttonItem = UIBarButtonItem(withIcon: .cogIcon, size: CGSize(width: 24, height: 24), target: self, action: #selector(didTapRightItem))
        self.navigationItem.rightBarButtonItem = buttonItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateTitleView()

        updateIconScale(150)
        updateIconColor(150)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @objc func didTapRightItem() {
        // Do something
    }

    @IBAction func didChangeScale(_ sender: UISlider) {
        print("did change scale to '\(sender.value)'")

        if sender == scaleSlider {
            updateIconScale(sender.value)
        }
        if sender == colorSlider {
            updateIconColor(sender.value)
        }
    }

    func updateIconScale(_ scale: Float) {

        let size = CGFloat(ceil(scale))

        iconWidthConstraint.constant = size
        iconHeightConstraint.constant = size
    }

    func updateIconColor(_ scale: Float) {

        let hue = CGFloat(ceil(scale))
        let color = UIColor(hue: hue/255, saturation: 0.9, brightness: 0.9, alpha: 1.0)

        iconImageView.tintColor = color
    }
}

class StepSlider: UISlider {

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(StepSlider.didTapSlider(_:)))
        self.addGestureRecognizer(tapGesture)
    }

    @objc func didTapSlider(_ gesture: UIGestureRecognizer) {

        let location = gesture.location(in: gesture.view)

        let maxValue = CGFloat(self.maximumValue)
        let newValue = location.x * maxValue / self.frame.width

        self.value = Float(newValue)

        self.sendActions(for: .valueChanged)
    }
}
