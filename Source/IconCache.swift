//
//  IconCache.swift
//  https://github.com/dzenbot/Iconic
//
//  Created by Ignacio Romero on 7/28/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import UIKit

extension IconDrawable {
    
    func getImage(forItem item: IconItem) -> UIImage? {
        
        let key = item.hashString
        print("Getting \(item.icon.name) for key: \(key)")

        return IconCache.image(forKey: key)
    }
    
    func setImage(_ image: UIImage, forItem item: IconItem) {
        
        let key = item.hashString
        IconCache.setImage(image, forKey: key)
    }
}

struct IconItem {
    let icon: IconDrawable
    let size: CGSize
    let color: UIColor
    let edgeInsets: UIEdgeInsets
    
    init(icon: IconDrawable, size: CGSize, color: UIColor?, edgeInsets: UIEdgeInsets) {
        self.icon = icon
        self.size = size
        self.color = color ?? .clear
        self.edgeInsets = edgeInsets
    }
}

extension IconItem: Hashable {
    
    var hashString: String {
        return String(hashValue)
    }
    
    var hashValue: Int {
        return icon.unicode.hashValue ^ size.width.hashValue ^ size.height.hashValue ^ color.hashValue ^ Int(edgeInsets.left) ^ Int(edgeInsets.right) ^ Int(edgeInsets.top) ^ Int(edgeInsets.bottom)
    }
    
    static func == (lhs: IconItem, rhs: IconItem) -> Bool {
        return lhs.icon.unicode == rhs.icon.unicode
    }
}

fileprivate class IconCache: NSCache<AnyObject, AnyObject> {
    
    static let shared = IconCache()
    
    private override init() {
        super.init()
        countLimit = 100 // items in memory
        totalCostLimit = 1*1024*1024 // memory space
    }
    
    class func image(forKey key: String) -> UIImage? {
        return shared.object(forKey: key as AnyObject) as? UIImage
    }
    
    class func setImage(_ img: UIImage, forKey key: String) {
        shared.setObject(img, forKey: key as AnyObject)
    }
}
