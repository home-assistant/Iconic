
import UIKit
import Iconic

public protocol IconImportable: NSObjectProtocol {
    
    func numberOfIcons() -> Int
    func iconImage(forRow row: Int, size: CGSize, color: UIColor) -> UIImage?
}

// Abstraction for simplifying the integration with ther icon fonts easily)
public class IconImporter: NSObject {
    
    public override init() {
        super.init()
        // First, register Font Awesome icons with Iconic
        FontAwesomeIcon.register()
    }
}

extension IconImporter: IconImportable {
    
    public func numberOfIcons() -> Int {
        return FontAwesomeIcon.count
    }
    
    public func iconImage(forRow row: Int, size: CGSize, color: UIColor) -> UIImage? {
        
        let icon = FontAwesomeIcon(rawValue: row)
        return icon?.image(ofSize: size, color: color)
    }
}
