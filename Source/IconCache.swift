//
//  IconCache.swift
//  https://github.com/dzenbot/Iconic
//
//  Created by Ignacio Romero on 7/28/16.
//  Copyright © 2017 DZN. All rights reserved.
//

import UIKit

/** Adds internal image caching implementation. */
extension IconDrawable {
    
    func getCacheImage(forItem item: IconItem) -> UIImage? {
        
        let key = item.hashString
        let cache = IconCache.shared
        
        guard let image = cache.object(forKey: key as AnyObject) as? UIImage else {
            return nil
        }
        
        return image
    }
    
    func setCacheImage(_ image: UIImage, forItem item: IconItem) {
        
        let key = item.hashString
        let cache = IconCache.shared
        
        cache.setObject(image, forKey: key as AnyObject)
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
       return "\(icon.unicode),\(size),\(color.hashValue),\(edgeInsets)".hashValue
    }
    
    static func == (lhs: IconItem, rhs: IconItem) -> Bool {
        return lhs.icon.unicode == rhs.icon.unicode &&
               lhs.size.width == rhs.size.width &&
               lhs.size.height == rhs.size.height
    }
}

fileprivate class IconCache: NSCache<AnyObject, AnyObject> {
    
    static let shared = IconCache()
    
    private override init() {
        super.init()
        countLimit = 100 // items in memory
        totalCostLimit = 1 * 1024 * 1024 // memory space
    }
}
