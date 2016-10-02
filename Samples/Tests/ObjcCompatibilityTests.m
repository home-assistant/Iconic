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

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFundamentals
{
    XCTAssertTrue([Iconic respondsToSelector:@selector(registerFontAwesomeIcon)]);
    XCTAssertTrue([Iconic respondsToSelector:@selector(unregisterFontAwesomeIcon)]);
    
    UIFont *font = [Iconic fontAwesomeIconFontOfSize:20.0];
    XCTAssertTrue([font.familyName isEqualToString:@"FontAwesome"]);
    XCTAssertEqual(font.pointSize, 20.0);
    
    NSString *familyName = [Iconic fontAwesomeFamilyName];
    XCTAssertTrue([familyName isEqualToString:@"FontAwesome"]);
    
    NSInteger count = [Iconic fontAwesomeIconCount];
    XCTAssertEqual(count, 649);
}

- (void)testAttributedStringConstructor
{
    NSAttributedString *attributedText = [Iconic attributedStringWithIcon:FontAwesomeIconOk pointSize:20 color:nil];
    
    XCTAssertNotNil(attributedText);
    XCTAssertEqual(attributedText.length, 1);
}

- (void)testImageConstructor
{
    CGSize size = CGSizeMake(20.0, 20.0);
    UIImage *image = [Iconic imageWithIcon:FontAwesomeIconOk size:size color:nil];
    
    XCTAssertNotNil(image);
    XCTAssertTrue(CGSizeEqualToSize(image.size, size));
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
