//
//  NSAttributedString+IconMapping.h
//  Samples
//
//  Created by Ignacio Romero on 9/25/16.
//  Copyright © 2016 DZN. All rights reserved.
//

@import Foundation;
@import Iconic;

@interface NSAttributedString (IconMapping)

/** Returns an attributed string instance mapping all the available icons in the icon font. */
+ (nonnull instancetype)iconMapWithSize:(CGFloat)size spacing:(CGFloat)spacing andColor:(nullable UIColor *)color;

@end
