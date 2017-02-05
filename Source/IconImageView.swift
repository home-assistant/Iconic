//
//  IconImageView.swift
//  https://github.com/dzenbot/Iconic
//
//  Created by Ignacio Romero on 7/28/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import UIKit

#if os(iOS) || os(tvOS)

open class IconImageView: UIImageView {
    
    // MARK: - Public
        
    var icon: IconDrawable? {
        didSet {
            updateIconImage()
        }
    }
    
    // MARK: - Initializers
    
    public init(icon: IconDrawable) {
        super.init(image: nil)
        commonInit()
        self.icon = icon
    }
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.backgroundColor = UIColor.clear
    }
    
    // MARK: - Overrides
    
    override open var tintColor: UIColor! {
        didSet {
            updateIconImage()
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        updateIconImage()
    }
    
    // MARK: - Image Constructor
    
    func updateIconImage() {
        
        // No need to update if the sizing is empty or too small
        if frame.isEmpty || frame.isNull || min(frame.width, frame.height) < 5 {
            return
        }
        
        if icon != nil {
            let image = icon?.image(ofSize: frame.size, color: tintColor)
            super.image = image
        } else {
            super.image = nil
        }
    }
}

#endif
