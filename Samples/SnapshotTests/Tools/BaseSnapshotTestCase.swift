//
//  BaseSnapshotTestCase.swift
//  Samples
//
//  Created by Ignacio Romero on 9/24/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase

class BaseSnapshotTestCase: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        
        self.recordMode = false
    }
}
