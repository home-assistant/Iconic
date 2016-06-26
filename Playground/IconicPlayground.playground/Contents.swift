//: Playground - noun: a place where people can play
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

import UIKit
import Iconic

var str = "Hello, playground"

Iconic.registerFontAwesomeIcon()

let unicode = Iconic.unicodeStringForFontAwesomeIcon(.Bolt)

let font = Iconic.fontAwesomeIconFontOfSize(20)

let string = Iconic.attributedStringForFontAwesomeIcon(.Bolt, size: 20, color: .whiteColor())

let image = Iconic.imageForFontAwesomeIcon(.Bolt, size: 20, color: .whiteColor())
