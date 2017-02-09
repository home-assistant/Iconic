//
//  IconImageViewTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 2/5/17.
//  Copyright © 2017 DZN. All rights reserved.
//

class IconImageViewTests: BaseSnapshotTestCase {
    
    let defaultIcon = FontAwesomeIcon.refreshIcon
    
    let defaultSize = CGSize(width: 30, height: 30)
    let emptySize = CGSize()
    
    let defaultFrame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let emptyFrame = CGRect()

    override func setUp() {
        super.setUp()
        
        // Toggle on for recording a new snapshot. Remember to turn it back off to validate the test.
        self.recordMode = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testImageViewIconUpdate() {
        
        let imageView = IconImageView(iconDrawable: defaultIcon, size: defaultSize)
        imageView.iconDrawable = FontAwesomeIcon.paperClipIcon
        
        self.verifyView(imageView, withIdentifier: "")
    }
    
    func testImageViewColorUpdate() {
        
        let imageView = IconImageView(iconDrawable: defaultIcon, size: defaultSize)
        imageView.tintColor = .orange
        
        self.verifyView(imageView, withIdentifier: "")
    }
    
    func testImageViewSizeUpdate() {
        
        let imageView = IconImageView(iconDrawable: defaultIcon)
        imageView.frame = defaultFrame
        
        self.verifyView(imageView, withIdentifier: "")
    }
    
    func testImageViewNoIcon() {
        
        let imageView = IconImageView(frame: defaultFrame)
        
        XCTAssertNil(imageView.iconDrawable)
        XCTAssertNil(imageView.image)
    }
    
    func testImageViewEmtpyFrame() {
        
        let imageView = IconImageView(iconDrawable: defaultIcon)
        imageView.frame = emptyFrame
        
        XCTAssertTrue(imageView.frame.isEmpty)
        
        // No image update when the frame is empty
        XCTAssertNotNil(imageView.iconDrawable)
        XCTAssertNil(imageView.image)

        imageView.frame = defaultFrame
        
        // Image should not be nil at this point, with a valid frame
        XCTAssertNotNil(imageView.image)
    }
}
