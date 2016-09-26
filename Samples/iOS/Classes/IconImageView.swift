//
//  IconImageView.swift
//  Samples
//
//  Created by Ignacio Romero on 7/28/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import UIKit
import Iconic

@IBDesignable
class IconImageView: UIImageView {
    
    // MARK: - Public & Inspectable variables
    
    @available(*, unavailable, message : "This property is reserved for Interface Builder. Use 'icon' instead.")
    @IBInspectable dynamic var iconName: String? {
        willSet {
            icon = FontAwesomeIcon(named: newValue ?? "")
        }
    }
    
    @available(*, unavailable, message : "This property is reserved for Interface Builder. Use 'tintColor' instead.")
    @IBInspectable dynamic var iconColor: UIColor! {
        willSet {
            tintColor = newValue ?? UIColor.black
        }
    }
    
    var icon: FontAwesomeIcon? {
        didSet {
            updateIconImage()
        }
    }
    
    fileprivate func commonInit() {
        self.backgroundColor = UIColor.clear
    }
    
    // MARK: - Overrides
    
    init(icon: FontAwesomeIcon) {
        super.init(image: nil)
        commonInit()
        self.icon = icon
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var image: UIImage? {
        get { return nil }
        set {}
    }
    
    override var tintColor: UIColor! {
        didSet {
            updateIconImage()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateIconImage()
    }
    
    @available(*, unavailable, message : "Reserved for when designable objects are created in Interface Builder.")
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        // The icon font needs to be registered first
        FontAwesomeIcon.register()
    }
    
    // MARK: - Constructor
    
    func updateIconImage() {
        
        // no need to update if the sizing is empty or too small
        if frame.isEmpty ||
            frame.isNull ||
            frame.width < 5 {
            return
        }

        if icon == nil {
            super.image = nil
        }
        else {
            let image = icon?.image(ofSize: frame.size, color: tintColor)
            super.image = image
        }
    }
}