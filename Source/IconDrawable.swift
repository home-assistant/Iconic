//
//  IconDrawable.swift
//  https://github.com/dzenbot/Iconic
//
//  Created by Ignacio Romero on 5/22/16.
//  Copyright © 2016 DZN Labs All rights reserved.
//

import UIKit
import CoreText

// Wrapper class for Objective-C compatibility.
open class Iconic: NSObject { }

//
public protocol IconDrawable {
    
    var name: String { get }
    var unicode: String { get }
    static var familyName: String { get }
    static var count: Int { get }
    
    init(named iconName: String)
    
    func attributedString(ofSize pointSize: CGFloat, color: UIColor?) -> NSAttributedString
    func attributedString(ofSize pointSize: CGFloat, color: UIColor?, edgeInsets: UIEdgeInsets) -> NSAttributedString

    func image(ofSize size: CGSize, color: UIColor?) -> UIImage
    func image(ofSize size: CGSize, color: UIColor?, edgeInsets: UIEdgeInsets) -> UIImage
    
    static func font(ofSize fontSize: CGFloat) -> UIFont
    static func register()
    static func unregister()
}

extension IconDrawable {
    
    public func attributedString(ofSize pointSize: CGFloat, color: UIColor?) -> NSAttributedString {
        
        let font = type(of: self).font(ofSize: pointSize)
        var attributes = [NSFontAttributeName : font] as [String : Any]
        
        if let color = color {
            attributes[NSForegroundColorAttributeName] = color
        }
        
        return NSAttributedString(string: unicode, attributes: attributes)
    }
    
    public func attributedString(ofSize pointSize: CGFloat, color: UIColor?, edgeInsets: UIEdgeInsets) -> NSAttributedString {
        
        let aString = attributedString(ofSize: pointSize, color: color)
        let mString = NSMutableAttributedString(attributedString: aString)
        
        mString.addAttribute(NSBaselineOffsetAttributeName, value: edgeInsets.bottom-edgeInsets.top, range: NSMakeRange(0, mString.length))
        
        let leftSpace = NSAttributedString(string: " ", attributes: [NSKernAttributeName: edgeInsets.left])
        let rightSpace = NSAttributedString(string: " ", attributes: [NSKernAttributeName: edgeInsets.right])
        
        mString.insert(rightSpace, at: mString.length)
        mString.insert(leftSpace, at: 0)
        
        return mString
    }
    
    public func image(ofSize size: CGSize, color: UIColor?) -> UIImage {
        
        return image(ofSize: size, color: color, edgeInsets: UIEdgeInsets.zero)
    }
    
    public func image(ofSize size: CGSize, color: UIColor?, edgeInsets: UIEdgeInsets) -> UIImage {
        
        let pointSize = min(size.width, size.height)
        let aString = attributedString(ofSize: pointSize, color: color)
        let mString = NSMutableAttributedString(attributedString: aString)
        
        var rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        rect.origin.y -= edgeInsets.top
        rect.size.width -= edgeInsets.left + edgeInsets.right
        rect.size.height -= edgeInsets.top + edgeInsets.bottom
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        mString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, mString.length))
        
        // Renders the attributed string as image using Text Kit
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        mString.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
        
    public static func font(ofSize fontSize: CGFloat) -> UIFont {
        
        // Needs a default size, since zero would return a system font object.
        let size = (fontSize == 0) ? 10.0 : fontSize
        
        return UIFont(name: familyName, size: size)!
    }
    
    public static func register() {
        
        let url = resourceUrl()
        var error: Unmanaged<CFError>? = nil
        let descriptors = CTFontManagerCreateFontDescriptorsFromURL(url) as NSArray?
        
        guard let descriptor = (descriptors as? [CTFontDescriptor])?.first else {
            assertionFailure("Could not retrieve font descriptors of font at path '\(url)',")
            return
        }
        
        let font = CTFontCreateWithFontDescriptorAndOptions(descriptor, 0.0, nil, [.preventAutoActivation])
        let fontName = CTFontCopyPostScriptName(font) as String
        
        // Registers font dynamically
        if CTFontManagerRegisterFontsForURL(url, .none, &error) == false || error != nil {
            assertionFailure("Failed registering font with the postscript name '\(fontName)' at path '\(url)' with error: \(error).")
        }
        
        print("Font '\(familyName)' registered successfully!")
    }
    
    public static func unregister() {
        
        let url = resourceUrl()
        var error: Unmanaged<CFError>? = nil
        
        if CTFontManagerUnregisterFontsForURL(url, .none, &error) == false || error != nil {
            assertionFailure("Failed unregistering font with name '\(familyName)' at path '\(url)' with error: \(error).")
        }
        
        print("Font '\(familyName)' unregistered successfully!")
    }
    
    private static func resourceUrl() -> CFURL {
        
        let extensions = ["otf", "ttf"]
        let bundle = Bundle(for: Iconic.self)
        
        let url = (extensions.flatMap { bundle.url(forResource: familyName, withExtension: $0) }).first
        
        if url == nil {
            assertionFailure("Could not find the '\(familyName)' font in bundle:\(bundle).")
        }
        
        return url as! CFURL
    }
}