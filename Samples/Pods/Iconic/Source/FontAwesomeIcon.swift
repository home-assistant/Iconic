// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit


/**
wrapper functions for objective-c compatibility
*/
public extension Iconic {

    /** returns the number of icons in the font */
    @objc class var fontAwesomeIconCount: Int{
        return FontAwesomeIcon.count
    }

    /**
    Registers the icon font to Iconic.
    You shall do this once, when launching your application. Internally, the icon mapping is retrieved and
    kept in memory during the application's life term.
    */
    @objc class func registerFontAwesomeIconFont() {
        FontAwesomeIcon.register()
    }

    /**
    Creates an attributed string with the specified icon enum type, with optional color.

    - parameter icon: The icon enum type.
    - parameter size: The size of the text, in points.
    - parameter color: Optional color to be applied to the icon.
    */
    @objc class func attributedString(withFontAwesomeIcon icon: FontAwesomeIcon,
        size: CGFloat,
        color: UIColor?) -> NSAttributedString? {
        return icon.attributedString(pointSize: size, color: color)
    }

    /**
    Creates an attributed string with the specified icon enum type, with optional color and alignment.
    The optional alinment can be really helpful when appending an icon to another attributed string with different fonts.
    It may also help for adjusting the icon's baseline, when using either top and bottom insets.

    - parameter icon: The icon enum type.
    - parameter size: The size of the text, in points.
    - parameter color: Optional color to be applied to the icon.
    - parameter edgeInsets: Optional edge insets to be used as horizontal and vertical margins.
    */
    @objc class func attributedString(
        withFontAwesomeIcon icon: FontAwesomeIcon,
        pointSize: CGFloat,
        color: UIColor?,
        edgeInsets: UIEdgeInsets) -> NSAttributedString? {
        return icon.attributedString(pointSize: pointSize,
            color: color,
            edgeInsets: edgeInsets)
    }

    /**
    Creates an image out of an attributed string with the specified icon enum type.

    - parameter icon: The icon enum type.
    - parameter size: The size of the image.
    - parameter color: Optional color to be applied to the icon.
    */
    @objc class func image(withFontAwesomeIcon icon: FontAwesomeIcon,
        size: CGSize,
        color: UIColor?) -> UIImage? {
        return icon.image(size: size, color: color)
    }

    /**
    Returns a string representation of an unicode for the specified icon enum type.

    - parameter icon: The icon enum type.
    - returns An unicode string representation.
    */
    @objc class func unicodeString(withFontAwesomeIcon icon: FontAwesomeIcon) -> String? {
        return icon.unicode
    }
}

public extension UIBarButtonItem {

    /**
    Initializes a new item using the specified icon enum type and other properties.

    - parameter icon: The icon enum type to be used as image.
    - parameter size: The size of the image, in points.
    - parameter color: The color of the image, default to black.
    - parameter target: The object that receives the action message.
    - parameter action: The action to send to target when this item is selected.
    */
    @objc convenience init(withFontAwesomeIcon icon: FontAwesomeIcon,
        size: CGSize,
        color: UIColor?,
        target: AnyObject?,
        action: Selector) {
        let image = icon.image(size: size, color: color ?? .blackColor())
        self.init(image: image, style: .Plain, target: target, action: action)
    }
}

public extension UITabBarItem {

    /**
    Initializes a new item using the specified icon enum type and other properties.

    - parameter icon: The icon enum type to be used as image.
    - parameter size: The size of the image.
    - parameter color: The color of the image, default is black
    - parameter title: The item's title. If nil, a title is not displayed.
    - parameter tag: The receiver's tag, an integer that you can use to identify bar item objects in your application.
    */
    @objc convenience init(withFontAwesomeIcon icon: FontAwesomeIcon,
        size: CGSize,
        color:UIColor?,
        title: String?,
        tag: Int) {
        let image = icon.image(size: size, color: color ?? .blackColor())
        self.init(title: title, image: image, tag: tag)
    }
}

public extension UIButton {

    /**
    Sets the icon to use for the specified state.

    - parameter icon: The icon enum type to be used as image.
    - parameter size: The size of the image.
    - parameter color: The color of the image.
    - parameter state: The state that uses the specified title. The values are described in UIControlState.
    */
    @objc func setIconImage(withFontAwesomeIcon icon: FontAwesomeIcon,
        size: CGSize,
        color:UIColor?,
        forState state: UIControlState) {
        let image = icon.image(size: size, color: color)
        setImage(image, forState: state)
    }
}


/**
A list with available glyphs detected from the icon font.
*/

@objc public enum FontAwesomeIcon: Int {
    case _279
    case _283
    case _303
    case _312
    case _317
    case _329
    case _334
    case _335
    case _366
    case _372
    case _374
    case _376
    case _378
    case _380
    case _382
    case _383
    case _384
    case _385
    case _386
    case _387
    case _388
    case _389
    case _392
    case _393
    case _395
    case _396
    case _397
    case _398
    case _399
    case _400
    case _402
    case _403
    case _404
    case _406
    case _407
    case _408
    case _409
    case _410
    case _411
    case _412
    case _413
    case _414
    case _415
    case _416
    case _417
    case _418
    case _419
    case _422
    case _423
    case _424
    case _425
    case _426
    case _427
    case _428
    case _429
    case _430
    case _431
    case _432
    case _433
    case _434
    case _438
    case _439
    case _443
    case _444
    case _445
    case _446
    case _447
    case _448
    case _449
    case _451
    case _452
    case _453
    case _454
    case _455
    case _456
    case _457
    case _458
    case _459
    case _460
    case _461
    case _462
    case _463
    case _464
    case _466
    case _467
    case _469
    case _470
    case _471
    case _472
    case _473
    case _474
    case _475
    case _476
    case _478
    case _479
    case _480
    case _481
    case _482
    case _483
    case _484
    case _485
    case _486
    case _487
    case _488
    case _489
    case _490
    case _491
    case _492
    case _493
    case _494
    case Adjust
    case Adn
    case AlignCenter
    case AlignJustify
    case AlignLeft
    case AlignRight
    case Ambulance
    case Anchor
    case Android
    case AngleDown
    case AngleLeft
    case AngleRight
    case AngleUp
    case Apple
    case Archive
    case ArrowCircleAltLeft
    case ArrowDown
    case ArrowLeft
    case ArrowRight
    case ArrowUp
    case Asterisk
    case Backward
    case BanCircle
    case BarChart
    case Barcode
    case Beaker
    case Beer
    case Bell
    case BellAlt
    case BitbucketSign
    case Bold
    case Bolt
    case Book
    case Bookmark
    case BookmarkEmpty
    case Briefcase
    case Btc
    case Bug
    case Building
    case Bullhorn
    case Bullseye
    case Calendar
    case CalendarEmpty
    case Camera
    case CameraRetro
    case CaretDown
    case CaretLeft
    case CaretRight
    case CaretUp
    case Certificate
    case Check
    case CheckEmpty
    case CheckMinus
    case CheckSign
    case ChevronDown
    case ChevronLeft
    case ChevronRight
    case ChevronSignDown
    case ChevronSignLeft
    case ChevronSignRight
    case ChevronSignUp
    case ChevronUp
    case Circle
    case CircleArrowDown
    case CircleArrowLeft
    case CircleArrowRight
    case CircleArrowUp
    case CircleBlank
    case Cloud
    case CloudDownload
    case CloudUpload
    case Code
    case CodeFork
    case Coffee
    case Cog
    case Cogs
    case Collapse
    case CollapseAlt
    case CollapseTop
    case Columns
    case Comment
    case CommentAlt
    case Comments
    case CommentsAlt
    case Compass
    case Copy
    case CreditCard
    case Crop
    case Css3
    case Cut
    case Dashboard
    case Desktop
    case DotCircleAlt
    case DoubleAngleDown
    case DoubleAngleLeft
    case DoubleAngleRight
    case DoubleAngleUp
    case Download
    case DownloadAlt
    case Dribble
    case Dropbox
    case Edit
    case EditSign
    case Eject
    case EllipsisHorizontal
    case EllipsisVertical
    case Envelope
    case EnvelopeAlt
    case Eur
    case Exchange
    case Exclamation
    case ExclamationSign
    case ExpandAlt
    case ExternalLink
    case EyeClose
    case EyeOpen
    case F0fe
    case F171
    case F1a1
    case F1a4
    case F1ab
    case F1f3
    case F1fc
    case Facebook
    case FacebookSign
    case FacetimeVideo
    case FastBackward
    case FastForward
    case Female
    case FighterJet
    case File
    case FileAlt
    case FileText
    case FileTextAlt
    case Film
    case Filter
    case Fire
    case FireExtinguisher
    case Flag
    case FlagAlt
    case FlagCheckered
    case Flickr
    case FolderClose
    case FolderCloseAlt
    case FolderOpen
    case FolderOpenAlt
    case Font
    case Food
    case Forward
    case Foursquare
    case Frown
    case Fullscreen
    case Gamepad
    case Gbp
    case Gift
    case Github
    case GithubAlt
    case GithubSign
    case Gittip
    case Glass
    case Globe
    case GooglePlus
    case GooglePlusSign
    case Group
    case HSign
    case HandDown
    case HandLeft
    case HandRight
    case HandUp
    case Hdd
    case Headphones
    case Heart
    case HeartEmpty
    case Home
    case Hospital
    case Html5
    case Inbox
    case IndentLeft
    case IndentRight
    case InfoSign
    case Inr
    case Instagram
    case Italic
    case Jpy
    case Key
    case Keyboard
    case Krw
    case Laptop
    case Leaf
    case Legal
    case Lemon
    case Lessequal
    case LevelDown
    case LevelUp
    case LightBulb
    case Link
    case Linkedin
    case LinkedinSign
    case Linux
    case List
    case ListAlt
    case LocationArrow
    case Lock
    case LongArrowDown
    case LongArrowLeft
    case LongArrowRight
    case LongArrowUp
    case Magic
    case Magnet
    case Male
    case MapMarker
    case Maxcdn
    case Medkit
    case Meh
    case Microphone
    case MicrophoneOff
    case Minus
    case MinusSign
    case MinusSignAlt
    case MobilePhone
    case Money
    case Move
    case Music
    case Off
    case Ok
    case OkCircle
    case OkSign
    case Ol
    case PaperClip
    case Paste
    case Pause
    case Pencil
    case Phone
    case PhoneSign
    case Picture
    case Pinterest
    case PinterestSign
    case Plane
    case Play
    case PlayCircle
    case PlaySign
    case Plus
    case PlusSign
    case PlusSquareO
    case Print
    case Pushpin
    case PuzzlePiece
    case Qrcode
    case Question
    case QuestionSign
    case QuoteLeft
    case QuoteRight
    case Random
    case Refresh
    case Remove
    case RemoveCircle
    case RemoveSign
    case Renren
    case Reorder
    case Repeat
    case Reply
    case ReplyAll
    case ResizeFull
    case ResizeHorizontal
    case ResizeSmall
    case ResizeVertical
    case Retweet
    case Road
    case Rocket
    case Rss
    case Rub
    case Save
    case Screenshot
    case Search
    case Share
    case ShareAlt
    case ShareSign
    case Shield
    case ShoppingCart
    case SignBlank
    case Signal
    case Signin
    case Signout
    case Sitemap
    case Skype
    case Smile
    case Sort
    case SortByAlphabet
    case SortByAttributes
    case SortByAttributesAlt
    case SortByOrder
    case SortByOrderAlt
    case SortDown
    case SortUp
    case Spinner
    case StackExchange
    case Stackexchange
    case Star
    case StarEmpty
    case StarHalf
    case StarHalfEmpty
    case StepBackward
    case StepForward
    case Stethoscope
    case Stop
    case Strikethrough
    case Subscript
    case Suitcase
    case Sun
    case Superscript
    case Table
    case Tablet
    case Tag
    case Tags
    case Tasks
    case Terminal
    case TextHeight
    case TextWidth
    case Th
    case ThLarge
    case ThList
    case ThumbsDownAlt
    case ThumbsUpAlt
    case Ticket
    case Time
    case Tint
    case Trash
    case Trello
    case Trophy
    case Truck
    case Tumblr
    case TumblrSign
    case Twitter
    case TwitterSign
    case Ul
    case Umbrella
    case Underline
    case Undo
    case UniF1A0
    case UniF1B1
    case UniF1C0
    case UniF1C1
    case UniF1D0
    case UniF1D1
    case UniF1D2
    case UniF1D5
    case UniF1D6
    case UniF1D7
    case UniF1E0
    case UniF1F0
    case Unlink
    case Unlock
    case UnlockAlt
    case Upload
    case UploadAlt
    case Usd
    case User
    case UserMd
    case VimeoSquare
    case Vk
    case VolumeDown
    case VolumeOff
    case VolumeUp
    case WarningSign
    case Weibo
    case Windows
    case Wrench
    case Xing
    case XingSign
    case Youtube
    case YoutubePlay
    case YoutubeSign
    case ZoomIn
    case ZoomOut

    public static var count: Int { return 484 }
}

extension FontAwesomeIcon : IconFont {
    public var unicode:String {
        switch self {
        case ._279: return "\u{F129}"
        case ._283: return "\u{F12D}"
        case ._303: return "\u{F143}"
        case ._312: return "\u{F14C}"
        case ._317: return "\u{F152}"
        case ._329: return "\u{F15E}"
        case ._334: return "\u{F164}"
        case ._335: return "\u{F165}"
        case ._366: return "\u{F186}"
        case ._372: return "\u{F18C}"
        case ._374: return "\u{F18E}"
        case ._376: return "\u{F191}"
        case ._378: return "\u{F193}"
        case ._380: return "\u{F195}"
        case ._382: return "\u{F197}"
        case ._383: return "\u{F198}"
        case ._384: return "\u{F199}"
        case ._385: return "\u{F19A}"
        case ._386: return "\u{F19B}"
        case ._387: return "\u{F19C}"
        case ._388: return "\u{F19D}"
        case ._389: return "\u{F19E}"
        case ._392: return "\u{F1A2}"
        case ._393: return "\u{F1A3}"
        case ._395: return "\u{F1A5}"
        case ._396: return "\u{F1A6}"
        case ._397: return "\u{F1A7}"
        case ._398: return "\u{F1A8}"
        case ._399: return "\u{F1A9}"
        case ._400: return "\u{F1AA}"
        case ._402: return "\u{F1AC}"
        case ._403: return "\u{F1AD}"
        case ._404: return "\u{F1AE}"
        case ._406: return "\u{F1B1}"
        case ._407: return "\u{F1B2}"
        case ._408: return "\u{F1B3}"
        case ._409: return "\u{F1B4}"
        case ._410: return "\u{F1B5}"
        case ._411: return "\u{F1B6}"
        case ._412: return "\u{F1B7}"
        case ._413: return "\u{F1B8}"
        case ._414: return "\u{F1B9}"
        case ._415: return "\u{F1BA}"
        case ._416: return "\u{F1BB}"
        case ._417: return "\u{F1BC}"
        case ._418: return "\u{F1BD}"
        case ._419: return "\u{F1BE}"
        case ._422: return "\u{F1C2}"
        case ._423: return "\u{F1C3}"
        case ._424: return "\u{F1C4}"
        case ._425: return "\u{F1C5}"
        case ._426: return "\u{F1C6}"
        case ._427: return "\u{F1C7}"
        case ._428: return "\u{F1C8}"
        case ._429: return "\u{F1C9}"
        case ._430: return "\u{F1CA}"
        case ._431: return "\u{F1CB}"
        case ._432: return "\u{F1CC}"
        case ._433: return "\u{F1CD}"
        case ._434: return "\u{F1CE}"
        case ._438: return "\u{F1D3}"
        case ._439: return "\u{F1D4}"
        case ._443: return "\u{F1D8}"
        case ._444: return "\u{F1D9}"
        case ._445: return "\u{F1DA}"
        case ._446: return "\u{F1DB}"
        case ._447: return "\u{F1DC}"
        case ._448: return "\u{F1DD}"
        case ._449: return "\u{F1DE}"
        case ._451: return "\u{F1E1}"
        case ._452: return "\u{F1E2}"
        case ._453: return "\u{F1E3}"
        case ._454: return "\u{F1E4}"
        case ._455: return "\u{F1E5}"
        case ._456: return "\u{F1E6}"
        case ._457: return "\u{F1E7}"
        case ._458: return "\u{F1E8}"
        case ._459: return "\u{F1E9}"
        case ._460: return "\u{F1EA}"
        case ._461: return "\u{F1EB}"
        case ._462: return "\u{F1EC}"
        case ._463: return "\u{F1ED}"
        case ._464: return "\u{F1EE}"
        case ._466: return "\u{F1F1}"
        case ._467: return "\u{F1F2}"
        case ._469: return "\u{F1F4}"
        case ._470: return "\u{F1F5}"
        case ._471: return "\u{F1F6}"
        case ._472: return "\u{F1F7}"
        case ._473: return "\u{F1F8}"
        case ._474: return "\u{F1F9}"
        case ._475: return "\u{F1FA}"
        case ._476: return "\u{F1FB}"
        case ._478: return "\u{F1FD}"
        case ._479: return "\u{F1FE}"
        case ._480: return "\u{F200}"
        case ._481: return "\u{F201}"
        case ._482: return "\u{F202}"
        case ._483: return "\u{F203}"
        case ._484: return "\u{F204}"
        case ._485: return "\u{F205}"
        case ._486: return "\u{F206}"
        case ._487: return "\u{F207}"
        case ._488: return "\u{F208}"
        case ._489: return "\u{F209}"
        case ._490: return "\u{F20A}"
        case ._491: return "\u{F20B}"
        case ._492: return "\u{F20C}"
        case ._493: return "\u{F20D}"
        case ._494: return "\u{F20E}"
        case .Adjust: return "\u{F042}"
        case .Adn: return "\u{F170}"
        case .AlignCenter: return "\u{F037}"
        case .AlignJustify: return "\u{F039}"
        case .AlignLeft: return "\u{F036}"
        case .AlignRight: return "\u{F038}"
        case .Ambulance: return "\u{F0F9}"
        case .Anchor: return "\u{F13D}"
        case .Android: return "\u{F17B}"
        case .AngleDown: return "\u{F107}"
        case .AngleLeft: return "\u{F104}"
        case .AngleRight: return "\u{F105}"
        case .AngleUp: return "\u{F106}"
        case .Apple: return "\u{F179}"
        case .Archive: return "\u{F187}"
        case .ArrowCircleAltLeft: return "\u{F190}"
        case .ArrowDown: return "\u{F063}"
        case .ArrowLeft: return "\u{F060}"
        case .ArrowRight: return "\u{F061}"
        case .ArrowUp: return "\u{F062}"
        case .Asterisk: return "\u{F069}"
        case .Backward: return "\u{F04A}"
        case .BanCircle: return "\u{F05E}"
        case .BarChart: return "\u{F080}"
        case .Barcode: return "\u{F02A}"
        case .Beaker: return "\u{F0C3}"
        case .Beer: return "\u{F0FC}"
        case .Bell: return "\u{F0A2}"
        case .BellAlt: return "\u{F0F3}"
        case .BitbucketSign: return "\u{F172}"
        case .Bold: return "\u{F032}"
        case .Bolt: return "\u{F0E7}"
        case .Book: return "\u{F02D}"
        case .Bookmark: return "\u{F02E}"
        case .BookmarkEmpty: return "\u{F097}"
        case .Briefcase: return "\u{F0B1}"
        case .Btc: return "\u{F15A}"
        case .Bug: return "\u{F188}"
        case .Building: return "\u{F0F7}"
        case .Bullhorn: return "\u{F0A1}"
        case .Bullseye: return "\u{F140}"
        case .Calendar: return "\u{F073}"
        case .CalendarEmpty: return "\u{F133}"
        case .Camera: return "\u{F030}"
        case .CameraRetro: return "\u{F083}"
        case .CaretDown: return "\u{F0D7}"
        case .CaretLeft: return "\u{F0D9}"
        case .CaretRight: return "\u{F0DA}"
        case .CaretUp: return "\u{F0D8}"
        case .Certificate: return "\u{F0A3}"
        case .Check: return "\u{F046}"
        case .CheckEmpty: return "\u{F096}"
        case .CheckMinus: return "\u{F147}"
        case .CheckSign: return "\u{F14A}"
        case .ChevronDown: return "\u{F078}"
        case .ChevronLeft: return "\u{F053}"
        case .ChevronRight: return "\u{F054}"
        case .ChevronSignDown: return "\u{F13A}"
        case .ChevronSignLeft: return "\u{F137}"
        case .ChevronSignRight: return "\u{F138}"
        case .ChevronSignUp: return "\u{F139}"
        case .ChevronUp: return "\u{F077}"
        case .Circle: return "\u{F111}"
        case .CircleArrowDown: return "\u{F0AB}"
        case .CircleArrowLeft: return "\u{F0A8}"
        case .CircleArrowRight: return "\u{F0A9}"
        case .CircleArrowUp: return "\u{F0AA}"
        case .CircleBlank: return "\u{F10C}"
        case .Cloud: return "\u{F0C2}"
        case .CloudDownload: return "\u{F0ED}"
        case .CloudUpload: return "\u{F0EE}"
        case .Code: return "\u{F121}"
        case .CodeFork: return "\u{F126}"
        case .Coffee: return "\u{F0F4}"
        case .Cog: return "\u{F013}"
        case .Cogs: return "\u{F085}"
        case .Collapse: return "\u{F150}"
        case .CollapseAlt: return "\u{F117}"
        case .CollapseTop: return "\u{F151}"
        case .Columns: return "\u{F0DB}"
        case .Comment: return "\u{F075}"
        case .CommentAlt: return "\u{F0E5}"
        case .Comments: return "\u{F086}"
        case .CommentsAlt: return "\u{F0E6}"
        case .Compass: return "\u{F14E}"
        case .Copy: return "\u{F0C5}"
        case .CreditCard: return "\u{F09D}"
        case .Crop: return "\u{F125}"
        case .Css3: return "\u{F13C}"
        case .Cut: return "\u{F0C4}"
        case .Dashboard: return "\u{F0E4}"
        case .Desktop: return "\u{F108}"
        case .DotCircleAlt: return "\u{F192}"
        case .DoubleAngleDown: return "\u{F103}"
        case .DoubleAngleLeft: return "\u{F100}"
        case .DoubleAngleRight: return "\u{F101}"
        case .DoubleAngleUp: return "\u{F102}"
        case .Download: return "\u{F01A}"
        case .DownloadAlt: return "\u{F019}"
        case .Dribble: return "\u{F17D}"
        case .Dropbox: return "\u{F16B}"
        case .Edit: return "\u{F044}"
        case .EditSign: return "\u{F14B}"
        case .Eject: return "\u{F052}"
        case .EllipsisHorizontal: return "\u{F141}"
        case .EllipsisVertical: return "\u{F142}"
        case .Envelope: return "\u{F003}"
        case .EnvelopeAlt: return "\u{F0E0}"
        case .Eur: return "\u{F153}"
        case .Exchange: return "\u{F0EC}"
        case .Exclamation: return "\u{F12A}"
        case .ExclamationSign: return "\u{F06A}"
        case .ExpandAlt: return "\u{F116}"
        case .ExternalLink: return "\u{F08E}"
        case .EyeClose: return "\u{F070}"
        case .EyeOpen: return "\u{F06E}"
        case .F0fe: return "\u{F0FE}"
        case .F171: return "\u{F171}"
        case .F1a1: return "\u{F1A1}"
        case .F1a4: return "\u{F1A4}"
        case .F1ab: return "\u{F1AB}"
        case .F1f3: return "\u{F1F3}"
        case .F1fc: return "\u{F1FC}"
        case .Facebook: return "\u{F09A}"
        case .FacebookSign: return "\u{F082}"
        case .FacetimeVideo: return "\u{F03D}"
        case .FastBackward: return "\u{F049}"
        case .FastForward: return "\u{F050}"
        case .Female: return "\u{F182}"
        case .FighterJet: return "\u{F0FB}"
        case .File: return "\u{F15B}"
        case .FileAlt: return "\u{F016}"
        case .FileText: return "\u{F15C}"
        case .FileTextAlt: return "\u{F0F6}"
        case .Film: return "\u{F008}"
        case .Filter: return "\u{F0B0}"
        case .Fire: return "\u{F06D}"
        case .FireExtinguisher: return "\u{F134}"
        case .Flag: return "\u{F024}"
        case .FlagAlt: return "\u{F11D}"
        case .FlagCheckered: return "\u{F11E}"
        case .Flickr: return "\u{F16E}"
        case .FolderClose: return "\u{F07B}"
        case .FolderCloseAlt: return "\u{F114}"
        case .FolderOpen: return "\u{F07C}"
        case .FolderOpenAlt: return "\u{F115}"
        case .Font: return "\u{F031}"
        case .Food: return "\u{F0F5}"
        case .Forward: return "\u{F04E}"
        case .Foursquare: return "\u{F180}"
        case .Frown: return "\u{F119}"
        case .Fullscreen: return "\u{F0B2}"
        case .Gamepad: return "\u{F11B}"
        case .Gbp: return "\u{F154}"
        case .Gift: return "\u{F06B}"
        case .Github: return "\u{F09B}"
        case .GithubAlt: return "\u{F113}"
        case .GithubSign: return "\u{F092}"
        case .Gittip: return "\u{F184}"
        case .Glass: return "\u{F000}"
        case .Globe: return "\u{F0AC}"
        case .GooglePlus: return "\u{F0D5}"
        case .GooglePlusSign: return "\u{F0D4}"
        case .Group: return "\u{F0C0}"
        case .HSign: return "\u{F0FD}"
        case .HandDown: return "\u{F0A7}"
        case .HandLeft: return "\u{F0A5}"
        case .HandRight: return "\u{F0A4}"
        case .HandUp: return "\u{F0A6}"
        case .Hdd: return "\u{F0A0}"
        case .Headphones: return "\u{F025}"
        case .Heart: return "\u{F004}"
        case .HeartEmpty: return "\u{F08A}"
        case .Home: return "\u{F015}"
        case .Hospital: return "\u{F0F8}"
        case .Html5: return "\u{F13B}"
        case .Inbox: return "\u{F01C}"
        case .IndentLeft: return "\u{F03B}"
        case .IndentRight: return "\u{F03C}"
        case .InfoSign: return "\u{F05A}"
        case .Inr: return "\u{F156}"
        case .Instagram: return "\u{F16D}"
        case .Italic: return "\u{F033}"
        case .Jpy: return "\u{F157}"
        case .Key: return "\u{F084}"
        case .Keyboard: return "\u{F11C}"
        case .Krw: return "\u{F159}"
        case .Laptop: return "\u{F109}"
        case .Leaf: return "\u{F06C}"
        case .Legal: return "\u{F0E3}"
        case .Lemon: return "\u{F094}"
        case .Lessequal: return "\u{F210}"
        case .LevelDown: return "\u{F149}"
        case .LevelUp: return "\u{F148}"
        case .LightBulb: return "\u{F0EB}"
        case .Link: return "\u{F0C1}"
        case .Linkedin: return "\u{F0E1}"
        case .LinkedinSign: return "\u{F08C}"
        case .Linux: return "\u{F17C}"
        case .List: return "\u{F03A}"
        case .ListAlt: return "\u{F022}"
        case .LocationArrow: return "\u{F124}"
        case .Lock: return "\u{F023}"
        case .LongArrowDown: return "\u{F175}"
        case .LongArrowLeft: return "\u{F177}"
        case .LongArrowRight: return "\u{F178}"
        case .LongArrowUp: return "\u{F176}"
        case .Magic: return "\u{F0D0}"
        case .Magnet: return "\u{F076}"
        case .Male: return "\u{F183}"
        case .MapMarker: return "\u{F041}"
        case .Maxcdn: return "\u{F136}"
        case .Medkit: return "\u{F0FA}"
        case .Meh: return "\u{F11A}"
        case .Microphone: return "\u{F130}"
        case .MicrophoneOff: return "\u{F131}"
        case .Minus: return "\u{F068}"
        case .MinusSign: return "\u{F056}"
        case .MinusSignAlt: return "\u{F146}"
        case .MobilePhone: return "\u{F10B}"
        case .Money: return "\u{F0D6}"
        case .Move: return "\u{F047}"
        case .Music: return "\u{F001}"
        case .Off: return "\u{F011}"
        case .Ok: return "\u{F00C}"
        case .OkCircle: return "\u{F05D}"
        case .OkSign: return "\u{F058}"
        case .Ol: return "\u{F0CB}"
        case .PaperClip: return "\u{F0C6}"
        case .Paste: return "\u{F0EA}"
        case .Pause: return "\u{F04C}"
        case .Pencil: return "\u{F040}"
        case .Phone: return "\u{F095}"
        case .PhoneSign: return "\u{F098}"
        case .Picture: return "\u{F03E}"
        case .Pinterest: return "\u{F0D2}"
        case .PinterestSign: return "\u{F0D3}"
        case .Plane: return "\u{F072}"
        case .Play: return "\u{F04B}"
        case .PlayCircle: return "\u{F01D}"
        case .PlaySign: return "\u{F144}"
        case .Plus: return "\u{F067}"
        case .PlusSign: return "\u{F055}"
        case .PlusSquareO: return "\u{F196}"
        case .Print: return "\u{F02F}"
        case .Pushpin: return "\u{F08D}"
        case .PuzzlePiece: return "\u{F12E}"
        case .Qrcode: return "\u{F029}"
        case .Question: return "\u{F128}"
        case .QuestionSign: return "\u{F059}"
        case .QuoteLeft: return "\u{F10D}"
        case .QuoteRight: return "\u{F10E}"
        case .Random: return "\u{F074}"
        case .Refresh: return "\u{F021}"
        case .Remove: return "\u{F00D}"
        case .RemoveCircle: return "\u{F05C}"
        case .RemoveSign: return "\u{F057}"
        case .Renren: return "\u{F18B}"
        case .Reorder: return "\u{F0C9}"
        case .Repeat: return "\u{F01E}"
        case .Reply: return "\u{F112}"
        case .ReplyAll: return "\u{F122}"
        case .ResizeFull: return "\u{F065}"
        case .ResizeHorizontal: return "\u{F07E}"
        case .ResizeSmall: return "\u{F066}"
        case .ResizeVertical: return "\u{F07D}"
        case .Retweet: return "\u{F079}"
        case .Road: return "\u{F018}"
        case .Rocket: return "\u{F135}"
        case .Rss: return "\u{F09E}"
        case .Rub: return "\u{F158}"
        case .Save: return "\u{F0C7}"
        case .Screenshot: return "\u{F05B}"
        case .Search: return "\u{F002}"
        case .Share: return "\u{F045}"
        case .ShareAlt: return "\u{F064}"
        case .ShareSign: return "\u{F14D}"
        case .Shield: return "\u{F132}"
        case .ShoppingCart: return "\u{F07A}"
        case .SignBlank: return "\u{F0C8}"
        case .Signal: return "\u{F012}"
        case .Signin: return "\u{F090}"
        case .Signout: return "\u{F08B}"
        case .Sitemap: return "\u{F0E8}"
        case .Skype: return "\u{F17E}"
        case .Smile: return "\u{F118}"
        case .Sort: return "\u{F0DC}"
        case .SortByAlphabet: return "\u{F15D}"
        case .SortByAttributes: return "\u{F160}"
        case .SortByAttributesAlt: return "\u{F161}"
        case .SortByOrder: return "\u{F162}"
        case .SortByOrderAlt: return "\u{F163}"
        case .SortDown: return "\u{F0DD}"
        case .SortUp: return "\u{F0DE}"
        case .Spinner: return "\u{F110}"
        case .StackExchange: return "\u{F18D}"
        case .Stackexchange: return "\u{F16C}"
        case .Star: return "\u{F005}"
        case .StarEmpty: return "\u{F006}"
        case .StarHalf: return "\u{F089}"
        case .StarHalfEmpty: return "\u{F123}"
        case .StepBackward: return "\u{F048}"
        case .StepForward: return "\u{F051}"
        case .Stethoscope: return "\u{F0F1}"
        case .Stop: return "\u{F04D}"
        case .Strikethrough: return "\u{F0CC}"
        case .Subscript: return "\u{F12C}"
        case .Suitcase: return "\u{F0F2}"
        case .Sun: return "\u{F185}"
        case .Superscript: return "\u{F12B}"
        case .Table: return "\u{F0CE}"
        case .Tablet: return "\u{F10A}"
        case .Tag: return "\u{F02B}"
        case .Tags: return "\u{F02C}"
        case .Tasks: return "\u{F0AE}"
        case .Terminal: return "\u{F120}"
        case .TextHeight: return "\u{F034}"
        case .TextWidth: return "\u{F035}"
        case .Th: return "\u{F00A}"
        case .ThLarge: return "\u{F009}"
        case .ThList: return "\u{F00B}"
        case .ThumbsDownAlt: return "\u{F088}"
        case .ThumbsUpAlt: return "\u{F087}"
        case .Ticket: return "\u{F145}"
        case .Time: return "\u{F017}"
        case .Tint: return "\u{F043}"
        case .Trash: return "\u{F014}"
        case .Trello: return "\u{F181}"
        case .Trophy: return "\u{F091}"
        case .Truck: return "\u{F0D1}"
        case .Tumblr: return "\u{F173}"
        case .TumblrSign: return "\u{F174}"
        case .Twitter: return "\u{F099}"
        case .TwitterSign: return "\u{F081}"
        case .Ul: return "\u{F0CA}"
        case .Umbrella: return "\u{F0E9}"
        case .Underline: return "\u{F0CD}"
        case .Undo: return "\u{F0E2}"
        case .UniF1A0: return "\u{F1A0}"
        case .UniF1B1: return "\u{F1B0}"
        case .UniF1C0: return "\u{F1C0}"
        case .UniF1C1: return "\u{F1C1}"
        case .UniF1D0: return "\u{F1D0}"
        case .UniF1D1: return "\u{F1D1}"
        case .UniF1D2: return "\u{F1D2}"
        case .UniF1D5: return "\u{F1D5}"
        case .UniF1D6: return "\u{F1D6}"
        case .UniF1D7: return "\u{F1D7}"
        case .UniF1E0: return "\u{F1E0}"
        case .UniF1F0: return "\u{F1F0}"
        case .Unlink: return "\u{F127}"
        case .Unlock: return "\u{F09C}"
        case .UnlockAlt: return "\u{F13E}"
        case .Upload: return "\u{F01B}"
        case .UploadAlt: return "\u{F093}"
        case .Usd: return "\u{F155}"
        case .User: return "\u{F007}"
        case .UserMd: return "\u{F0F0}"
        case .VimeoSquare: return "\u{F194}"
        case .Vk: return "\u{F189}"
        case .VolumeDown: return "\u{F027}"
        case .VolumeOff: return "\u{F026}"
        case .VolumeUp: return "\u{F028}"
        case .WarningSign: return "\u{F071}"
        case .Weibo: return "\u{F18A}"
        case .Windows: return "\u{F17A}"
        case .Wrench: return "\u{F0AD}"
        case .Xing: return "\u{F168}"
        case .XingSign: return "\u{F169}"
        case .Youtube: return "\u{F167}"
        case .YoutubePlay: return "\u{F16A}"
        case .YoutubeSign: return "\u{F166}"
        case .ZoomIn: return "\u{F00E}"
        case .ZoomOut: return "\u{F010}"
        }
    }

    public var name: String {
        switch self {
        case ._279: return "_279"
        case ._283: return "_283"
        case ._303: return "_303"
        case ._312: return "_312"
        case ._317: return "_317"
        case ._329: return "_329"
        case ._334: return "_334"
        case ._335: return "_335"
        case ._366: return "_366"
        case ._372: return "_372"
        case ._374: return "_374"
        case ._376: return "_376"
        case ._378: return "_378"
        case ._380: return "_380"
        case ._382: return "_382"
        case ._383: return "_383"
        case ._384: return "_384"
        case ._385: return "_385"
        case ._386: return "_386"
        case ._387: return "_387"
        case ._388: return "_388"
        case ._389: return "_389"
        case ._392: return "_392"
        case ._393: return "_393"
        case ._395: return "_395"
        case ._396: return "_396"
        case ._397: return "_397"
        case ._398: return "_398"
        case ._399: return "_399"
        case ._400: return "_400"
        case ._402: return "_402"
        case ._403: return "_403"
        case ._404: return "_404"
        case ._406: return "_406"
        case ._407: return "_407"
        case ._408: return "_408"
        case ._409: return "_409"
        case ._410: return "_410"
        case ._411: return "_411"
        case ._412: return "_412"
        case ._413: return "_413"
        case ._414: return "_414"
        case ._415: return "_415"
        case ._416: return "_416"
        case ._417: return "_417"
        case ._418: return "_418"
        case ._419: return "_419"
        case ._422: return "_422"
        case ._423: return "_423"
        case ._424: return "_424"
        case ._425: return "_425"
        case ._426: return "_426"
        case ._427: return "_427"
        case ._428: return "_428"
        case ._429: return "_429"
        case ._430: return "_430"
        case ._431: return "_431"
        case ._432: return "_432"
        case ._433: return "_433"
        case ._434: return "_434"
        case ._438: return "_438"
        case ._439: return "_439"
        case ._443: return "_443"
        case ._444: return "_444"
        case ._445: return "_445"
        case ._446: return "_446"
        case ._447: return "_447"
        case ._448: return "_448"
        case ._449: return "_449"
        case ._451: return "_451"
        case ._452: return "_452"
        case ._453: return "_453"
        case ._454: return "_454"
        case ._455: return "_455"
        case ._456: return "_456"
        case ._457: return "_457"
        case ._458: return "_458"
        case ._459: return "_459"
        case ._460: return "_460"
        case ._461: return "_461"
        case ._462: return "_462"
        case ._463: return "_463"
        case ._464: return "_464"
        case ._466: return "_466"
        case ._467: return "_467"
        case ._469: return "_469"
        case ._470: return "_470"
        case ._471: return "_471"
        case ._472: return "_472"
        case ._473: return "_473"
        case ._474: return "_474"
        case ._475: return "_475"
        case ._476: return "_476"
        case ._478: return "_478"
        case ._479: return "_479"
        case ._480: return "_480"
        case ._481: return "_481"
        case ._482: return "_482"
        case ._483: return "_483"
        case ._484: return "_484"
        case ._485: return "_485"
        case ._486: return "_486"
        case ._487: return "_487"
        case ._488: return "_488"
        case ._489: return "_489"
        case ._490: return "_490"
        case ._491: return "_491"
        case ._492: return "_492"
        case ._493: return "_493"
        case ._494: return "_494"
        case .Adjust: return "Adjust"
        case .Adn: return "Adn"
        case .AlignCenter: return "AlignCenter"
        case .AlignJustify: return "AlignJustify"
        case .AlignLeft: return "AlignLeft"
        case .AlignRight: return "AlignRight"
        case .Ambulance: return "Ambulance"
        case .Anchor: return "Anchor"
        case .Android: return "Android"
        case .AngleDown: return "AngleDown"
        case .AngleLeft: return "AngleLeft"
        case .AngleRight: return "AngleRight"
        case .AngleUp: return "AngleUp"
        case .Apple: return "Apple"
        case .Archive: return "Archive"
        case .ArrowCircleAltLeft: return "ArrowCircleAltLeft"
        case .ArrowDown: return "ArrowDown"
        case .ArrowLeft: return "ArrowLeft"
        case .ArrowRight: return "ArrowRight"
        case .ArrowUp: return "ArrowUp"
        case .Asterisk: return "Asterisk"
        case .Backward: return "Backward"
        case .BanCircle: return "BanCircle"
        case .BarChart: return "BarChart"
        case .Barcode: return "Barcode"
        case .Beaker: return "Beaker"
        case .Beer: return "Beer"
        case .Bell: return "Bell"
        case .BellAlt: return "BellAlt"
        case .BitbucketSign: return "BitbucketSign"
        case .Bold: return "Bold"
        case .Bolt: return "Bolt"
        case .Book: return "Book"
        case .Bookmark: return "Bookmark"
        case .BookmarkEmpty: return "BookmarkEmpty"
        case .Briefcase: return "Briefcase"
        case .Btc: return "Btc"
        case .Bug: return "Bug"
        case .Building: return "Building"
        case .Bullhorn: return "Bullhorn"
        case .Bullseye: return "Bullseye"
        case .Calendar: return "Calendar"
        case .CalendarEmpty: return "CalendarEmpty"
        case .Camera: return "Camera"
        case .CameraRetro: return "CameraRetro"
        case .CaretDown: return "CaretDown"
        case .CaretLeft: return "CaretLeft"
        case .CaretRight: return "CaretRight"
        case .CaretUp: return "CaretUp"
        case .Certificate: return "Certificate"
        case .Check: return "Check"
        case .CheckEmpty: return "CheckEmpty"
        case .CheckMinus: return "CheckMinus"
        case .CheckSign: return "CheckSign"
        case .ChevronDown: return "ChevronDown"
        case .ChevronLeft: return "ChevronLeft"
        case .ChevronRight: return "ChevronRight"
        case .ChevronSignDown: return "ChevronSignDown"
        case .ChevronSignLeft: return "ChevronSignLeft"
        case .ChevronSignRight: return "ChevronSignRight"
        case .ChevronSignUp: return "ChevronSignUp"
        case .ChevronUp: return "ChevronUp"
        case .Circle: return "Circle"
        case .CircleArrowDown: return "CircleArrowDown"
        case .CircleArrowLeft: return "CircleArrowLeft"
        case .CircleArrowRight: return "CircleArrowRight"
        case .CircleArrowUp: return "CircleArrowUp"
        case .CircleBlank: return "CircleBlank"
        case .Cloud: return "Cloud"
        case .CloudDownload: return "CloudDownload"
        case .CloudUpload: return "CloudUpload"
        case .Code: return "Code"
        case .CodeFork: return "CodeFork"
        case .Coffee: return "Coffee"
        case .Cog: return "Cog"
        case .Cogs: return "Cogs"
        case .Collapse: return "Collapse"
        case .CollapseAlt: return "CollapseAlt"
        case .CollapseTop: return "CollapseTop"
        case .Columns: return "Columns"
        case .Comment: return "Comment"
        case .CommentAlt: return "CommentAlt"
        case .Comments: return "Comments"
        case .CommentsAlt: return "CommentsAlt"
        case .Compass: return "Compass"
        case .Copy: return "Copy"
        case .CreditCard: return "CreditCard"
        case .Crop: return "Crop"
        case .Css3: return "Css3"
        case .Cut: return "Cut"
        case .Dashboard: return "Dashboard"
        case .Desktop: return "Desktop"
        case .DotCircleAlt: return "DotCircleAlt"
        case .DoubleAngleDown: return "DoubleAngleDown"
        case .DoubleAngleLeft: return "DoubleAngleLeft"
        case .DoubleAngleRight: return "DoubleAngleRight"
        case .DoubleAngleUp: return "DoubleAngleUp"
        case .Download: return "Download"
        case .DownloadAlt: return "DownloadAlt"
        case .Dribble: return "Dribble"
        case .Dropbox: return "Dropbox"
        case .Edit: return "Edit"
        case .EditSign: return "EditSign"
        case .Eject: return "Eject"
        case .EllipsisHorizontal: return "EllipsisHorizontal"
        case .EllipsisVertical: return "EllipsisVertical"
        case .Envelope: return "Envelope"
        case .EnvelopeAlt: return "EnvelopeAlt"
        case .Eur: return "Eur"
        case .Exchange: return "Exchange"
        case .Exclamation: return "Exclamation"
        case .ExclamationSign: return "ExclamationSign"
        case .ExpandAlt: return "ExpandAlt"
        case .ExternalLink: return "ExternalLink"
        case .EyeClose: return "EyeClose"
        case .EyeOpen: return "EyeOpen"
        case .F0fe: return "F0fe"
        case .F171: return "F171"
        case .F1a1: return "F1a1"
        case .F1a4: return "F1a4"
        case .F1ab: return "F1ab"
        case .F1f3: return "F1f3"
        case .F1fc: return "F1fc"
        case .Facebook: return "Facebook"
        case .FacebookSign: return "FacebookSign"
        case .FacetimeVideo: return "FacetimeVideo"
        case .FastBackward: return "FastBackward"
        case .FastForward: return "FastForward"
        case .Female: return "Female"
        case .FighterJet: return "FighterJet"
        case .File: return "File"
        case .FileAlt: return "FileAlt"
        case .FileText: return "FileText"
        case .FileTextAlt: return "FileTextAlt"
        case .Film: return "Film"
        case .Filter: return "Filter"
        case .Fire: return "Fire"
        case .FireExtinguisher: return "FireExtinguisher"
        case .Flag: return "Flag"
        case .FlagAlt: return "FlagAlt"
        case .FlagCheckered: return "FlagCheckered"
        case .Flickr: return "Flickr"
        case .FolderClose: return "FolderClose"
        case .FolderCloseAlt: return "FolderCloseAlt"
        case .FolderOpen: return "FolderOpen"
        case .FolderOpenAlt: return "FolderOpenAlt"
        case .Font: return "Font"
        case .Food: return "Food"
        case .Forward: return "Forward"
        case .Foursquare: return "Foursquare"
        case .Frown: return "Frown"
        case .Fullscreen: return "Fullscreen"
        case .Gamepad: return "Gamepad"
        case .Gbp: return "Gbp"
        case .Gift: return "Gift"
        case .Github: return "Github"
        case .GithubAlt: return "GithubAlt"
        case .GithubSign: return "GithubSign"
        case .Gittip: return "Gittip"
        case .Glass: return "Glass"
        case .Globe: return "Globe"
        case .GooglePlus: return "GooglePlus"
        case .GooglePlusSign: return "GooglePlusSign"
        case .Group: return "Group"
        case .HSign: return "HSign"
        case .HandDown: return "HandDown"
        case .HandLeft: return "HandLeft"
        case .HandRight: return "HandRight"
        case .HandUp: return "HandUp"
        case .Hdd: return "Hdd"
        case .Headphones: return "Headphones"
        case .Heart: return "Heart"
        case .HeartEmpty: return "HeartEmpty"
        case .Home: return "Home"
        case .Hospital: return "Hospital"
        case .Html5: return "Html5"
        case .Inbox: return "Inbox"
        case .IndentLeft: return "IndentLeft"
        case .IndentRight: return "IndentRight"
        case .InfoSign: return "InfoSign"
        case .Inr: return "Inr"
        case .Instagram: return "Instagram"
        case .Italic: return "Italic"
        case .Jpy: return "Jpy"
        case .Key: return "Key"
        case .Keyboard: return "Keyboard"
        case .Krw: return "Krw"
        case .Laptop: return "Laptop"
        case .Leaf: return "Leaf"
        case .Legal: return "Legal"
        case .Lemon: return "Lemon"
        case .Lessequal: return "Lessequal"
        case .LevelDown: return "LevelDown"
        case .LevelUp: return "LevelUp"
        case .LightBulb: return "LightBulb"
        case .Link: return "Link"
        case .Linkedin: return "Linkedin"
        case .LinkedinSign: return "LinkedinSign"
        case .Linux: return "Linux"
        case .List: return "List"
        case .ListAlt: return "ListAlt"
        case .LocationArrow: return "LocationArrow"
        case .Lock: return "Lock"
        case .LongArrowDown: return "LongArrowDown"
        case .LongArrowLeft: return "LongArrowLeft"
        case .LongArrowRight: return "LongArrowRight"
        case .LongArrowUp: return "LongArrowUp"
        case .Magic: return "Magic"
        case .Magnet: return "Magnet"
        case .Male: return "Male"
        case .MapMarker: return "MapMarker"
        case .Maxcdn: return "Maxcdn"
        case .Medkit: return "Medkit"
        case .Meh: return "Meh"
        case .Microphone: return "Microphone"
        case .MicrophoneOff: return "MicrophoneOff"
        case .Minus: return "Minus"
        case .MinusSign: return "MinusSign"
        case .MinusSignAlt: return "MinusSignAlt"
        case .MobilePhone: return "MobilePhone"
        case .Money: return "Money"
        case .Move: return "Move"
        case .Music: return "Music"
        case .Off: return "Off"
        case .Ok: return "Ok"
        case .OkCircle: return "OkCircle"
        case .OkSign: return "OkSign"
        case .Ol: return "Ol"
        case .PaperClip: return "PaperClip"
        case .Paste: return "Paste"
        case .Pause: return "Pause"
        case .Pencil: return "Pencil"
        case .Phone: return "Phone"
        case .PhoneSign: return "PhoneSign"
        case .Picture: return "Picture"
        case .Pinterest: return "Pinterest"
        case .PinterestSign: return "PinterestSign"
        case .Plane: return "Plane"
        case .Play: return "Play"
        case .PlayCircle: return "PlayCircle"
        case .PlaySign: return "PlaySign"
        case .Plus: return "Plus"
        case .PlusSign: return "PlusSign"
        case .PlusSquareO: return "PlusSquareO"
        case .Print: return "Print"
        case .Pushpin: return "Pushpin"
        case .PuzzlePiece: return "PuzzlePiece"
        case .Qrcode: return "Qrcode"
        case .Question: return "Question"
        case .QuestionSign: return "QuestionSign"
        case .QuoteLeft: return "QuoteLeft"
        case .QuoteRight: return "QuoteRight"
        case .Random: return "Random"
        case .Refresh: return "Refresh"
        case .Remove: return "Remove"
        case .RemoveCircle: return "RemoveCircle"
        case .RemoveSign: return "RemoveSign"
        case .Renren: return "Renren"
        case .Reorder: return "Reorder"
        case .Repeat: return "Repeat"
        case .Reply: return "Reply"
        case .ReplyAll: return "ReplyAll"
        case .ResizeFull: return "ResizeFull"
        case .ResizeHorizontal: return "ResizeHorizontal"
        case .ResizeSmall: return "ResizeSmall"
        case .ResizeVertical: return "ResizeVertical"
        case .Retweet: return "Retweet"
        case .Road: return "Road"
        case .Rocket: return "Rocket"
        case .Rss: return "Rss"
        case .Rub: return "Rub"
        case .Save: return "Save"
        case .Screenshot: return "Screenshot"
        case .Search: return "Search"
        case .Share: return "Share"
        case .ShareAlt: return "ShareAlt"
        case .ShareSign: return "ShareSign"
        case .Shield: return "Shield"
        case .ShoppingCart: return "ShoppingCart"
        case .SignBlank: return "SignBlank"
        case .Signal: return "Signal"
        case .Signin: return "Signin"
        case .Signout: return "Signout"
        case .Sitemap: return "Sitemap"
        case .Skype: return "Skype"
        case .Smile: return "Smile"
        case .Sort: return "Sort"
        case .SortByAlphabet: return "SortByAlphabet"
        case .SortByAttributes: return "SortByAttributes"
        case .SortByAttributesAlt: return "SortByAttributesAlt"
        case .SortByOrder: return "SortByOrder"
        case .SortByOrderAlt: return "SortByOrderAlt"
        case .SortDown: return "SortDown"
        case .SortUp: return "SortUp"
        case .Spinner: return "Spinner"
        case .StackExchange: return "StackExchange"
        case .Stackexchange: return "Stackexchange"
        case .Star: return "Star"
        case .StarEmpty: return "StarEmpty"
        case .StarHalf: return "StarHalf"
        case .StarHalfEmpty: return "StarHalfEmpty"
        case .StepBackward: return "StepBackward"
        case .StepForward: return "StepForward"
        case .Stethoscope: return "Stethoscope"
        case .Stop: return "Stop"
        case .Strikethrough: return "Strikethrough"
        case .Subscript: return "Subscript"
        case .Suitcase: return "Suitcase"
        case .Sun: return "Sun"
        case .Superscript: return "Superscript"
        case .Table: return "Table"
        case .Tablet: return "Tablet"
        case .Tag: return "Tag"
        case .Tags: return "Tags"
        case .Tasks: return "Tasks"
        case .Terminal: return "Terminal"
        case .TextHeight: return "TextHeight"
        case .TextWidth: return "TextWidth"
        case .Th: return "Th"
        case .ThLarge: return "ThLarge"
        case .ThList: return "ThList"
        case .ThumbsDownAlt: return "ThumbsDownAlt"
        case .ThumbsUpAlt: return "ThumbsUpAlt"
        case .Ticket: return "Ticket"
        case .Time: return "Time"
        case .Tint: return "Tint"
        case .Trash: return "Trash"
        case .Trello: return "Trello"
        case .Trophy: return "Trophy"
        case .Truck: return "Truck"
        case .Tumblr: return "Tumblr"
        case .TumblrSign: return "TumblrSign"
        case .Twitter: return "Twitter"
        case .TwitterSign: return "TwitterSign"
        case .Ul: return "Ul"
        case .Umbrella: return "Umbrella"
        case .Underline: return "Underline"
        case .Undo: return "Undo"
        case .UniF1A0: return "UniF1A0"
        case .UniF1B1: return "UniF1B1"
        case .UniF1C0: return "UniF1C0"
        case .UniF1C1: return "UniF1C1"
        case .UniF1D0: return "UniF1D0"
        case .UniF1D1: return "UniF1D1"
        case .UniF1D2: return "UniF1D2"
        case .UniF1D5: return "UniF1D5"
        case .UniF1D6: return "UniF1D6"
        case .UniF1D7: return "UniF1D7"
        case .UniF1E0: return "UniF1E0"
        case .UniF1F0: return "UniF1F0"
        case .Unlink: return "Unlink"
        case .Unlock: return "Unlock"
        case .UnlockAlt: return "UnlockAlt"
        case .Upload: return "Upload"
        case .UploadAlt: return "UploadAlt"
        case .Usd: return "Usd"
        case .User: return "User"
        case .UserMd: return "UserMd"
        case .VimeoSquare: return "VimeoSquare"
        case .Vk: return "Vk"
        case .VolumeDown: return "VolumeDown"
        case .VolumeOff: return "VolumeOff"
        case .VolumeUp: return "VolumeUp"
        case .WarningSign: return "WarningSign"
        case .Weibo: return "Weibo"
        case .Windows: return "Windows"
        case .Wrench: return "Wrench"
        case .Xing: return "Xing"
        case .XingSign: return "XingSign"
        case .Youtube: return "Youtube"
        case .YoutubePlay: return "YoutubePlay"
        case .YoutubeSign: return "YoutubeSign"
        case .ZoomIn: return "ZoomIn"
        case .ZoomOut: return "ZoomOut"
        }
    }

    public static var familyName:String {
        return "FontAwesome"
    }
}

