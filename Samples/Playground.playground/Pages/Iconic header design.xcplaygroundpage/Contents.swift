import PlaygroundSupport
import Foundation
import UIKit
import Iconic

// MARK: - Font Registration

// First, register Font Awesome icons with Iconic
FontAwesomeIcon.register()

let openSansBold = "OpenSans-Bold"
let openSansSemibold = "OpenSans-Semibold"

// Register OpenSans font for the titles
let fontNames = [openSansBold, openSansSemibold].flatMap {
    let url = Bundle.main.url(forResource: $0, withExtension: "ttf") as CFURL!
    CTFontManagerRegisterFontsForURL(url!, .none, nil)
}

// MARK: - Configuration

let frame = CGRect(x: 0, y: 0, width: 1800, height: 350)

let config = IconicHeaderConfig(columns: 36,
                                angle: -12.0,
                                foregroundColor: UIColor(red: 90/255, green: 236/255, blue: 189/255, alpha: 1),
                                backgroundColor: UIColor(red: 81/255, green: 212/255, blue: 170/255, alpha: 1),
                                titleColor: .white,
                                subtitleColor: .white,
                                titleFont: UIFont(name: openSansBold, size: 150)!,
                                subtitleFont: UIFont(name: openSansSemibold, size: 50)!,
                                title: String(describing: Iconic.self),
                                subtitle: "Render vector icons, natively.")

let view = IconicHeaderView(frame: frame, config: config)

// MARK: - Display

// Shows the render in the Assisstant Editor
PlaygroundPage.current.liveView = view
