
import PlaygroundSupport
import Foundation
import UIKit

import Iconic


// MARK: - Font Registration

// First, register Font Awesome icons with Iconic
FontAwesomeIcon.register()

// Register OpenSans font for the titles
let fontNames = ["OpenSans-Bold", "OpenSans-Regular", "OpenSans-Semibold"].flatMap {
    let url = Bundle.main.url(forResource: $0, withExtension: "ttf") as CFURL!
    CTFontManagerRegisterFontsForURL(url!, .none, nil)
}


// MARK: - Configuration

let frame = CGRect(x: 0, y: 0, width: 1777, height: 350)

let c = IconicHeaderConfig(columns: 36,
                           angle: CGFloat(-12*(M_PI/180)),
                           foregroundColor: UIColor(red: 90/255, green: 236/255, blue: 189/255, alpha: 1),
                           backgroundColor: UIColor(red: 81/255, green: 212/255, blue: 170/255, alpha: 1),
                           titleColor: .white,
                           subtitleColor: .white,
                           titleFont: UIFont.boldSystemFont(ofSize: 150),
                           subtitleFont: UIFont(name: "OpenSans-Semibold", size: 50)!,
                           title: String(describing: Iconic.self),
                           subtitle: "Render vector icons, natively.")


let view = IconicHeaderView(frame: frame, config: c)


// MARK: - Display

// Shows the render in the Assisstant Editor
PlaygroundPage.current.liveView = view

