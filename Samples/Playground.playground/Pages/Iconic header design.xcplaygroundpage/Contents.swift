import PlaygroundSupport
import Foundation
import UIKit
import Iconic

// MARK: - Font Registration

// First, register Font Awesome icons with Iconic
FontAwesomeIcon.register()


// MARK: - Configuration

let frame = CGRect(x: 0, y: 0, width: 1900, height: 350)

let foregroundColor = UIColor(withHex: "388988", alpha: 0.5)
let backgroundColor = UIColor(withHex: "217c7a", alpha: 1)
let textColor = UIColor.white

let title = String(describing: Iconic.self)
let subtitle = "Render vector icons, natively."

let config = IconicHeaderConfig(columns: 36,
                                angle: -12.0,
                                foregroundColor: foregroundColor, alpha: 0.5),
                                backgroundColor: backgroundColor,
                                titleColor: textColor,
                                subtitleColor: textColor,
                                titleFont: .boldSystemFont(ofSize: 150),
                                subtitleFont: .systemFont(ofSize: 50),
                                title: title,
                                subtitle: subtitle

let view = IconicHeaderView(frame: frame, config: config)

// MARK: - Display

// Shows the render in the Assisstant Editor
PlaygroundPage.current.liveView = view
