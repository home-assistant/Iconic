//
//  FBSnapshotTestCase+Swift.h
//  Iconic
//
//  Created by Ignacio Romero on 7/23/16.
//  Copyright © 2016 Tiny Speck, Inc. All rights reserved.
//

#import <FBSnapshotTestCase/FBSnapshotTestCase.h>

@interface FBSnapshotTestCase (Swift)

- (void)verifyView:(UIView *)view withIdentifier:(NSString *)identifier;
- (void)verifyLayer:(CALayer *)layer withIdentifier:(NSString *)identifier;

@end
