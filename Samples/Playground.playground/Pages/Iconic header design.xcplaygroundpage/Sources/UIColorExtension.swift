import Foundation
import UIKit

public extension UIColor {
    
    public convenience init(withHex hex:String) {
        
        self.init(withHex: hex, alpha: 1.0)
    }
    
    public convenience init(withHex hex:String, alpha: CGFloat) {
        
        let hexString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
