//
//  Iconic.swift
//  https://github.com/dzenbot/Iconic
//
//  Created by Ignacio Romero on 5/22/16.
//  Copyright © 2016 DZN Labs All rights reserved.
//

import UIKit
import CoreText

public class Iconic: NSObject {
    
    static var icons = [String: [String]]()
    static var fontUrls = [String: NSURL]()
    
    // MARK: - Font Registration
    
    /**
     Registers a font (OTF or TTF) from the application's bundle for a specific Icon type.
     
     - parameter familyName: The font's family name available in the application's bundle to be used for registering.
     - parameter map: An array of icon glyph unicodes.
     */
    class func registerFont(familyName: String, map: [String]) {
        
        if let url = urlForFontWithName(familyName) {
            return registerFontFromURL(url, map:map)
        }
        else {
            print("Could not find any font with the name '\(familyName)' in the application's main bundle.")
        }
    }
    
    /**
     Registers a font from a specific file path.
     
     - parameter path: The path of the font file (generally from the application bundle)
     - parameter map: An array of icon glyph unicodes.
     */
    class func registerFontWithPath(path: String, map: [String]) {
        
        registerFontFromURL(NSURL.fileURLWithPath(path), map:map)
    }
    
    // MARK: - Constructors
    
    class func iconFontOfSize(fontSize: CGFloat) -> UIFont? {
        
        // Calling UIFont.init() with zero would return a system font object.
        if fontSize == 0 {
            return nil
        }
        
        guard let name = Array(icons.keys).first, let font = UIFont(name: name, size: fontSize) else {
            return nil
        }        
        
        return font
    }
    
    class func attributedStringForIndex(idx: Int, size: CGFloat, color: UIColor?) -> NSAttributedString? {
        
        guard let font = iconFontOfSize(size), let string = unicodeStringForIndex(idx) else {
            return nil
        }
        
        var attributes = [NSFontAttributeName: font] as [String : AnyObject]
        
        if let color = color {
            attributes[NSForegroundColorAttributeName] = color
        }
        
        return NSAttributedString(string: string, attributes: attributes)
    }
    
    class func imageForIndex(idx: Int, size: CGFloat, color: UIColor?) -> UIImage? {
        
        guard let attributedString = Iconic.attributedStringForIndex(idx, size: size, color: color)?.mutableCopy() else {
            return nil
        }
        
        let rect = CGRectMake(0, 0, size, size)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        attributedString.drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    class func unicodeStringForIndex(idx: Int) -> String? {
        
        guard let map = Array(icons.values).first where idx < map.count else {
            return nil
        }
        
        let unicode = map[idx]
        
        guard let string = NSString(UTF8String: unicode) else {
            return nil
        }
        
        return string as String
    }
}

public extension Iconic {
    
    /**
     Unregisters all registered icon fonts.
     */
    class func unregisterAllFonts() {
        
        let fontNames = Array(icons.keys)
        
        var error: Unmanaged<CFErrorRef>? = nil
        
        for i in 0..<fontNames.count {
            
            let postScriptName = fontNames[i]
            let fontUrl = fontUrls[postScriptName]
            
            if CTFontManagerUnregisterFontsForURL(fontUrl!, .None, &error) == true {
                icons.removeAll()
            }
            else {
                print("Failed unregistering font with the name '\(postScriptName)' at path \(fontUrl) with error: \(error).")
            }
        }
    }
}

private extension Iconic {
    
    class func registerFontFromURL(url: NSURL, map: [String]) {
        
        guard map.count > 0 else {
            print("Failed registering font. The icon map cannot be empty.")
            return
        }
        
        let descriptors = CTFontManagerCreateFontDescriptorsFromURL(url) as NSArray?
        
        guard let descriptor = (descriptors as? [CTFontDescriptorRef])?.first else {
            print("Could not retrieve font descriptors of font at path \(url).")
            return
        }
        
        let font = CTFontCreateWithFontDescriptorAndOptions(descriptor, 0.0, nil, [.PreventAutoActivation])
        let postScriptName = CTFontCopyPostScriptName(font) as String
        var error: Unmanaged<CFErrorRef>? = nil
        
        // Registers font dynamically
        if CTFontManagerRegisterFontsForURL(url, .None, &error) == true {
            icons[postScriptName] = map
            fontUrls[postScriptName] = url
        }
        else {
            print("Failed registering font with the postscript name '\(postScriptName)' at path \(url) with error: \(error).")
        }
    }
    
    class func urlForFontWithName(familyName: String) -> NSURL? {
        
        let extensions = ["otf", "ttf"]
        let bundle = NSBundle(forClass: Iconic.self)
        
        return extensions.flatMap { bundle.URLForResource(familyName, withExtension: $0) }.first
    }
}

extension UIBarButtonItem {
    
    internal convenience init(idx: Int, size: CGFloat, target: AnyObject?, action: Selector) {
        
        let image = Iconic.imageForIndex(idx, size: size, color: .blackColor())
        self.init(image: image, style: .Plain, target: target, action: action)
    }
}

extension UITabBarItem {
    
    internal convenience init(idx: Int, size: CGFloat, title: String?, tag: Int) {
        
        let image = Iconic.imageForIndex(idx, size: size, color: .blackColor())
        self.init(title: title, image: image, tag: tag)
    }
}

extension UIButton {
    
    internal func setIconForIndex(idx: Int, size: CGFloat, forState state: UIControlState) {
        
        let image = Iconic.imageForIndex(idx, size: size, color: .blackColor())
        self.setImage(image, forState: state)
    }
}
