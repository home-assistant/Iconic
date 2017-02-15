
import UIKit
import Iconic

public protocol IconProviderDelegate: NSObjectProtocol {
    
    func numberOfIcons() -> Int
    func iconImage(forRow row: Int, size: CGSize, color: UIColor) -> UIImage?
}

// Abstraction for simplifying the integration with ther icon fonts easily)
public class IconProvider: NSObject {
    
    public override init() {
        super.init()
        // First, register Font Awesome icons with Iconic
        FontAwesomeIcon.register()
    }
}

extension IconProvider: IconProviderDelegate {
    
    public func numberOfIcons() -> Int {
        return FontAwesomeIcon.count
    }
    
    public func iconImage(forRow row: Int, size: CGSize, color: UIColor) -> UIImage? {
        
        let icon = FontAwesomeIcon(rawValue: row)
        return icon?.image(ofSize: size, color: color)
    }
}
