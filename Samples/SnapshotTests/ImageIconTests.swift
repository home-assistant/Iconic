//
//  ImageIconTests.swift
//  Samples
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase
import Iconic

class ImageIconTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        self.recordMode = false
    }
    
    func testIconSizes() {
        
        let sizes:[CGFloat] = [16.0, 32.0, 64.0, 128.0, 512.0]
        
        for size in sizes {
            
            let image = Iconic.image(forIcon: Icon.GithubAlt, size: size, color: UIColor.redColor())
            let imageView = UIImageView(image: image)
            
            self.verifyView(imageView, withIdentifier: "\(size) icon")
        }
    }
}
