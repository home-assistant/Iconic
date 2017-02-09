//
//  BaseSnapshotTestCase.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/24/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import FBSnapshotTestCase
@testable import Iconic

class BaseSnapshotTestCase: FBSnapshotTestCase {

    override class func setUp() {
        
        super.setUp()
        
        assert(UIScreen.main.scale == 2, "Snapshot tests must be run with any @2x simulator since reference images are recorded with that scale.")
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
