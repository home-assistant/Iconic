
import PlaygroundSupport
import Foundation
import UIKit
import Iconic


// REGISTRATION
// First, register Font Awesome icons with Iconic
FontAwesomeIcon.register()

// Register OpenSans fonts
let fontNames = ["OpenSans-Bold", "OpenSans-Regular", "OpenSans-Semibold"].flatMap {
    let url = Bundle.main.url(forResource: $0, withExtension: "ttf") as CFURL!
    CTFontManagerRegisterFontsForURL(url!, .none, nil)
}


// MARK: - LAYOUT AND DRAWING
// Draws a background filled with small icons and the title/subtilte of Iconic
class IconicHeaderView : UIView {
    
    var collectionView: IconCollectionView
    var titleLabel: UILabel
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: 1777, height: 350)
        let layout = IconCollectionViewLayout(columns: 36, width: frame.width)
        
        let viewFrame = CGRect(x: -50, y: -frame.height/2 - 50, width: frame.width + 100, height: (frame.height * 2) + 100)
        collectionView = IconCollectionView(frame: viewFrame, collectionViewLayout: layout)
        collectionView.iconColor = UIColor(red: 240/255, green: 109/255, blue: 84/255, alpha: 1)
        collectionView.backgroundColor = UIColor(red: 215/255, green: 97/255, blue: 76/255, alpha: 1)
        
        titleLabel = UILabel(frame: frame)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        super.init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        
        let title = "Iconic"
        let subtitle = "Render vector icons, natively."
        
        let titleAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 150),
                               NSForegroundColorAttributeName: UIColor.white]
        
        
        let subtitleAttributes = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 50),
                                  NSForegroundColorAttributeName: UIColor.white]
        
        let titleString = NSAttributedString(string: title + "\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(titleString)
        attributedText.append(subtitleString)
        
        titleLabel.attributedText = attributedText
        
        addSubview(collectionView)
        addSubview(titleLabel)
        
        let angle = CGFloat(-12v*(M_PI/180))
        collectionView.transform = CGAffineTransform(rotationAngle: angle)
    }
}

class IconCollectionViewLayout : UICollectionViewFlowLayout {
    
    init(columns: uint, width: CGFloat) {
        super.init()
        
        let spacing: CGFloat = 20
        let padding: CGFloat = spacing/2
        let insets = UIEdgeInsetsMake(-spacing, -spacing, -spacing, -spacing)
        
        let viewGaps = (CGFloat(columns-1) * spacing) + insets.left + insets.right
        let itemWidth = (width - viewGaps) / CGFloat(columns)
        
        self.minimumLineSpacing = spacing
        self.minimumInteritemSpacing = spacing
        self.sectionInset = insets
        self.estimatedItemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class IconCollectionViewCell : UICollectionViewCell {
    
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
    }
}

class IconCollectionView : UICollectionView, UICollectionViewDataSource {
    
    var iconColor: UIColor? {
        didSet {
            self.reloadData() // reloads all icons
        }
    }
    
    let kIdentifier = "identifier"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        iconColor = UIColor.gray
        backgroundColor = UIColor.darkGray
        
        self.dataSource = self
        self.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: kIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FontAwesomeIcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kIdentifier, for: indexPath) as! IconCollectionViewCell
        let layout = collectionView.collectionViewLayout as! IconCollectionViewLayout
        
        if let icon = FontAwesomeIcon(rawValue: indexPath.row) {
            cell.imageView.image = icon.image(ofSize: layout.estimatedItemSize, color: iconColor)
        }
        
        return cell
    }
}


// MARK: - Display

let view = IconicHeaderView()

// Shows the render in the Assisstant Editor
PlaygroundPage.current.liveView = IconicHeaderView()

