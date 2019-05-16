//
//  ThirdViewController.m
//  Example
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic

#import "ThirdViewController.h"
#import "NSAttributedString+IconMapping.h"

#import "iOS-Swift.h"

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
    self.tabBarItem = [[UITabBarItem alloc] initWithIcon:FontAwesomeIconOlIcon size:CGSizeMake(20.0, 20.0) title:@"As Text"];
    self.title = self.tabBarItem.title;

    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithIcon:FontAwesomeIconCogIcon size:CGSizeMake(24.0, 24.0) target:self action:@selector(didTapRightButtonItem:)];
    self.navigationItem.rightBarButtonItem = buttonItem;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateTitleView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    UIColor *color = self.tabBarController.tabBar.tintColor;
    NSAttributedString *attributedText = [NSAttributedString iconMapWithSize:24.0 spacing:10.0 andColor:color];

    self.textView.attributedText = attributedText;
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
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithIcon:FontAwesomeIconAngleDownIcon size:CGSizeMake(30.0, 30.0) target:self action:@selector(didTapLeftButtonItem:)];
    [self.navigationItem setLeftBarButtonItem:buttonItem animated:YES];

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
