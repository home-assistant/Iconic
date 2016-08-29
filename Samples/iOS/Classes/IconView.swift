//
//  IconView.swift
//  Samples
//
//  Created by Ignacio Romero on 7/28/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import UIKit
import Iconic

@IBDesignable
class IconView: UIImageView {
    
    // MARK: - Public & Inspectable variables
    
    @available(*, unavailable, message = "This property is reserved for Interface Builder. Use 'icon' instead.")
    @IBInspectable dynamic var iconName: String? {
        willSet {
            icon = Icon(named: newValue ?? "")
        }
    }
    
    @available(*, unavailable, message = "This property is reserved for Interface Builder. Use 'tintColor' instead.")
    @IBInspectable dynamic var iconColor: UIColor! {
        willSet {
            tintColor = newValue ?? .blackColor()
        }
    }
    
    var icon: Icon? {
        didSet {
            updateIconImage()
        }
    }
    
    private func commonInit() {
        self.backgroundColor = .clearColor()
    }
    
    // MARK: - Overrides
    
    init(icon: Icon!) {
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
    
    @available(*, unavailable, message = "Reserved for when designable objects are created in Interface Builder.")
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        // The icon font needs to be registered first
        Iconic.registerIconFont()
        
        // When there is no image, mimics UIImageView's native placeholder in IB
        if super.image == nil {
            self.layer.borderColor = UIColor(white: 0.72, alpha: 1).CGColor
            self.layer.borderWidth = 1
            
            let backdrop = UIView(frame: CGRectInset(frame, 2, 2))
            backdrop.backgroundColor = UIColor(red: 53/255, green: 105/255, blue: 193/255, alpha: 89/255)
            self.addSubview(backdrop)
            
            let label = UILabel(frame: CGRectZero)
            label.text = "Icon View"
            label.font = UIFont(name: "Arial-BoldMT", size: 14)
            label.textColor = .whiteColor()
            label.textAlignment = .Center
            label.sizeToFit()
            label.center = center
            self.addSubview(label)
        }
    }
    
    // MARK: - Constructor
    
    func updateIconImage() {
        
        // no need to update if the sizing is empty or too small
        if CGRectIsEmpty(frame) ||
            CGRectIsNull(frame) ||
            CGRectGetWidth(frame) < 5 {
            return
        }

        if icon == nil {
            super.image = nil
        }
        else {
            let size = max(CGRectGetWidth(frame), CGRectGetHeight(frame))
            let image = Iconic.image(forIcon: icon!, size: size, color: tintColor)
            
            super.image = image
        }
    }
}

extension Icon {
    
    init(named iconName: String) {
        switch iconName.lowercaseString {
        case "dribble": self = .Dribble
        case "dropbox": self = .Dropbox
        case "github":  self = .Github
        default: self = TotalCount
        }
    }
}
