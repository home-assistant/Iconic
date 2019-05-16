//
//  FBSnapshotTestCase+Swift.m
//  Iconic
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
//

#import "FBSnapshotTestCase+Swift.h"

@implementation FBSnapshotTestCase (SwiftAdditions)

- (void)verifyView:(UIView *)view withIdentifier:(NSString *)identifier
{
    // Allows 15% difference tolerance, specially to avoid errors
    // due to screen space and profile incompatibilities.
    FBSnapshotVerifyViewWithOptions(view, identifier, FBSnapshotTestCaseDefaultSuffixes(), 0.15)
}

@end
