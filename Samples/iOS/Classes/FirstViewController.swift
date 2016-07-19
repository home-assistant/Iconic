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

    let cellIconSize = CGSizeMake( 22.0, 22)
    let iconFontType: IconFont.Type = FontAwesomeIcon.self
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
        
        let bookImage = FontAwesomeIcon.Book.image(size: CGSizeMake(20, 20), color:.greenColor())
        let cogImage = FontAwesomeIcon.Cog.image(size: CGSizeMake(30, 24), color:.blueColor())
        
        let tabItem = UITabBarItem(title: "Catalog", image: bookImage, tag: FontAwesomeIcon.Book.rawValue)
        
        self.title = tabItem.title;
        self.tabBarItem = tabItem;
        
        let buttonItem = UIBarButtonItem(image: cogImage, style:.Plain, target: self, action: NSSelectorFromString("didTapRightItem"))
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTitleView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func didTapRightItem() {
        // Do something
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconFontType.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("Cell") {
            
            if let icon = FontAwesomeIcon(rawValue: indexPath.row) {
                cell.imageView?.image = icon.image(size: cellIconSize, color: tableView.tintColor)
                cell.imageView?.highlightedImage = icon.image(size: cellIconSize, color: .whiteColor())
                
                cell.textLabel?.text = icon.name
                
                let unicode = icon.unicode
                if let unicodedData = unicode.dataUsingEncoding(NSNonLossyASCIIStringEncoding),
                    unicodeString = String(data: unicodedData, encoding: NSUTF8StringEncoding) {
                    cell.detailTextLabel?.text = unicodeString
                    
                }
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.setSelected(false, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellIconSize.height + cellIconSize.height * 1.2
    }
    
    override func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        if action == #selector(NSObject.copy(_:)) {
            return true
        }
        return false
    }
    
    override func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        // Copy
        if let icon = FontAwesomeIcon(rawValue: indexPath.row) {
            let pasteboard = UIPasteboard.generalPasteboard()
            let string = icon.name
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
        
        let icon = FontAwesomeIcon(rawValue: self.tabBarItem.tag)
        let color = self.view.tintColor
        let titleSize = CGFloat(20)
        let edgeInsets = UIEdgeInsetsMake(0, 0, 0, titleSize/2)
        
        let iconString = icon?.attributedString(pointSize: titleSize, color: color, edgeInsets: edgeInsets)
        
        let attributes = [NSForegroundColorAttributeName: color,
                          NSFontAttributeName: UIFont.systemFontOfSize(titleSize)]
        
        let labelString = NSMutableAttributedString(string: title, attributes: attributes)
        labelString.insertAttributedString(iconString!, atIndex: 0)
        
        let label = UILabel()
        label.attributedText = labelString
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
}