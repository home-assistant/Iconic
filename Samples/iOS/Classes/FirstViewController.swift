//
//  FirstViewController.swift
//  Example
//
//  Created by Ignacio Romero on 5/22/16.
//  Copyright © 2016 DZN Labs All rights reserved.
//

import UIKit
import Iconic

class FirstViewController: UITableViewController {

    let cellIconSize:CGFloat = 22
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
        
        let tabItem = UITabBarItem(icon: .book, size:20, title: "Catalog", tag: Icon.book.rawValue)
        
        self.title = tabItem.title;
        self.tabBarItem = tabItem;
        
        let buttonItem = UIBarButtonItem(icon: .cog, size:24, target: self, action: #selector(didTapRightItem))
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTitleView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func didTapRightItem() {
        // Do something
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Icon.totalCount.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            
            if let icon = Icon(rawValue: indexPath.row) {
                cell.imageView?.image = Iconic.image(forIcon: icon, size: cellIconSize, color: tableView.tintColor)
                cell.imageView?.highlightedImage = Iconic.image(forIcon: icon, size: cellIconSize, color: UIColor.white)
                
                cell.textLabel?.text = NSStringFromIcon(icon)

                if let unicode = Iconic.unicodeString(forIcon: icon),
                    let unicodedData = unicode.data(using: String.Encoding.nonLossyASCII),
                    let unicodeString = String(data: unicodedData, encoding: String.Encoding.utf8) {
                    cell.detailTextLabel?.text = unicodeString
                }
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellIconSize + cellIconSize*1.2
    }
    
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if action == #selector(self.copy(_:)) {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        // Copy
        if let icon = Icon(rawValue: indexPath.row) {
            let pasteboard = UIPasteboard.general
            let string = NSStringFromIcon(icon)
            
            pasteboard.string = string
            print("Copied '\(string)' to paste board!")
        }
    }
}

extension UIViewController {
    
    func updateTitleView() {
        
        guard let title = self.title else {
            return
        }
        
        let icon = Icon(rawValue: self.tabBarItem.tag)
        let color = self.view.tintColor ?? UIColor.blue
        let titleSize = CGFloat(20)
        let edgeInsets = UIEdgeInsetsMake(0, 0, 0, titleSize/2)
        
        
        let attributes = [NSForegroundColorAttributeName: color,
                          NSFontAttributeName: UIFont.systemFont(ofSize: titleSize)] as [String : Any]
        
        let mString = NSMutableAttributedString(string: title, attributes: attributes)
        
        if let iconString = Iconic.attributedString(forIcon: icon!, size: titleSize, color: color, edgeInsets: edgeInsets) {
            mString.insert(iconString, at: 0)
        }
        
        let label = UILabel()
        label.attributedText = mString
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
}
