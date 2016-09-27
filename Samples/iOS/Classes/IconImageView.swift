//
//  IconImageView.swift
//  Iconic
//
//  Created by Ignacio Romero on 7/28/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import UIKit
import Iconic

@IBDesignable
class IconImageView: UIImageView {
    
    // MARK: - Public & Inspectable properties
    
    @available(*, unavailable, message : "This property is reserved for Interface Builder. Use 'icon' instead.")
    @IBInspectable dynamic var iconName: String? {
        willSet {
            drawable = FontAwesomeIcon(named: newValue ?? "")
        }
    }
    
    @available(*, unavailable, message : "This property is reserved for Interface Builder. Use 'tintColor' instead.")
    @IBInspectable dynamic var iconColor: UIColor! {
        willSet {
            tintColor = newValue ?? UIColor.black
        }
    }
    
    var drawable: IconDrawable?{
        didSet {
            updateIconImage()
        }
    }
    
    
    // MARK: - Initializers
    
    init(icon: IconDrawable) {
        super.init(image: nil)
        commonInit()
        drawable = icon
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.clear
    }
    
    
    // MARK: - Overrides

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
        
        // The icon font needs to be registered first.
        FontAwesomeIcon.register()
    }
    
    
    // MARK: - Image Constructor
    
    func updateIconImage() {
        
        // No need to update if the sizing is empty or too small
        if frame.isEmpty || frame.isNull || min(frame.width,frame.height) < 5 {
            return
        }

        if drawable != nil {
            let image = drawable?.image(ofSize: frame.size, color: tintColor)
            super.image = image
        }
        else {
            super.image = nil
        }
    }
}
