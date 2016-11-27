//: Playground - noun: a place where people can play
import XCPlayground
import Foundation
import Iconic

print(IconicVersionNumber)

// Registering the icon font
FontAwesomeIcon.register()

// Global variables
let icon = FontAwesomeIcon.Dribble
let iconSize: CGFloat = 23
let edgeInsets = UIEdgeInsets(top: 0, right: 0, bottom: 0, left: 15)
let color = UIColor.orangeColor()
var attributedText = NSMutableAttributedString()

//////////////////////////////
// USING TEXT KIT APIs

// Icon as unicode
let unicode = icon.unicode
let font: UIFont = FontAwesomeIcon.font(ofSize: iconSize)

let iconAttributes = [NSFontAttributeName: font,
                      NSForegroundColorAttributeName: color,
                      NSBaselineOffsetAttributeName: edgeInsets.bottom-edgeInsets.top]

let iconString = " " + unicode + " "

// Icon as text
var aString = NSAttributedString(string: iconString, attributes: iconAttributes)
var mString = NSMutableAttributedString(attributedString: aString)
    
print(mString.length as Int)

// Sets left and right margins
mString.setAttributes([NSKernAttributeName: edgeInsets.left], range: NSRange(location: 0, length: 1))
mString.setAttributes([NSKernAttributeName: edgeInsets.right], range: NSRange(location: 2, length: 1))

let titleAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 25),
                       NSForegroundColorAttributeName: color]

let titleAttrString = NSAttributedString(string: icon.name, attributes: titleAttributes)

attributedText.appendAttributedString(mString)
attributedText.appendAttributedString(titleAttrString)

//////////////////////////////
// USING ICONIC APIs

attributedText = NSMutableAttributedString()
aString = icon.attributedString(ofSize: iconSize, color: color, edgeInsets: edgeInsets)

attributedText.appendAttributedString(aString)
attributedText.appendAttributedString(titleAttrString)
