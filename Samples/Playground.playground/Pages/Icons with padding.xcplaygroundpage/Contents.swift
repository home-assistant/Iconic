import PlaygroundSupport
import Foundation
import Iconic

/**
 This playground was initially created for prototyping a new feature: adding the ability to output an icon attributed string with vertical and horizontal padding, either for text or image usage.
 
 Iconic provides 2 APIs to allow padding:
 
 -attributedStringOfSize:color:edgeInsets:
 -imageOfSize:color:edgeInsets:
 
 Both of these APIs may help you reduce a lot of code. Compare its use with plain and old TextKit's.
 */

// First of all, we must registering the icon font
FontAwesomeIcon.register()

// Variables
let icon = FontAwesomeIcon.githubIcon
let size: CGFloat = 30
let color = UIColor(red: 0.1, green: 0.8, blue: 0.9, alpha: 1)
let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)

let titleAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 32),
                       NSForegroundColorAttributeName: color]

let titleAttrString = NSAttributedString(string: icon.name.capitalized,
                                         attributes: titleAttributes)

// Attributed String constructed with Iconic's API
// Notice how simple it is to insert an icon to an existing attributed string tile
let iconicAttrString = titleAttrString.insertIconic(icon: icon, size: size, color: color, edgeInsets: edgeInsets)

// Attributed string constructed with plain Text Kit APIs
// Much more verbose, same result.
let textKitAttrString = titleAttrString.insertTextKit(icon: icon, size: size, color: color, edgeInsets: edgeInsets)

// Convenience APIs
extension NSAttributedString {
    
    // Inserts an icon at the first begining of an attributed string, with size, color and padding
    // Uses Iconic's attributedStringOfSize:color:edgeInsets: method simplifying a lot of logic
    // Underneath, its implementation is very similar to the method above.
    func insertIconic(icon: FontAwesomeIcon, size: CGFloat, color: UIColor, edgeInsets: UIEdgeInsets) -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString()
        
        let aString = icon.attributedString(ofSize: size, color: color, edgeInsets: edgeInsets)
        
        attributedText.append(aString)
        attributedText.append(titleAttrString)
        
        return attributedText
    }
    
    // Inserts an icon at the first begining of an attributed string, with size, color and padding
    // Uses plain TextKit APIs to do so, by inserting the unicode value of the icon and styling its range.
    func insertTextKit(icon: FontAwesomeIcon, size: CGFloat, color: UIColor, edgeInsets: UIEdgeInsets) -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString()
        
        // Still uses Iconic's to get the icon font and the icon's unicode value
        let font: UIFont = FontAwesomeIcon.font(ofSize: size)
        let unicode = icon.unicode

        let iconAttributes = [NSFontAttributeName: font,
                              NSForegroundColorAttributeName: color,
                              NSBaselineOffsetAttributeName: edgeInsets.bottom-edgeInsets.top] as [String : Any]
        
        let iconString = " " + unicode + " "
        
        // Icon as text
        var aString = NSAttributedString(string: iconString, attributes: iconAttributes)
        var mString = NSMutableAttributedString(attributedString: aString)
        
        print(mString.length as Int)
        
        // Sets left and right margins
        mString.setAttributes([NSKernAttributeName: edgeInsets.left], range: NSRange(location: 0, length: 1))
        mString.setAttributes([NSKernAttributeName: edgeInsets.right], range: NSRange(location: 2, length: 1))
        
        attributedText.append(mString)
        attributedText.append(titleAttrString)

        return attributedText
    }
}
