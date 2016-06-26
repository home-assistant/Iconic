// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension Iconic {

    /**
    Registers the FontAwesome font to Iconic.
    You shall do this once, when launching your application. Internally, the icon mapping is retrieved and
    kept in memory during the application's life term.
    */
    public class func registerFontAwesomeIcon() {
        Iconic.registerFont("FontAwesome", map: FontAwesomeIconMap)
    }

    /**
     Returns the FontAwesome font object in the specified size.
     - parameter fontSize: The size (in points) to which the font is scaled.
     This value must be greater than 0.0, or a system Font object will be returned.
     */
    public class func fontAwesomeIconFontOfSize(fontSize: CGFloat) -> UIFont? {
        return Iconic.iconFontOfSize(fontSize)
    }

    /**
    Creates an attributed string with the specified icon enum type.

    - parameter icon: The icon enum type.
    - parameter size: The size of the text, in points.
    - parameter color: Optional color to be applied to the icon.
    */
    public class func attributedStringForFontAwesomeIcon(icon: FontAwesomeIcon, size: CGFloat, color: UIColor?) -> NSAttributedString? {
        return Iconic.attributedStringForIndex(icon.rawValue, size: size, color: color)
    }

    /**
    Creates an image out of an attributed string with the specified icon enum type.

    - parameter icon: The icon enum type.
    - parameter size: The size of the text, in points.
    - parameter color: Optional color to be applied to the icon.
    */
    public class func imageForFontAwesomeIcon(icon: FontAwesomeIcon, size: CGFloat, color: UIColor?) -> UIImage? {
        return Iconic.imageForIndex(icon.rawValue, size: size, color: color)
    }

    /**
     Returns a string representation of an unicode for the specified icon enum type.

     - parameter icon: The icon enum type.
     - returns An unicode string representation.
     */
    public class func unicodeStringForFontAwesomeIcon(icon: FontAwesomeIcon) -> String? {
        return Iconic.unicodeStringForIndex(icon.rawValue)
    }
}

extension UIBarButtonItem {

    /**
    Initializes a new item using the specified icon enum type and other properties.

    - parameter fontAwesomeIcon: The icon enum type to be used as image.
    - parameter size: The size of the image, in points.
    - parameter target: The object that receives the action message.
    - parameter action: The action to send to target when this item is selected.
    */
    public convenience init(fontAwesomeIcon: FontAwesomeIcon, size: CGFloat, target: AnyObject?, action: Selector) {
        let image = Iconic.imageForIndex(fontAwesomeIcon.rawValue, size: size, color: .blackColor())
        self.init(image: image, style: .Plain, target: target, action: action)
    }
}

extension UITabBarItem {

    /**
    Initializes a new item using the specified icon enum type and other properties.

    - parameter fontAwesomeIcon: The icon enum type to be used as image.
    - parameter size: The size of the image, in points.
    - parameter title: The item's title. If nil, a title is not displayed.
    - parameter tag: The receiver's tag, an integer that you can use to identify bar item objects in your application.
    */
    public convenience init(fontAwesomeIcon: FontAwesomeIcon, size: CGFloat, title: String?, tag: Int) {
        let image = Iconic.imageForIndex(fontAwesomeIcon.rawValue, size: size, color: .blackColor())
        self.init(title: title, image: image, tag: tag)
    }
}

extension UIButton {

    /**
    Sets the icon to use for the specified state.

    - parameter fontAwesomeIcon: The icon enum type to be used as image.
    - parameter size: The size of the image, in points.
    - parameter state: The state that uses the specified title. The values are described in UIControlState.
    */
    public func setFontAwesomeIcon(fontAwesomeIcon: FontAwesomeIcon, size: CGFloat, forState: UIControlState) {
        self.setIconForIndex(fontAwesomeIcon.rawValue, size: size, forState: state)
    }
}

/**
A strongly typed representation of every available icon name.
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
    case _496
    case _498
    case _499
    case _500
    case _501
    case _502
    case _503
    case _504
    case _505
    case _506
    case _507
    case _508
    case _509
    case _511
    case _512
    case _513
    case _514
    case _515
    case _516
    case _517
    case _518
    case _519
    case _520
    case _521
    case _522
    case _523
    case _524
    case _525
    case _526
    case _527
    case _528
    case _529
    case _530
    case _531
    case _532
    case _533
    case _534
    case _535
    case _536
    case _537
    case _538
    case _539
    case _540
    case _541
    case _542
    case _543
    case _544
    case _545
    case _546
    case _547
    case _548
    case _549
    case _550
    case _551
    case _552
    case _553
    case _554
    case _555
    case _556
    case _557
    case _558
    case _559
    case _560
    case _561
    case _562
    case _563
    case _564
    case _565
    case _566
    case _567
    case _568
    case _569
    case _572
    case _574
    case _575
    case _576
    case _577
    case _578
    case _579
    case _580
    case _581
    case _582
    case _583
    case _584
    case _585
    case _586
    case _587
    case _588
    case _589
    case _590
    case _591
    case _592
    case _593
    case _594
    case _595
    case _596
    case _597
    case _598
    case _602
    case _603
    case _604
    case _607
    case _608
    case _609
    case _610
    case _611
    case _612
    case _613
    case _614
    case _615
    case _616
    case _617
    case _618
    case _619
    case _620
    case _621
    case _622
    case _623
    case _624
    case _625
    case _626
    case _627
    case _628
    case _629
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
    case F210
    case F212
    case F260
    case F261
    case F263
    case F27e
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
    case UniF280
    case UniF281
    case UniF285
    case UniF286
    case UniF2A0
    case UniF2A1
    case UniF2A2
    case UniF2A3
    case UniF2A4
    case UniF2A5
    case UniF2A6
    case UniF2A7
    case UniF2A8
    case UniF2A9
    case UniF2AA
    case UniF2AB
    case UniF2AC
    case UniF2AD
    case UniF2AE
    case UniF2B0
    case UniF2B1
    case UniF2B2
    case UniF2B3
    case UniF2B4
    case UniF2B5
    case UniF2B6
    case UniF2B7
    case UniF2B8
    case UniF2B9
    case UniF2BA
    case UniF2BB
    case UniF2BC
    case UniF2BD
    case UniF2BE
    case Unlink
    case Unlock
    case UnlockAlt
    case Upload
    case UploadAlt
    case Usd
    case User
    case UserMd
    case Venus
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

    // Useful to get the total count of icons. This index doesn't have any associated unicode value.
    case TotalCount
}

/**
A list of unicode characters associated with each FontAwesomeIcon case, in order.
*/
public let FontAwesomeIconMap: Array<String> = [
    "\u{F129}",
    "\u{F12D}",
    "\u{F143}",
    "\u{F14C}",
    "\u{F152}",
    "\u{F15E}",
    "\u{F164}",
    "\u{F165}",
    "\u{F186}",
    "\u{F18C}",
    "\u{F18E}",
    "\u{F191}",
    "\u{F193}",
    "\u{F195}",
    "\u{F197}",
    "\u{F198}",
    "\u{F199}",
    "\u{F19A}",
    "\u{F19B}",
    "\u{F19C}",
    "\u{F19D}",
    "\u{F19E}",
    "\u{F1A2}",
    "\u{F1A3}",
    "\u{F1A5}",
    "\u{F1A6}",
    "\u{F1A7}",
    "\u{F1A8}",
    "\u{F1A9}",
    "\u{F1AA}",
    "\u{F1AC}",
    "\u{F1AD}",
    "\u{F1AE}",
    "\u{F1B1}",
    "\u{F1B2}",
    "\u{F1B3}",
    "\u{F1B4}",
    "\u{F1B5}",
    "\u{F1B6}",
    "\u{F1B7}",
    "\u{F1B8}",
    "\u{F1B9}",
    "\u{F1BA}",
    "\u{F1BB}",
    "\u{F1BC}",
    "\u{F1BD}",
    "\u{F1BE}",
    "\u{F1C2}",
    "\u{F1C3}",
    "\u{F1C4}",
    "\u{F1C5}",
    "\u{F1C6}",
    "\u{F1C7}",
    "\u{F1C8}",
    "\u{F1C9}",
    "\u{F1CA}",
    "\u{F1CB}",
    "\u{F1CC}",
    "\u{F1CD}",
    "\u{F1CE}",
    "\u{F1D3}",
    "\u{F1D4}",
    "\u{F1D8}",
    "\u{F1D9}",
    "\u{F1DA}",
    "\u{F1DB}",
    "\u{F1DC}",
    "\u{F1DD}",
    "\u{F1DE}",
    "\u{F1E1}",
    "\u{F1E2}",
    "\u{F1E3}",
    "\u{F1E4}",
    "\u{F1E5}",
    "\u{F1E6}",
    "\u{F1E7}",
    "\u{F1E8}",
    "\u{F1E9}",
    "\u{F1EA}",
    "\u{F1EB}",
    "\u{F1EC}",
    "\u{F1ED}",
    "\u{F1EE}",
    "\u{F1F1}",
    "\u{F1F2}",
    "\u{F1F4}",
    "\u{F1F5}",
    "\u{F1F6}",
    "\u{F1F7}",
    "\u{F1F8}",
    "\u{F1F9}",
    "\u{F1FA}",
    "\u{F1FB}",
    "\u{F1FD}",
    "\u{F1FE}",
    "\u{F200}",
    "\u{F201}",
    "\u{F202}",
    "\u{F203}",
    "\u{F204}",
    "\u{F205}",
    "\u{F206}",
    "\u{F207}",
    "\u{F208}",
    "\u{F209}",
    "\u{F20A}",
    "\u{F20B}",
    "\u{F20C}",
    "\u{F20D}",
    "\u{F20E}",
    "\u{F211}",
    "\u{F213}",
    "\u{F214}",
    "\u{F215}",
    "\u{F216}",
    "\u{F217}",
    "\u{F218}",
    "\u{F219}",
    "\u{F21A}",
    "\u{F21B}",
    "\u{F21C}",
    "\u{F21D}",
    "\u{F21E}",
    "\u{F222}",
    "\u{F223}",
    "\u{F224}",
    "\u{F225}",
    "\u{F226}",
    "\u{F227}",
    "\u{F228}",
    "\u{F229}",
    "\u{F22A}",
    "\u{F22B}",
    "\u{F22C}",
    "\u{F22D}",
    "\u{F22E}",
    "\u{F22F}",
    "\u{F230}",
    "\u{F231}",
    "\u{F232}",
    "\u{F233}",
    "\u{F234}",
    "\u{F235}",
    "\u{F236}",
    "\u{F237}",
    "\u{F238}",
    "\u{F239}",
    "\u{F23A}",
    "\u{F23B}",
    "\u{F23C}",
    "\u{F23D}",
    "\u{F23E}",
    "\u{F240}",
    "\u{F241}",
    "\u{F242}",
    "\u{F243}",
    "\u{F244}",
    "\u{F245}",
    "\u{F246}",
    "\u{F247}",
    "\u{F248}",
    "\u{F249}",
    "\u{F24A}",
    "\u{F24B}",
    "\u{F24C}",
    "\u{F24D}",
    "\u{F24E}",
    "\u{F250}",
    "\u{F251}",
    "\u{F252}",
    "\u{F253}",
    "\u{F254}",
    "\u{F255}",
    "\u{F256}",
    "\u{F257}",
    "\u{F258}",
    "\u{F259}",
    "\u{F25A}",
    "\u{F25B}",
    "\u{F25C}",
    "\u{F25D}",
    "\u{F25E}",
    "\u{F262}",
    "\u{F264}",
    "\u{F265}",
    "\u{F266}",
    "\u{F267}",
    "\u{F268}",
    "\u{F269}",
    "\u{F26A}",
    "\u{F26B}",
    "\u{F26C}",
    "\u{F26D}",
    "\u{F26E}",
    "\u{F270}",
    "\u{F271}",
    "\u{F272}",
    "\u{F273}",
    "\u{F274}",
    "\u{F275}",
    "\u{F276}",
    "\u{F277}",
    "\u{F278}",
    "\u{F279}",
    "\u{F27A}",
    "\u{F27B}",
    "\u{F27C}",
    "\u{F27D}",
    "\u{F282}",
    "\u{F283}",
    "\u{F284}",
    "\u{F287}",
    "\u{F288}",
    "\u{F289}",
    "\u{F28A}",
    "\u{F28B}",
    "\u{F28C}",
    "\u{F28D}",
    "\u{F28E}",
    "\u{F290}",
    "\u{F291}",
    "\u{F292}",
    "\u{F293}",
    "\u{F294}",
    "\u{F295}",
    "\u{F296}",
    "\u{F297}",
    "\u{F298}",
    "\u{F299}",
    "\u{F29A}",
    "\u{F29B}",
    "\u{F29C}",
    "\u{F29D}",
    "\u{F29E}",
    "\u{F042}",
    "\u{F170}",
    "\u{F037}",
    "\u{F039}",
    "\u{F036}",
    "\u{F038}",
    "\u{F0F9}",
    "\u{F13D}",
    "\u{F17B}",
    "\u{F107}",
    "\u{F104}",
    "\u{F105}",
    "\u{F106}",
    "\u{F179}",
    "\u{F187}",
    "\u{F190}",
    "\u{F063}",
    "\u{F060}",
    "\u{F061}",
    "\u{F062}",
    "\u{F069}",
    "\u{F04A}",
    "\u{F05E}",
    "\u{F080}",
    "\u{F02A}",
    "\u{F0C3}",
    "\u{F0FC}",
    "\u{F0A2}",
    "\u{F0F3}",
    "\u{F172}",
    "\u{F032}",
    "\u{F0E7}",
    "\u{F02D}",
    "\u{F02E}",
    "\u{F097}",
    "\u{F0B1}",
    "\u{F15A}",
    "\u{F188}",
    "\u{F0F7}",
    "\u{F0A1}",
    "\u{F140}",
    "\u{F073}",
    "\u{F133}",
    "\u{F030}",
    "\u{F083}",
    "\u{F0D7}",
    "\u{F0D9}",
    "\u{F0DA}",
    "\u{F0D8}",
    "\u{F0A3}",
    "\u{F046}",
    "\u{F096}",
    "\u{F147}",
    "\u{F14A}",
    "\u{F078}",
    "\u{F053}",
    "\u{F054}",
    "\u{F13A}",
    "\u{F137}",
    "\u{F138}",
    "\u{F139}",
    "\u{F077}",
    "\u{F111}",
    "\u{F0AB}",
    "\u{F0A8}",
    "\u{F0A9}",
    "\u{F0AA}",
    "\u{F10C}",
    "\u{F0C2}",
    "\u{F0ED}",
    "\u{F0EE}",
    "\u{F121}",
    "\u{F126}",
    "\u{F0F4}",
    "\u{F013}",
    "\u{F085}",
    "\u{F150}",
    "\u{F117}",
    "\u{F151}",
    "\u{F0DB}",
    "\u{F075}",
    "\u{F0E5}",
    "\u{F086}",
    "\u{F0E6}",
    "\u{F14E}",
    "\u{F0C5}",
    "\u{F09D}",
    "\u{F125}",
    "\u{F13C}",
    "\u{F0C4}",
    "\u{F0E4}",
    "\u{F108}",
    "\u{F192}",
    "\u{F103}",
    "\u{F100}",
    "\u{F101}",
    "\u{F102}",
    "\u{F01A}",
    "\u{F019}",
    "\u{F17D}",
    "\u{F16B}",
    "\u{F044}",
    "\u{F14B}",
    "\u{F052}",
    "\u{F141}",
    "\u{F142}",
    "\u{F003}",
    "\u{F0E0}",
    "\u{F153}",
    "\u{F0EC}",
    "\u{F12A}",
    "\u{F06A}",
    "\u{F116}",
    "\u{F08E}",
    "\u{F070}",
    "\u{F06E}",
    "\u{F0FE}",
    "\u{F171}",
    "\u{F1A1}",
    "\u{F1A4}",
    "\u{F1AB}",
    "\u{F1F3}",
    "\u{F1FC}",
    "\u{F210}",
    "\u{F212}",
    "\u{F260}",
    "\u{F261}",
    "\u{F263}",
    "\u{F27E}",
    "\u{F09A}",
    "\u{F082}",
    "\u{F03D}",
    "\u{F049}",
    "\u{F050}",
    "\u{F182}",
    "\u{F0FB}",
    "\u{F15B}",
    "\u{F016}",
    "\u{F15C}",
    "\u{F0F6}",
    "\u{F008}",
    "\u{F0B0}",
    "\u{F06D}",
    "\u{F134}",
    "\u{F024}",
    "\u{F11D}",
    "\u{F11E}",
    "\u{F16E}",
    "\u{F07B}",
    "\u{F114}",
    "\u{F07C}",
    "\u{F115}",
    "\u{F031}",
    "\u{F0F5}",
    "\u{F04E}",
    "\u{F180}",
    "\u{F119}",
    "\u{F0B2}",
    "\u{F11B}",
    "\u{F154}",
    "\u{F06B}",
    "\u{F09B}",
    "\u{F113}",
    "\u{F092}",
    "\u{F184}",
    "\u{F000}",
    "\u{F0AC}",
    "\u{F0D5}",
    "\u{F0D4}",
    "\u{F0C0}",
    "\u{F0FD}",
    "\u{F0A7}",
    "\u{F0A5}",
    "\u{F0A4}",
    "\u{F0A6}",
    "\u{F0A0}",
    "\u{F025}",
    "\u{F004}",
    "\u{F08A}",
    "\u{F015}",
    "\u{F0F8}",
    "\u{F13B}",
    "\u{F01C}",
    "\u{F03B}",
    "\u{F03C}",
    "\u{F05A}",
    "\u{F156}",
    "\u{F16D}",
    "\u{F033}",
    "\u{F157}",
    "\u{F084}",
    "\u{F11C}",
    "\u{F159}",
    "\u{F109}",
    "\u{F06C}",
    "\u{F0E3}",
    "\u{F094}",
    "\u{F500}",
    "\u{F149}",
    "\u{F148}",
    "\u{F0EB}",
    "\u{F0C1}",
    "\u{F0E1}",
    "\u{F08C}",
    "\u{F17C}",
    "\u{F03A}",
    "\u{F022}",
    "\u{F124}",
    "\u{F023}",
    "\u{F175}",
    "\u{F177}",
    "\u{F178}",
    "\u{F176}",
    "\u{F0D0}",
    "\u{F076}",
    "\u{F183}",
    "\u{F041}",
    "\u{F136}",
    "\u{F0FA}",
    "\u{F11A}",
    "\u{F130}",
    "\u{F131}",
    "\u{F068}",
    "\u{F056}",
    "\u{F146}",
    "\u{F10B}",
    "\u{F0D6}",
    "\u{F047}",
    "\u{F001}",
    "\u{F011}",
    "\u{F00C}",
    "\u{F05D}",
    "\u{F058}",
    "\u{F0CB}",
    "\u{F0C6}",
    "\u{F0EA}",
    "\u{F04C}",
    "\u{F040}",
    "\u{F095}",
    "\u{F098}",
    "\u{F03E}",
    "\u{F0D2}",
    "\u{F0D3}",
    "\u{F072}",
    "\u{F04B}",
    "\u{F01D}",
    "\u{F144}",
    "\u{F067}",
    "\u{F055}",
    "\u{F196}",
    "\u{F02F}",
    "\u{F08D}",
    "\u{F12E}",
    "\u{F029}",
    "\u{F128}",
    "\u{F059}",
    "\u{F10D}",
    "\u{F10E}",
    "\u{F074}",
    "\u{F021}",
    "\u{F00D}",
    "\u{F05C}",
    "\u{F057}",
    "\u{F18B}",
    "\u{F0C9}",
    "\u{F01E}",
    "\u{F112}",
    "\u{F122}",
    "\u{F065}",
    "\u{F07E}",
    "\u{F066}",
    "\u{F07D}",
    "\u{F079}",
    "\u{F018}",
    "\u{F135}",
    "\u{F09E}",
    "\u{F158}",
    "\u{F0C7}",
    "\u{F05B}",
    "\u{F002}",
    "\u{F045}",
    "\u{F064}",
    "\u{F14D}",
    "\u{F132}",
    "\u{F07A}",
    "\u{F0C8}",
    "\u{F012}",
    "\u{F090}",
    "\u{F08B}",
    "\u{F0E8}",
    "\u{F17E}",
    "\u{F118}",
    "\u{F0DC}",
    "\u{F15D}",
    "\u{F160}",
    "\u{F161}",
    "\u{F162}",
    "\u{F163}",
    "\u{F0DD}",
    "\u{F0DE}",
    "\u{F110}",
    "\u{F18D}",
    "\u{F16C}",
    "\u{F005}",
    "\u{F006}",
    "\u{F089}",
    "\u{F123}",
    "\u{F048}",
    "\u{F051}",
    "\u{F0F1}",
    "\u{F04D}",
    "\u{F0CC}",
    "\u{F12C}",
    "\u{F0F2}",
    "\u{F185}",
    "\u{F12B}",
    "\u{F0CE}",
    "\u{F10A}",
    "\u{F02B}",
    "\u{F02C}",
    "\u{F0AE}",
    "\u{F120}",
    "\u{F034}",
    "\u{F035}",
    "\u{F00A}",
    "\u{F009}",
    "\u{F00B}",
    "\u{F088}",
    "\u{F087}",
    "\u{F145}",
    "\u{F017}",
    "\u{F043}",
    "\u{F014}",
    "\u{F181}",
    "\u{F091}",
    "\u{F0D1}",
    "\u{F173}",
    "\u{F174}",
    "\u{F099}",
    "\u{F081}",
    "\u{F0CA}",
    "\u{F0E9}",
    "\u{F0CD}",
    "\u{F0E2}",
    "\u{F1A0}",
    "\u{F1B0}",
    "\u{F1C0}",
    "\u{F1C1}",
    "\u{F1D0}",
    "\u{F1D1}",
    "\u{F1D2}",
    "\u{F1D5}",
    "\u{F1D6}",
    "\u{F1D7}",
    "\u{F1E0}",
    "\u{F1F0}",
    "\u{F280}",
    "\u{F281}",
    "\u{F285}",
    "\u{F286}",
    "\u{F2A0}",
    "\u{F2A1}",
    "\u{F2A2}",
    "\u{F2A3}",
    "\u{F2A4}",
    "\u{F2A5}",
    "\u{F2A6}",
    "\u{F2A7}",
    "\u{F2A8}",
    "\u{F2A9}",
    "\u{F2AA}",
    "\u{F2AB}",
    "\u{F2AC}",
    "\u{F2AD}",
    "\u{F2AE}",
    "\u{F2B0}",
    "\u{F2B1}",
    "\u{F2B2}",
    "\u{F2B3}",
    "\u{F2B4}",
    "\u{F2B5}",
    "\u{F2B6}",
    "\u{F2B7}",
    "\u{F2B8}",
    "\u{F2B9}",
    "\u{F2BA}",
    "\u{F2BB}",
    "\u{F2BC}",
    "\u{F2BD}",
    "\u{F2BE}",
    "\u{F127}",
    "\u{F09C}",
    "\u{F13E}",
    "\u{F01B}",
    "\u{F093}",
    "\u{F155}",
    "\u{F007}",
    "\u{F0F0}",
    "\u{F221}",
    "\u{F194}",
    "\u{F189}",
    "\u{F027}",
    "\u{F026}",
    "\u{F028}",
    "\u{F071}",
    "\u{F18A}",
    "\u{F17A}",
    "\u{F0AD}",
    "\u{F168}",
    "\u{F169}",
    "\u{F167}",
    "\u{F16A}",
    "\u{F166}",
    "\u{F00E}",
    "\u{F010}",
]

/**
Returns the name of an icon enum type as a string.
*/
public func NSStringFromFontAwesomeIcon(fontawesomeicon: FontAwesomeIcon) -> String {
    switch fontawesomeicon {
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
    case ._496: return "_496"
    case ._498: return "_498"
    case ._499: return "_499"
    case ._500: return "_500"
    case ._501: return "_501"
    case ._502: return "_502"
    case ._503: return "_503"
    case ._504: return "_504"
    case ._505: return "_505"
    case ._506: return "_506"
    case ._507: return "_507"
    case ._508: return "_508"
    case ._509: return "_509"
    case ._511: return "_511"
    case ._512: return "_512"
    case ._513: return "_513"
    case ._514: return "_514"
    case ._515: return "_515"
    case ._516: return "_516"
    case ._517: return "_517"
    case ._518: return "_518"
    case ._519: return "_519"
    case ._520: return "_520"
    case ._521: return "_521"
    case ._522: return "_522"
    case ._523: return "_523"
    case ._524: return "_524"
    case ._525: return "_525"
    case ._526: return "_526"
    case ._527: return "_527"
    case ._528: return "_528"
    case ._529: return "_529"
    case ._530: return "_530"
    case ._531: return "_531"
    case ._532: return "_532"
    case ._533: return "_533"
    case ._534: return "_534"
    case ._535: return "_535"
    case ._536: return "_536"
    case ._537: return "_537"
    case ._538: return "_538"
    case ._539: return "_539"
    case ._540: return "_540"
    case ._541: return "_541"
    case ._542: return "_542"
    case ._543: return "_543"
    case ._544: return "_544"
    case ._545: return "_545"
    case ._546: return "_546"
    case ._547: return "_547"
    case ._548: return "_548"
    case ._549: return "_549"
    case ._550: return "_550"
    case ._551: return "_551"
    case ._552: return "_552"
    case ._553: return "_553"
    case ._554: return "_554"
    case ._555: return "_555"
    case ._556: return "_556"
    case ._557: return "_557"
    case ._558: return "_558"
    case ._559: return "_559"
    case ._560: return "_560"
    case ._561: return "_561"
    case ._562: return "_562"
    case ._563: return "_563"
    case ._564: return "_564"
    case ._565: return "_565"
    case ._566: return "_566"
    case ._567: return "_567"
    case ._568: return "_568"
    case ._569: return "_569"
    case ._572: return "_572"
    case ._574: return "_574"
    case ._575: return "_575"
    case ._576: return "_576"
    case ._577: return "_577"
    case ._578: return "_578"
    case ._579: return "_579"
    case ._580: return "_580"
    case ._581: return "_581"
    case ._582: return "_582"
    case ._583: return "_583"
    case ._584: return "_584"
    case ._585: return "_585"
    case ._586: return "_586"
    case ._587: return "_587"
    case ._588: return "_588"
    case ._589: return "_589"
    case ._590: return "_590"
    case ._591: return "_591"
    case ._592: return "_592"
    case ._593: return "_593"
    case ._594: return "_594"
    case ._595: return "_595"
    case ._596: return "_596"
    case ._597: return "_597"
    case ._598: return "_598"
    case ._602: return "_602"
    case ._603: return "_603"
    case ._604: return "_604"
    case ._607: return "_607"
    case ._608: return "_608"
    case ._609: return "_609"
    case ._610: return "_610"
    case ._611: return "_611"
    case ._612: return "_612"
    case ._613: return "_613"
    case ._614: return "_614"
    case ._615: return "_615"
    case ._616: return "_616"
    case ._617: return "_617"
    case ._618: return "_618"
    case ._619: return "_619"
    case ._620: return "_620"
    case ._621: return "_621"
    case ._622: return "_622"
    case ._623: return "_623"
    case ._624: return "_624"
    case ._625: return "_625"
    case ._626: return "_626"
    case ._627: return "_627"
    case ._628: return "_628"
    case ._629: return "_629"
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
    case .F210: return "F210"
    case .F212: return "F212"
    case .F260: return "F260"
    case .F261: return "F261"
    case .F263: return "F263"
    case .F27e: return "F27e"
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
    case .UniF280: return "UniF280"
    case .UniF281: return "UniF281"
    case .UniF285: return "UniF285"
    case .UniF286: return "UniF286"
    case .UniF2A0: return "UniF2A0"
    case .UniF2A1: return "UniF2A1"
    case .UniF2A2: return "UniF2A2"
    case .UniF2A3: return "UniF2A3"
    case .UniF2A4: return "UniF2A4"
    case .UniF2A5: return "UniF2A5"
    case .UniF2A6: return "UniF2A6"
    case .UniF2A7: return "UniF2A7"
    case .UniF2A8: return "UniF2A8"
    case .UniF2A9: return "UniF2A9"
    case .UniF2AA: return "UniF2AA"
    case .UniF2AB: return "UniF2AB"
    case .UniF2AC: return "UniF2AC"
    case .UniF2AD: return "UniF2AD"
    case .UniF2AE: return "UniF2AE"
    case .UniF2B0: return "UniF2B0"
    case .UniF2B1: return "UniF2B1"
    case .UniF2B2: return "UniF2B2"
    case .UniF2B3: return "UniF2B3"
    case .UniF2B4: return "UniF2B4"
    case .UniF2B5: return "UniF2B5"
    case .UniF2B6: return "UniF2B6"
    case .UniF2B7: return "UniF2B7"
    case .UniF2B8: return "UniF2B8"
    case .UniF2B9: return "UniF2B9"
    case .UniF2BA: return "UniF2BA"
    case .UniF2BB: return "UniF2BB"
    case .UniF2BC: return "UniF2BC"
    case .UniF2BD: return "UniF2BD"
    case .UniF2BE: return "UniF2BE"
    case .Unlink: return "Unlink"
    case .Unlock: return "Unlock"
    case .UnlockAlt: return "UnlockAlt"
    case .Upload: return "Upload"
    case .UploadAlt: return "UploadAlt"
    case .Usd: return "Usd"
    case .User: return "User"
    case .UserMd: return "UserMd"
    case .Venus: return "Venus"
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
    default: return ""
    }
}
