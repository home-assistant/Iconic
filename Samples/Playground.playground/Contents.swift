//: Playground - noun: a place where people can play
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

import Iconic

print(IconicVersionNumber)

// Registering the icon font
Iconic.registerFontAwesomeIcon()


// Icon font object
let font:UIFont = Iconic.fontAwesomeIconFontOfSize(23)!

// Icon as unicode
let unicode = Iconic.unicodeStringForFontAwesomeIcon(.Bolt)
let edgeInsets = UIEdgeInsetsMake(0, 5, 0, 20)

let iconAttributes = [NSFontAttributeName: font,
                      NSForegroundColorAttributeName: UIColor.orangeColor(),
                      NSBaselineOffsetAttributeName: edgeInsets.bottom-edgeInsets.top]

let iconString = " " + unicode! + " "

// Icon as text
let iconAttrString = NSAttributedString(string: iconString, attributes: iconAttributes).mutableCopy()

print(iconAttrString.length as Int)

// Sets left and right margins
iconAttrString.setAttributes([NSKernAttributeName: edgeInsets.left], range: NSMakeRange(0, 1))
iconAttrString.setAttributes([NSKernAttributeName: edgeInsets.right], range: NSMakeRange(2, 1))

let titleAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(25),
                       NSForegroundColorAttributeName: UIColor.redColor()]

let titleAttrString = NSAttributedString(string: NSStringFromFontAwesomeIcon(.Bolt), attributes: titleAttributes)

let attributedText = NSMutableAttributedString()
attributedText.appendAttributedString(iconAttrString as! NSAttributedString)
attributedText.appendAttributedString(titleAttrString)
