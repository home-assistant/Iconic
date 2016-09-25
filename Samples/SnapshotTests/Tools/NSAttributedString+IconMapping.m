//
//  NSAttributedString+IconMapping.m
//  Samples
//
//  Created by Ignacio Romero on 9/25/16.
//  Copyright © 2016 DZN. All rights reserved.
//

#import "NSAttributedString+IconMapping.h"

@implementation NSAttributedString (IconMapping)

+ (nonnull instancetype)iconMapWithSize:(CGFloat)size spacing:(CGFloat)spacing andColor:(nullable UIColor *)color
{
    NSMutableAttributedString *attributedText = [NSMutableAttributedString new];
    
    for (int i = 0; i < IconTotalCount; i++) {
        
        NSMutableAttributedString *fontString = [[Iconic attributedStringForIcon:i size:size color:color] mutableCopy];
        
        if (fontString) {
            [fontString addAttribute:NSKernAttributeName value:@(spacing) range:NSMakeRange(0, fontString.length)];
            [attributedText appendAttributedString:fontString];
        }
    }
    
    NSMutableParagraphStyle *paragrahStyle = [NSMutableParagraphStyle new];
    paragrahStyle.firstLineHeadIndent = spacing;
    paragrahStyle.headIndent = spacing;
    paragrahStyle.tailIndent = -spacing;
    paragrahStyle.lineSpacing = spacing;
    
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, attributedText.length)];
    
    return attributedText;
}

@end
