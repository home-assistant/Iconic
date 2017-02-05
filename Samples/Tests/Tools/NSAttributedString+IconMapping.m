//
//  NSAttributedString+IconMapping.m
//  Samples
//
//  Created by Ignacio Romero on 9/25/16.
//  Copyright © 2017 DZN. All rights reserved.
//

#import "NSAttributedString+IconMapping.h"

@implementation NSAttributedString (IconMapping)

+ (nonnull instancetype)iconMapWithSize:(CGFloat)size spacing:(CGFloat)spacing andColor:(nullable UIColor *)color
{
    NSMutableAttributedString *attributedText = [NSMutableAttributedString new];
    NSInteger count = [Iconic fontAwesomeIconCount];
    
    for (int i = 0; i < count; i++) {
        
        NSAttributedString *aString = [Iconic attributedStringWithIcon:i pointSize:size color:color];
        NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithAttributedString:aString];
        
        if (mString) {
            [mString addAttribute:NSKernAttributeName value:@(spacing) range:NSMakeRange(0, mString.length)];
            [attributedText appendAttributedString:mString];
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
