//
//  StringIconTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase
import Iconic

class StringIconTests: BaseSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
//        self.recordMode = false
    }
    
    func testSimpleString() {
        
        let iconString = Iconic.attributedString(forIcon: .cameraRetro, size: 50, color: nil)
        let textView = UITextView()
        
        textView.attributedText = iconString
        textView.sizeToFit()
        
        self.verifyView(textView, withIdentifier: "")
    }
    
    func testFullIconMap() {
        
        var rect = CGRect(x: 0, y: 0, width: 500, height: 0)
        let attributedString = NSAttributedString.iconMap(withSize: 20, spacing: 5, andColor: nil)
        
        let textView = UITextView(frame: rect)
        textView.attributedText = attributedString
        
        rect.size.height = textView.contentSize.height
        textView.frame = rect
        
        self.verifyView(textView, withIdentifier: "")
    }
    
    func testComposeString() {
        
        let icon = Icon.dribble
        
        let edgeInsets = ["left": UIEdgeInsetsMake(0, 0, 0, 15),
                          "bottom": UIEdgeInsetsMake(15, 0, 0, 0),
                          "right": UIEdgeInsetsMake(0, 15, 0, 0),
                          "top": UIEdgeInsetsMake(0, 0, 15, 0)]
        
        for (kind, edgeInset) in edgeInsets {
            
            let attributedText = NSMutableAttributedString()
            let iconString = Iconic.attributedString(forIcon: icon, size: 25, color: nil, edgeInsets: edgeInset)!
            
            let titleAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 25),
                                   NSForegroundColorAttributeName: UIColor.black] as [String : Any]
            
            let titleAttrString = NSAttributedString(string: NSStringFromIcon(icon), attributes: titleAttributes)
            
            attributedText.append(iconString)
            attributedText.append(titleAttrString)
            
            let textView = UITextView()
            
            textView.attributedText = attributedText
            textView.sizeToFit()
            
            self.verifyView(textView, withIdentifier: kind)
        }
    }
}

