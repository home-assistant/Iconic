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
                                foregroundColor: UIColor(red: 237/255, green: 85/255, blue: 96/255, alpha: 0.5),
                                backgroundColor: UIColor(red: 217/255, green: 78/255, blue: 90/255, alpha: 1),
                                titleColor: .white,
                                subtitleColor: .white,
                                titleFont: .boldSystemFont(ofSize: 150),
                                subtitleFont: .systemFont(ofSize: 50),
                                title: String(describing: Iconic.self),
                                subtitle: "Render vector icons, natively.")

let view = IconicHeaderView(frame: frame, config: config)

// MARK: - Display

// Shows the render in the Assisstant Editor
PlaygroundPage.current.liveView = view
