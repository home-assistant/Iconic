//
//  BaseSnapshotTestCase.swift
//  Iconic
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
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
