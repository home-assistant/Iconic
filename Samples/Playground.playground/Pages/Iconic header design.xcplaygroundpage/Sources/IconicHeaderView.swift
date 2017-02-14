
import Iconic

public struct IconicHeaderConfig {
    
    var columns: Int
    var spacing: CGFloat
    var angle: Double
    
    var foregroundColor: UIColor
    var backgroundColor: UIColor
    var titleColor: UIColor
    var subtitleColor: UIColor
    
    var titleFont: UIFont
    var subtitleFont: UIFont
    
    var title: String
    var subtitle: String
    
    public init(columns: Int, spacing: CGFloat, angle: Double, foregroundColor: UIColor, backgroundColor: UIColor, titleColor: UIColor, subtitleColor: UIColor, titleFont: UIFont, subtitleFont: UIFont, title: String, subtitle: String) {
        self.columns = columns
        self.spacing = spacing
        self.angle = angle
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.title = title
        self.subtitle = subtitle
    }
}

public class IconicHeaderView: UIView {
    
    weak var iconProvider: IconProviderDelegate?
    
    var collectionView: IconCollectionView
    var titleLabel: UILabel
    var config: IconicHeaderConfig
    
    public init(frame: CGRect, config: IconicHeaderConfig, iconProvider: IconProviderDelegate?) {
        
        self.iconProvider = iconProvider
        self.config = config
        
        let layout = IconCollectionViewLayout(columns: config.columns, spacing: config.spacing, width: frame.size.width)
        
        collectionView = IconCollectionView(frame: frame, collectionViewLayout: layout, iconProvider: iconProvider)
        collectionView.iconColor = config.foregroundColor
        collectionView.backgroundColor = config.backgroundColor
        
        titleLabel = UILabel(frame: frame)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
            
        super.init(frame: frame)
        
        configureLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 40
        
        let titleAttributes: [String:Any] = [NSFontAttributeName: config.titleFont,
                                             NSForegroundColorAttributeName: UIColor.white]
        
        let subtitleAttributes: [String:Any] = [NSFontAttributeName: config.subtitleFont,
                                                NSForegroundColorAttributeName: UIColor.white]
        
        let titleString = NSAttributedString(string: config.title + "\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: config.subtitle, attributes: subtitleAttributes)
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(titleString)
        attributedText.append(subtitleString)
        
        titleLabel.attributedText = attributedText
        
        addSubview(collectionView)
        addSubview(titleLabel)
        
        if config.angle != 0 {
            let radian = CGFloat(config.angle*(M_PI/180))
            collectionView.transform = CGAffineTransform(rotationAngle: radian)
            
            let gap = CGFloat(200.0)
            
            let viewFrame = CGRect(x: -gap/4, y: 0.0, width: frame.width + gap, height: (frame.height * 2) + gap)
            collectionView.frame = viewFrame
        }
    }
}

class IconCollectionView: UICollectionView, UICollectionViewDataSource {
    
    weak var iconProvider: IconProviderDelegate?
    
    var iconColor: UIColor? {
        didSet {
            self.reloadData() // reloads all icons
        }
    }
    
    let kIdentifier = "identifier"
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, iconProvider: IconProviderDelegate?) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        iconColor = UIColor.gray
        backgroundColor = UIColor.darkGray
        
        self.iconProvider = iconProvider
        self.dataSource = self
        self.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: kIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let iconProvider = iconProvider {
            return iconProvider.numberOfIcons()
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kIdentifier, for: indexPath) as! IconCollectionViewCell
        let layout = collectionView.collectionViewLayout as! IconCollectionViewLayout
        
        if let iconProvider = iconProvider {
            let image = iconProvider.iconImage(forRow: indexPath.row, size: layout.estimatedItemSize, color: iconColor ?? .black)
            cell.imageView.image = image
        }
        
        return cell
    }
}
