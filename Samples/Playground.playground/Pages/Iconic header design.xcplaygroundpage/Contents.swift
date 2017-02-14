
import Iconic
import PlaygroundSupport

// MARK: - Font Registration

// First, register Font Awesome icons with Iconic
FontAwesomeIcon.register()


// MARK: - Configuration

let frame = CGRect(x: 0, y: 0, width: 1776, height: 420)

let foregroundColor = UIColor(withHex: "a2e2fb", alpha: 1)
let backgroundColor = UIColor(withHex: "1dbaf7", alpha: 1)
let textColor = UIColor.white

let titleFont = UIFont.boldSystemFont(ofSize: 150)
let subtitleFont = UIFont.systemFont(ofSize: 50)

let title = "iconic"
let subtitle = "Render vector icons, natively."

let config = IconicHeaderConfig(columns: 32,
                                spacing: 34,
                                angle: 0,
                                foregroundColor: foregroundColor,
                                backgroundColor: backgroundColor,
                                titleColor: textColor,
                                subtitleColor: textColor,
                                titleFont: titleFont,
                                subtitleFont: subtitleFont,
                                title: title,
                                subtitle: subtitle)

let view = IconicHeaderView(frame: frame, config: config)
let rect = view.frame

// MARK: - Display

// To see the render, open the Assisstant Editor
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = view
