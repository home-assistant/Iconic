//
//  ObjcCompatibilityTests.m
//  Iconic
//
//  Created by Ignacio Romero on 9/26/16.
//  Copyright © 2016 DZN. All rights reserved.
//

@import XCTest;
@import Iconic;

@interface ObjcCompatibilityTests : XCTestCase
@end

@implementation ObjcCompatibilityTests

- (void)setUp
{
    [super setUp];
    
    [Iconic registerFontAwesomeIcon];
}

- (void)tearDown
{
    [super tearDown];
    
    [Iconic unregisterFontAwesomeIcon];
}

- (void)testFundamentals
{
    XCTAssertTrue([Iconic respondsToSelector:@selector(registerFontAwesomeIcon)]);
    XCTAssertTrue([Iconic respondsToSelector:@selector(unregisterFontAwesomeIcon)]);
    
    UIFont *font = [Iconic fontAwesomeIconFontOfSize:20.0];
    XCTAssertTrue([font.familyName isEqualToString:@"FontAwesome"]);
    XCTAssertEqual(font.pointSize, 20.0);
    
    NSString *familyName = [Iconic fontAwesomeIconFamilyName];
    XCTAssertTrue([familyName isEqualToString:@"FontAwesome"]);
    
    NSInteger count = [Iconic fontAwesomeIconCount];
    XCTAssertEqual(count, 649);
}

- (void)testAttributedStringConstructor
{
    CGFloat pointSize = 20.0;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(-10.0, -10.0, -10.0, -10.0);
    
    NSAttributedString *attributedText1 = [Iconic attributedStringWithIcon:FontAwesomeIconOk pointSize:pointSize color:nil];
    NSAttributedString *attributedText2 = [Iconic attributedStringWithIcon:FontAwesomeIconBug pointSize:pointSize color:nil edgeInsets:edgeInsets];
    
    XCTAssertNotNil(attributedText1);
    XCTAssertNotNil(attributedText2);
    
    XCTAssertEqual(attributedText1.length, 1);
    XCTAssertEqual(attributedText2.length, 3); // Contains 2 whitespaces for the separation
}

- (void)testImageConstructor
{
    CGSize size = CGSizeMake(20.0, 20.0);
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(-10.0, -10.0, -10.0, -10.0);
    
    UIImage *image1 = [Iconic imageWithIcon:FontAwesomeIconOk size:size color:nil];
    UIImage *image2 = [Iconic imageWithIcon:FontAwesomeIconBug size:size color:nil edgeInsets:edgeInsets];
    
    XCTAssertNotNil(image1);
    XCTAssertNotNil(image2);
    
    XCTAssertTrue(CGSizeEqualToSize(image1.size, size));
    XCTAssertTrue(CGSizeEqualToSize(image2.size, CGSizeMake(40.0, 40.0)));
}

- (void)testUIConstructor
{
    CGSize size = CGSizeMake(24.0, 24.0);
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithIcon:FontAwesomeIconOk size:size title:@"Title"];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithIcon:FontAwesomeIconOk size:size target:nil action:@selector(tearDown)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setIconImageWithIcon:FontAwesomeIconOk size:size color:nil forState:UIControlStateNormal];
    
    XCTAssertNotNil(tabBarItem);
    XCTAssertNotNil(buttonItem);
    XCTAssertNotNil(button);
}

@end
