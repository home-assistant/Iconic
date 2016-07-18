//
//  IconFont.swift
//
//  Created by Vanessa Sun on 7/18/16.
//
//
// Protocol for all generated IconFonts

import Foundation

//private var iconFonts = [String: IconFont.Type]()

public protocol IconFont {
    var name: String { get }
    var unicode: String { get }
    static var familyName: String { get }
    static var count: Int { get }
    
    /**
     return the individual icon as an image based on given size and color.
     
     - parameter size: size of the image
     - parameter color: color of the image
     
     - returns: an UIImage
     */
    func image(size size:CGSize, color:UIColor?, edgeInsets: UIEdgeInsets? ) -> UIImage
    
    /**
     return the individual icon as an attributedString with the given pointSize and color. If the font hasn't been registered, it will throw exception
     
     - parameter pointSize: desired size of the font
     - parameter color:     desired color for the font
     
     - returns: a NSAttributedString
     */
    func attributedString(pointSize pointSize:CGFloat, color:UIColor?, edgeInsets: UIEdgeInsets?) -> NSAttributedString
    
    /**
     return the registered UIFont
     
     - parameter pointSize: a desired font size
     
     - returns: return the registered UIFont; nil is returned for unregistered font
     */
    static func iconFont(pointSize pointSize: CGFloat) -> UIFont?
    static func register()
}

extension IconFont {
    
    public static func iconFont(pointSize pointSize: CGFloat) -> UIFont? {
        return UIFont(name: familyName, size: pointSize)
    }
    public static func register() {
        
        let extensions = ["otf", "ttf"]
        let bundle = NSBundle(forClass: Iconic.self)
        
        guard let url = (extensions.flatMap { bundle.URLForResource(familyName, withExtension: $0) }).first else {
            assertionFailure("font :\(self.familyName) not found in bundle:\(bundle)")
            return
        }
        
        let descriptors = CTFontManagerCreateFontDescriptorsFromURL(url) as NSArray?
        
        guard let descriptor = (descriptors as? [CTFontDescriptorRef])?.first else {
            assertionFailure("Could not retrieve font descriptors of font at path \(url).")
            return
        }
        
        let font = CTFontCreateWithFontDescriptorAndOptions(descriptor, 0.0, nil, [.PreventAutoActivation])
        let fontName = CTFontCopyPostScriptName(font) as String
        var error: Unmanaged<CFErrorRef>? = nil
        
        // Registers font dynamically
        if CTFontManagerRegisterFontsForURL(url, .None, &error) != true || error != nil {
            assertionFailure("Failed registering font with the postscript name '\(fontName)' at path \(url) with error: \(error).")
        }
        
        print("font '\(self.familyName)' registered")
        
    }
    
    public func image(size size:CGSize, color:UIColor?, edgeInsets: UIEdgeInsets? = nil) -> UIImage {
        let mString = NSMutableAttributedString(attributedString: attributedString(pointSize: min(size.width, size.height), color: color))
        
        let insets = edgeInsets ?? UIEdgeInsetsZero
        let rect = UIEdgeInsetsInsetRect(CGRect(origin:CGPointZero, size:size), insets)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        
        mString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, mString.length))
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        mString.drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    public func attributedString(
        pointSize pointSize:CGFloat,
                  color:UIColor? = nil,
                  edgeInsets: UIEdgeInsets? = nil) -> NSAttributedString {
        
        let font = self.dynamicType.iconFont(pointSize: pointSize)!
        
        var attributes = [String : AnyObject]()
        attributes[NSFontAttributeName] = font
        
        if let color = color {
            attributes[NSForegroundColorAttributeName] = color
        }
        
        var leftSpace: NSAttributedString?
        var rightSpace: NSAttributedString?
        
        if let insets = edgeInsets {
            attributes[NSBaselineOffsetAttributeName] = insets.bottom - insets.top
            
            leftSpace = NSAttributedString(string: " ", attributes: [NSKernAttributeName: insets.left])
            rightSpace = NSAttributedString(string: " ", attributes: [NSKernAttributeName: insets.right])
            
        }
        let mString = NSMutableAttributedString(string: unicode, attributes: attributes)
        
        if let left = leftSpace, right = rightSpace {
            mString.insertAttributedString(right, atIndex: mString.length)
            mString.insertAttributedString(left, atIndex: 0)
        }
        return mString
    }
}


