//
//  SnapshotTests.m
//  Samples
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import <Iconic/Iconic-Swift.h>

@interface SnapshotTests : FBSnapshotTestCase
@end

@implementation SnapshotTests

- (void)setUp
{
    [super setUp];
    
    self.recordMode = NO;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testRedIcon
{
    UIImage *image = [Iconic imageForIcon:IconDribble size:256.0 color:[UIColor blueColor]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    FBSnapshotVerifyView(imageView, @"Red icon");
}

@end
