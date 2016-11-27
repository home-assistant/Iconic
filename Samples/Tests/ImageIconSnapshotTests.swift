//
//  ImageIconSnapshotTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase

class ImageIconSnapshotTests: BaseSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
//        self.recordMode = false
    }
    
    func testImageDefaultColor() {
        
        let size = CGSize(width: 60, height: 60)

        let image = FontAwesomeIcon.Save.image(ofSize: size, color: nil)
        let imageView = UIImageView(image: image)
        
        self.verifyView(imageView, withIdentifier: "")
    }
    
    func testImagePatternColor() {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        
        let size = CGSize(width: 60, height: 60)

        if let pattern = UIImage(named: "pattern", inBundle: bundle, compatibleWithTraitCollection: nil) {
            
            let color = UIColor(patternImage: pattern)
            let image = FontAwesomeIcon.WarningSign.image(ofSize: size, color: color)
            let imageView = UIImageView(image: image)
        
            self.verifyView(imageView, withIdentifier: "")
        }
    }
    
    func testImageSizes() {
        
        let pointSizes = [16, 32, 64, 128, 512]
        
        for pointSize in pointSizes {
            
            let size = CGSize(width: pointSize, height: pointSize)

            let image = FontAwesomeIcon.GithubAlt.image(ofSize: size, color: UIColor.redColor())
            let imageView = UIImageView(image: image)
            
            XCTAssertEqual(image.size, size)
            
            self.verifyView(imageView, withIdentifier: "\(pointSize)_icon")
        }
    }
    
    func testImagePadding() {
        
        let padding = UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5)
        let size = CGSize(width: 88, height: 88)
        let expectedSize = CGSize(width: 98, height: 98)

        let image = FontAwesomeIcon.Github.image(ofSize: size, color: nil, edgeInsets: padding)
        let imageView = UIImageView(image: image)
        
        XCTAssertEqual(image.size, expectedSize)
        
        self.verifyView(imageView, withIdentifier: "")
    }
    
    func testImageNoPadding() {
        
        let size = CGSize(width: 88, height: 88)

        let image = FontAwesomeIcon.Github.image(ofSize: size, color: nil, edgeInsets: UIEdgeInsetsZero)
        let imageView = UIImageView(image: image)
        
        XCTAssertEqual(image.size, size)
        
        self.verifyView(imageView, withIdentifier: "")
    }
}
