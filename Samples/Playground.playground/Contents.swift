//: Playground - noun: a place where people can play
import XCPlayground
import Iconic

print(IconicVersionNumber)

// Registering the icon font
Iconic.registerIconFont()


// Global variables
let icon = Icon.Dribble
let iconSize:CGFloat = 23
let edgeInsets = UIEdgeInsetsMake(0, 0, 0, 10)
let color = UIColor.orangeColor()

//////////////////////////////
// USING TEXT KIT APIs

// Icon as unicode
let unicode = Iconic.unicodeString(forIcon: icon)
let font:UIFont = Iconic.iconFont(ofSize: iconSize)!

let iconAttributes = [NSFontAttributeName: font,
                      NSForegroundColorAttributeName: color,
                      NSBaselineOffsetAttributeName: edgeInsets.bottom-edgeInsets.top]

let iconString = " " + unicode! + " "

// Icon as text
var iconAttrString = NSAttributedString(string: iconString, attributes: iconAttributes).mutableCopy()

print(iconAttrString.length as Int)

// Sets left and right margins
iconAttrString.setAttributes([NSKernAttributeName: edgeInsets.left], range: NSMakeRange(0, 1))
iconAttrString.setAttributes([NSKernAttributeName: edgeInsets.right], range: NSMakeRange(2, 1))

let titleAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(25),
                       NSForegroundColorAttributeName: color]

let titleAttrString = NSAttributedString(string: NSStringFromIcon(icon), attributes: titleAttributes)

var attributedText = NSMutableAttributedString()
attributedText.appendAttributedString(iconAttrString as! NSAttributedString)
attributedText.appendAttributedString(titleAttrString)


//////////////////////////////
// USING ICONIC APIs

attributedText = NSMutableAttributedString()
iconAttrString = Iconic.attributedString(forIcon: icon, size: 23, color: color, edgeInsets: edgeInsets)!

attributedText.appendAttributedString(iconAttrString as! NSAttributedString)
attributedText.appendAttributedString(titleAttrString)

