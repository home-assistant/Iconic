//
//  FBSnapshotTestCase+Swift.h
//  Iconic
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
//

#import <FBSnapshotTestCase/FBSnapshotTestCase.h>

@interface FBSnapshotTestCase (Swift)

- (void)verifyView:(UIView *)view withIdentifier:(NSString *)identifier;

@end
