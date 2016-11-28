
import PlaygroundSupport
import Iconic

// First of all, we must registering the icon font
FontAwesomeIcon.register()

let iconColor = UIColor.orange
let backgroundColor = UIColor.red

class IconCollectionViewLayout : UICollectionViewFlowLayout {
    
    var columns: uint
    
    init(columns: uint) {
        
        self.columns = columns

        super.init()
        
        let viewWidth:CGFloat = 600
        let spacing:CGFloat = 20
        let insets = UIEdgeInsetsMake(spacing, spacing, spacing, spacing)
        
        let viewGaps = (CGFloat(columns-1) * spacing) + insets.left + insets.right
        let itemWidth = (viewWidth - viewGaps) / CGFloat(columns)
        
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

class IconCollectionViewController : UICollectionViewController {
    
    let cellIdentifier = "cell"
    
    init() {
        super.init(collectionViewLayout: IconCollectionViewLayout(columns: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = backgroundColor
        collectionView?.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FontAwesomeIcon.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! IconCollectionViewCell
        
        let layout = collectionView.collectionViewLayout as! IconCollectionViewLayout
        
        if let icon = FontAwesomeIcon(rawValue: indexPath.row) {
           cell.imageView.image = icon.image(ofSize: layout.estimatedItemSize, color: iconColor)
        }
        
        
        return cell
    }
}

let view = IconCollectionViewController().view

PlaygroundPage.current.liveView = view
