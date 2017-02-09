//
//  IconImageView.swift
//  https://github.com/dzenbot/Iconic
//
//  Created by Ignacio Romero on 7/28/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import UIKit

#if os(iOS) || os(tvOS)

/** An Image View subclass, capable of rendering icons. Only supported for iOS and tvOS. */
open class IconImageView: UIImageView {
    
    // MARK: - Public Variables
    
    /** The icon drawable to be used as image. */
    public var iconDrawable: IconDrawable? {
        didSet {
            updateIconImage()
        }
    }
    
    // MARK: - Initializers
    
    /**
     Returns an image view initialized with the specified icon.
     The icon you specified is used to configure the initial size of the image view itself, of 40 pts as default.
     
     - parameter icon: The initial icon to display in the image view.
     */
    convenience public init(iconDrawable: IconDrawable) {
        self.init(iconDrawable: iconDrawable, size: CGSize())
    }
    
    /**
     Returns an image view initialized with the specified icon and size.
     
     - parameter icon: The initial icon to display in the image view.
     - parameter size: The size of the image, in points.
     */
    public required init(iconDrawable: IconDrawable, size: CGSize) {
        super.init(frame: CGRect(x:0, y:0, width: size.width, height: size.height))
        self.iconDrawable = iconDrawable
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Overrides
    
    open override var tintColor: UIColor! {
        didSet {
            updateIconImage()
        }
    }
    
    open override var frame: CGRect {
        didSet {
            updateIconImage()
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        updateIconImage()
    }
    
    // MARK: - Image Constructor
    
    /**
     Updates the icon image, only when the frame is not empty.
     */
    fileprivate func updateIconImage() {
        
        // No need to update the icon with empty frame
        if frame.isEmpty {
            return
        }
        
        if iconDrawable != nil {
            let image = iconDrawable?.image(ofSize: frame.size, color: tintColor)
            self.image = image
        } else {
            self.image = nil
        }
    }
}

#endif
