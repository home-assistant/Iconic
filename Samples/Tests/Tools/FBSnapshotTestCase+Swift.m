//
//  FBSnapshotTestCase+Swift.m
//  Iconic
//
//  Created by Ignacio Romero on 7/23/16.
//  Copyright © 2016 Tiny Speck, Inc. All rights reserved.
//

#import "FBSnapshotTestCase+Swift.h"

@implementation FBSnapshotTestCase (SwiftAdditions)

- (void)verifyView:(UIView *)view withIdentifier:(NSString *)identifier {
    FBSnapshotVerifyView(view, identifier);
}

@end
