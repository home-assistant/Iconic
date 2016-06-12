# Iconic

[![Travis](https://travis-ci.org/dzenbot/Iconic.svg?branch=master)](https://travis-ci.org/dzenbot/Iconic/builds)
[![Pod Version](http://img.shields.io/cocoapods/v/Iconic.svg)](http://cocoadocs.org/docsets/Iconic/)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)

<p align="center">
  <img src="https://raw.githubusercontent.com/dzenbot/Iconic/master/Screenshots/screenshot_scale.gif?token=AAkC8wQ5PZiIbv2IXuEaT9ZvJIckh6pAks5XZgabwA%3D%3D" alt="Scale Example"/>
</p>

Iconic will help you make icon fonts integration on iOS easy and effortless. Its main component is in charge of auto-generating strongly typed code in Swift, fully compatible with Objective-C, allowing you integrate vector icons as image or text in your app. **Think about the power of rendering vectors, natively!**

You will interact with an auto-generated class under the name of `{FontName}Icon.swift`, which is a light abstraction of Iconic class. For more information, have a look at [how to install](#installation) and [how to use](#how-to-use).

Note: **This library hasn't yet been used in production. Consider it in beta!**


## Why Icon Fonts
Web developers have been using icon fonts for quite some time now. It's really, really great!

There are many advantages of using icon fonts on iOS:
- Automatically scaled for retina displays. No device fragmentation.
- Scale and tint easily, without loosing any quality.
- Simple to work with.
- Less image assets to export, import, bundle and cache.
- They can be used as text or be rendered as images.
- Can help improving visual consistency and UI accessibility.
- Fully backwards compatible, not tied to newer APIs.
- Reusable in other platforms.

_Great. Now, how do I create an icon font,_ you say?
- You can ask your nearest friendly designer! Making an icon font isn't that hard, specially if you already have the assets.
- There are many [open sourced icon fonts](http://fontello.com/) out there (most are available under the [SIL Open Font License](http://scripts.sil.org/OFL)). They are designed for the web but they are still very useful for iOS.
- You can [read this article](http://rafaltomal.com/how-to-create-and-use-your-own-icon-fonts/) and give [fontastic.me](http://fontastic.me/) a shot.
- Check out the [icon fonts available in this repo](./Playground/Fonts), if you want to tests things.


## Key Features
- [Very easy to install with CocoaPods](#installation).
- Compatible with Swift and Objective-C.
- Supports TTF and OTF font files.
- Auto-generates enums and unicodes mapping, out of the font's [PUA range](https://en.wikipedia.org/wiki/Private_Use_Areas).
- `NSAttributedString` and `UIImage` outputs.
- Fonts are registered dynamically, effortless. No need to import the file to your project.
- [UIKit extensions](#uikit-extensions) (`UIBarButtonItem` and `UITabBarItem`).
- Auto-generated [icon font html catalog](#icon-font-catalog).
- iOS 8 and or later.

Note: Some open sourced icon fonts don't include the names of each of their glyphs. This could result in a non-descriptive enum, which can make things less intuitive for you when using Iconic. If you create your own icon font, make sure to properly name each glyph.

## Missing Features in Beta
- [ ] Allow rectangular icon glyphs (right now, the lib assumes they're all square sized).
- [ ] Provide OSS icon fonts with fully named glyphs for better usability.

## Installation

#### Via CocoaPods
```ruby
FONT_PATH='path_to_your_icon_font.ttf' pod install Iconic
```
When using the `FONT_PATH` environment variable, it will install Iconic with your icon font and auto-generate all files with its name.

You should then see a similar setup like this:
![Pod Setup](Screenshots/screenshot_pod_setup.png)

```ruby
pod install Iconic
```
Will install Iconic with its default font, [FontAwesome](https://github.com/FortAwesome/Font-Awesome).


### Under the hood
When installing Iconic, several things are happening under the hood:
- After the Iconic repo is cloned, a custom version of [SwiftGen](https://github.com/DZNLabs/SwiftGen) is downloaded along with its dependencies.
- Before pods are installed, `SwiftGen` is compiled
- [Iconizer](Source/Iconizer/Iconizer.sh) is ran, executing `SwiftGen` using a [custom stencil for Iconic](Source/Iconizer/iconic-default.stencil).
- `SwiftGen` does its magic, detecting all unicodes from the [PUA range](https://en.wikipedia.org/wiki/Private_Use_Areas) of the provided font file, extracting their unicode values as well as their glyph names. All this data is then used for auto-generating a Switft class of name `{FontName}Icon.swift`; a json file is also exported afterwards.
- Once everything is exported, an [HTML icon font catalog](#icon-font-catalog) is also created.  

There is a known bug where sometimes, calling `pod install Iconic` would not run correctly SwiftGen an retrieve all the icon unicode from a font. If this happens to you, make sure to call `pod update Iconic` to retrigger SwiftGen.


## How to use
For complete documentation, visit [CocoaPods' auto-generated docs](http://cocoadocs.org/docsets/Iconic/).

### Import
In Objective-C, you will need to import the Iconic module:
```objc
@import Iconic;
```

### Registering the icon font
Registration is required to activate Iconic. You shall do this once, when launching your application. Internally, the icon mapping is retrieved and kept in memory during the application's life term.

Iconic provides a convenient way to register the icon font:
Note: the method name may change depending of your icon font's name:
```swift
Iconic.registerFontAwesomeIcon()
```

You can also register the font with its family name and unicode mapping:
```swift
Iconic.registerFont("FontAwesome", map: FontAwesomeIconMap)
```

### Use as images
You can construct an `UIImage` instance out of a font's icon and tint it. This may be very convenient for integrating with existing UIKit controls which expect `UIImage` objects already.
```swift
let image = Iconic.imageForFontAwesomeIcon(.CaretRight, size: 16, color: self.view.tintColor)
let imageView = UIImageView(image: image)
```

Images are created using NSStringDraw APIs to render a `UIImage` out of an `NSAttributedString`.

### Use as attributed strings
You may need to icons as text too, to simplify your layout work.
For example, instead of having an image and a label, you can combined it all in one single label:
```swift
let iconString = Iconic.attributedStringForFontAwesomeIcon(.Home, size: 20, color: .orangeColor())

let attributes = [NSForegroundColorAttributeName: UIColor.orangeColor(),
                  NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]

let labelString = NSMutableAttributedString(string: "  Home", attributes: attributes)
labelString.insertAttributedString(iconString!, atIndex: 0)

let label = UILabel()
label.attributedText = labelString
label.sizeToFit()
```

### Use as unicode string
Ultimately, you may need to retrieve the unicode string representation on an icon to do more advanced things:
```swift
let unicode = Iconic.unicodeStringForFontAwesomeIcon(.Apple)
```

### Use its font object
For further customization, you may need to use the UIFont object instead:
```swift
let font = Iconic.fontAwesomeIconFontOfSize(20)
```


### UIKit Extensions
UIKit extensions are also included, just to make your code look simpler:
```swift
// UITarbBarItem
let tabItem = UITabBarItem(fontAwesomeIcon: .Book, size:20, title: "Book", tag: 0)

// UIBarButtonItem
let buttonItem = UIBarButtonItem(fontAwesomeIcon: .Book, size:20, target: self, action: #selector(didTapButton))

// UIButton
let button = UIButton(type: .System)
button.setFontAwesomeIcon(.Code, size: 20, forState: .Normal)
```


## Sample Project
Check out the sample project, everything is demo'd there.

![Sample Project](Screenshots/screenshot_sample_proj.png)


## Icon Font Catalog
Besides the auto-generated Swift code, you will notice a `catalog.html` file being added to your directory. This is your icon font catalog, to be used for visual reference about all the icons you have available.

![Icon Font Catalog](Screenshots/icon_font_catalog.png)

Note: if you are using Chrome as your default browser, you will need to restart it using the `open -a 'Google Chrome' --args -allow-file-access-from-files` in the command line to be able to open view the catalog. This is because the html's javascript loads a local json file and Chrome has built-in security features to disable it.


## Thanks to
- [Olivier Halligon](https://github.com/AliSoftware/) for building and sharing [SwiftGen](https://github.com/AliSoftware/SwiftGen). Such a great tool! 
- The [CocoaPods team](https://cocoapods.org/about) for always being so responsive and helpful.
- [Dave Gandy](https://twitter.com/davegandy) for making [FontAwesome](http://fontawesome.io/) so awesome.


## License
This library is licensed under the [MIT License](LICENSE).

SwiftGen is licensed under the [MIT License](https://github.com/AliSoftware/SwiftGen/blob/master/LICENSE).

The Font Awesome font is licensed under the [SIL Open Font License](http://scripts.sil.org/OFL)
