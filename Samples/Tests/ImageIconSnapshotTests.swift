//
//  ImageIconSnapshotTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import FBSnapshotTestCase
import Iconic

class ImageIconSnapshotTests: BaseSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
//        self.recordMode = false
    }
    
    func testImageDefaultColor() {
        
        let size = CGSize(width: 60, height: 60)

        let image = FontAwesomeIcon.saveIcon.image(ofSize: size, color: nil)
        let imageView = UIImageView(image: image)
        
        self.verifyView(imageView, withIdentifier: "")
    }
    
    func testImagePatternColor() {
        
        let bundle = Bundle(for: type(of: self))
        let size = CGSize(width: 60, height: 60)
        
        if let pattern = UIImage(named: "pattern", in: bundle, compatibleWith: nil) {
            
            let color = UIColor(patternImage: pattern)
            let image = FontAwesomeIcon.warningSignIcon.image(ofSize: size, color: color)
            let imageView = UIImageView(image: image)
            
            self.verifyView(imageView, withIdentifier: "")
        }
    }
    
    func testImageSizes() {
                
        let pointSizes = [16, 32, 64, 128, 512]
        
        for pointSize in pointSizes {
            
            let size = CGSize(width: pointSize, height: pointSize)

            let image = FontAwesomeIcon.githubAltIcon.image(ofSize: size, color: UIColor.red)
            let imageView = UIImageView(image: image)
            
            XCTAssertEqual(image.size, size)
            
            self.verifyView(imageView, withIdentifier: "\(pointSize)_icon")
        }
    }
    
    func testImagePadding() {
        
        let size = CGSize(width: 88, height: 88)
        let expectedSize = CGSize(width: 98, height: 98)
        let padding = UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5)

        let image = FontAwesomeIcon.githubIcon.image(ofSize: size, color: nil, edgeInsets: padding)
        let imageView = UIImageView(image: image)
        
        XCTAssertEqual(image.size, expectedSize)
        
        self.verifyView(imageView, withIdentifier: "")
    }
    
    func testImageNoPadding() {
        
        let size = CGSize(width: 88, height: 88)

        let image = FontAwesomeIcon.githubIcon.image(ofSize: size, color: nil, edgeInsets: UIEdgeInsets.zero)
        let imageView = UIImageView(image: image)
        
        XCTAssertEqual(image.size, size)
        
        self.verifyView(imageView, withIdentifier: "")
    }
}
