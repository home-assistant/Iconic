//
//  BaseSnapshotTestCase.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/24/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase
import Iconic

class BaseSnapshotTestCase: FBSnapshotTestCase {

    override class func setUp() {
        super.setUp()
    }
    
    override func setUp() {
        super.setUp()
        FontAwesomeIcon.register()
        self.recordMode = false
    }
    
    override func tearDown() {
        FontAwesomeIcon.unregister()
        super.tearDown()
    }
}
