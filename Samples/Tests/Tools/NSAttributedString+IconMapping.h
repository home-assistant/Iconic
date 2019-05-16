//
//  NSAttributedString+IconMapping.h
//  Samples
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
//

@import UIKit;
@import Iconic;

@interface NSAttributedString (IconMapping)

/** Returns an attributed string instance mapping all the available icons in the icon font. */
+ (nonnull instancetype)iconMapWithSize:(CGFloat)size spacing:(CGFloat)spacing andColor:(nullable UIColor *)color;

@end
