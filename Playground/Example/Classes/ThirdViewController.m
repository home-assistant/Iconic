//
//  ThirdViewController.m
//  Example
//
//  Created by Ignacio Romero on 5/22/16.
//  Copyright © 2016 DZN Labs All rights reserved.
//

#import "ThirdViewController.h"

@import Iconic;

@interface ThirdViewController ()
@end

@implementation ThirdViewController

#pragma mark - View lifecycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    self.tabBarItem = [[UITabBarItem alloc] initWithFontAwesomeIcon:FontAwesomeIcon_546 size:20.0 title:@"As Text" tag:2];
    self.title = self.tabBarItem.title;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithFontAwesomeIcon:FontAwesomeIconCog size:24.0 target:self action:@selector(didTapRightButtonItem:)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
        UIColor *color = self.tabBarController.tabBar.tintColor;
        
        for (int i = 0; i < FontAwesomeIconTotalCount; i++) {
            
            NSMutableAttributedString *fontString = [[Iconic attributedStringForFontAwesomeIcon:i size:24.0 color:color] mutableCopy];
            [fontString addAttribute:NSKernAttributeName value:@(5) range:NSMakeRange(0, fontString.length)];
            
            [attributedText appendAttributedString:fontString];
        }
        
        CGFloat space = 5.0;
        
        NSMutableParagraphStyle *paragrahStyle = [NSMutableParagraphStyle new];
        paragrahStyle.firstLineHeadIndent = space;
        paragrahStyle.headIndent = space;
        paragrahStyle.tailIndent = -space;
        paragrahStyle.lineSpacing = space;
        
        [attributedText addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, attributedText.length)];

        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.attributedText = attributedText;
        });
    });
}

- (void)didTapRightButtonItem:(id)sender
{
    // Do something
}

- (void)didTapLeftButtonItem:(id)sender
{
    if ([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    }
}

- (void)willShowKeyboard:(NSNotification *)note
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithFontAwesomeIcon:FontAwesomeIconAngleDown size:30.0 target:self action:@selector(didTapLeftButtonItem:)];
    [self.navigationItem setLeftBarButtonItem:item animated:YES];
    
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIEdgeInsets insets = self.textView.contentInset;
    insets.bottom += CGRectGetHeight(keyboardFrame);
    
    self.textView.contentInset = insets;
}

- (void)willHideKeyboard:(NSNotification *)note
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    UIEdgeInsets insets = self.textView.contentInset;
    insets.bottom -= CGRectGetHeight(keyboardFrame);
    
    self.textView.contentInset = insets;
}

@end
