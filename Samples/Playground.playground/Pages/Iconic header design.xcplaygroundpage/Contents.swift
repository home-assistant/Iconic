import PlaygroundSupport
import Foundation
import UIKit
import Iconic

// MARK: - Font Registration

// First, register Font Awesome icons with Iconic
FontAwesomeIcon.register()


// MARK: - Configuration

let frame = CGRect(x: 0, y: 0, width: 1900, height: 350)

let config = IconicHeaderConfig(columns: 36,
                                angle: -12.0,
                                foregroundColor: UIColor(red: 241/255, green: 110/255, blue: 85/255, alpha: 0.8),
                                backgroundColor: UIColor(red: 216/255, green: 98/255, blue: 77/255, alpha: 1),
                                titleColor: .white,
                                subtitleColor: .white,
                                titleFont: .monospacedDigitSystemFont(ofSize: 130, weight: 0.2),
                                subtitleFont: .systemFont(ofSize: 50),
                                title: String(describing: Iconic.self),
                                subtitle: "Render vector icons, natively.")

let view = IconicHeaderView(frame: frame, config: config)

// MARK: - Display

// Shows the render in the Assisstant Editor
PlaygroundPage.current.liveView = view
