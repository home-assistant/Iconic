import UIKit

class IconCollectionViewLayout: UICollectionViewFlowLayout {
    
    init(columns: Int = 30, spacing: CGFloat = 20.0, width: CGFloat = 44.0) {
        super.init()
        
        let insets = UIEdgeInsets(top: -spacing, left: -spacing, bottom: -spacing, right: -spacing)
        
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
