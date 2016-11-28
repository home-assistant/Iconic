
import Iconic
import PlaygroundSupport

// First of all, we must registering the icon font
FontAwesomeIcon.register()

class IconCollectionViewLayout : UICollectionViewFlowLayout {
    
    init(columns: uint, width: CGFloat) {
        super.init()
        
        let spacing: CGFloat = 20
        let padding: CGFloat = spacing/2
        let insets = UIEdgeInsetsMake(padding, padding, padding, padding)
        
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
    
    let kIconColor = UIColor(red: 63/255, green: 139/255, blue: 199/255, alpha: 1)
    let kBackgroundColor = UIColor(red: 57/255, green: 125/255, blue: 178/255, alpha: 1)
    let kIdentifier = "identifier"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = kBackgroundColor
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
           cell.imageView.image = icon.image(ofSize: layout.estimatedItemSize, color: kIconColor)
        }
        
        return cell
    }
}

class IconicHeaderView : UIView {
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: 1777, height: 350)
        super.init(frame: frame)
        
        let layout = IconCollectionViewLayout(columns: 40, width: frame.width)
        let collectionView = IconCollectionView(frame: frame, collectionViewLayout: layout)
        addSubview(collectionView)

        let label = UILabel(frame: frame)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 150)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        let title = "Iconic\n"
        let subtitle = "Render vector icons, natively."
        
        let titleAttributes = [NSFontAttributeName: UIFont.init(name: "Menlo", size: 150),
                               NSForegroundColorAttributeName: UIColor.white]
        
        let subtitleAttributes = [NSFontAttributeName: UIFont.init(name: "Menlo", size: 60),
                                  NSForegroundColorAttributeName: UIColor.white]
        
        var titleString = NSAttributedString(string: title, attributes: titleAttributes)
        var subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(titleString)
        attributedText.append(subtitleString)
        
        label.attributedText = attributedText
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let view = IconicHeaderView()

// Shows the final render in the Assisstant Editor
PlaygroundPage.current.liveView = view


