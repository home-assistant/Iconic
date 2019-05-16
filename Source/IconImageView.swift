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
public class IconImageView: UIImageView {

    // MARK: - Public Variables

    /** The icon drawable to be used as image. */
    public var iconDrawable: IconDrawable? {
        didSet {
            updateIconImage()
        }
    }

    // MARK: - Overrides

    public override var frame: CGRect {
        didSet {
            updateIconImage()
        }
    }

    public override func layoutSubviews() {
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

        if let icon = iconDrawable {
            let image = icon.image(ofSize: frame.size, color: nil)
            self.image = image.withRenderingMode(.alwaysTemplate)
        } else {
            self.image = nil
        }
    }
}
#endif

