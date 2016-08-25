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
    @IBInspectable var iconName: String? {
        willSet {
            icon = Icon(named: newValue ?? "")
        }
    }
    
    @available(*, unavailable, message = "This property is reserved for Interface Builder. Use 'tintColor' instead.")
    @IBInspectable var iconColor: UIColor! {
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
        Iconic.registerIconFont()
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
