//
//  StringIconTests.swift
//  Iconic
//
//  Created by Ignacio Romero on 9/10/16.
//  Copyright © 2016 DZN. All rights reserved.
//

import FBSnapshotTestCase
import Iconic

extension Icon {
    // TODO: Update in Swift 3
    static func enumerate() -> AnyGenerator<Icon> {
        var nextIndex = 0
        return AnyGenerator { Icon(rawValue: nextIndex++) }
    }
}

class StringIconTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        
        self.recordMode = false
    }
    
    func testSimpleString() {
        
        let iconString = Iconic.attributedString(forIcon: Icon.CameraRetro, size: 50, color: nil)
        let textView = UITextView()
        
        textView.attributedText = iconString
        textView.sizeToFit()
        
        self.verifyView(textView, withIdentifier: "")
    }
    
    func testFullIconMap() {
        
        var rect = CGRectMake(0, 0, 500, 0)
        let attributedString = NSMutableAttributedString()
        
        for icon in Icon.enumerate() {
            
            if let iconString = Iconic.attributedString(forIcon: icon, size: 20, color: nil) {
                attributedString.appendAttributedString(iconString)
            }
        }
        
        let space = CGFloat(5)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = space;
        paragraphStyle.headIndent = space;
        paragraphStyle.tailIndent = -space;
        paragraphStyle.lineSpacing = space;

        attributedString.addAttributes([NSParagraphStyleAttributeName: paragraphStyle, NSKernAttributeName: space],
                                       range: NSMakeRange(0, attributedString.length))
        
        let textView = UITextView(frame: rect)
        textView.attributedText = attributedString
        
        rect.size.height = textView.contentSize.height
        textView.frame = rect
        
        self.verifyView(textView, withIdentifier: "")
    }
    
    func testComposeString() {
        
        let icon = Icon.Dribble
        
        let edgeInsets = ["left": UIEdgeInsetsMake(0, 0, 0, 15),
                          "bottom": UIEdgeInsetsMake(15, 0, 0, 0),
                          "right": UIEdgeInsetsMake(0, 15, 0, 0),
                          "top": UIEdgeInsetsMake(0, 0, 15, 0)]
        
        for (kind, edgeInset) in edgeInsets {
            
            let attributedText = NSMutableAttributedString()
            let iconString = Iconic.attributedString(forIcon: icon, size: 25, color: nil, edgeInsets: edgeInset)!
            
            let titleAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(25),
                                   NSForegroundColorAttributeName: UIColor.blackColor()]
            
            let titleAttrString = NSAttributedString(string: NSStringFromIcon(icon), attributes: titleAttributes)
            
            attributedText.appendAttributedString(iconString)
            attributedText.appendAttributedString(titleAttrString)
            
            let textView = UITextView()
            
            textView.attributedText = attributedText
            textView.sizeToFit()
            
            self.verifyView(textView, withIdentifier: kind)
        }
    }
}

