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

    let cellIconSize:CGSize = CGSize(width: 22, height: 22)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
        
        let tabItem = UITabBarItem(withIcon: .Book, size: CGSize(width: 20, height: 20), title: "Catalog")
        
        self.title = tabItem.title;
        self.tabBarItem = tabItem;
        
        let buttonItem = UIBarButtonItem(withIcon: .Cog, size: CGSize(width: 24, height: 24), target: self, action: #selector(didTapRightItem))
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
        return FontAwesomeIcon.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("Cell") {
            
            if let icon = FontAwesomeIcon(rawValue: indexPath.row) {
                
                cell.imageView?.image = icon.image(ofSize: cellIconSize, color: tableView.tintColor)
                cell.imageView?.highlightedImage = icon.image(ofSize: cellIconSize, color: UIColor.whiteColor())
                
                cell.textLabel?.text = icon.name
                
                if let unicodedData = icon.unicode.dataUsingEncoding(NSNonLossyASCIIStringEncoding),
                    let unicodeString = String(data: unicodedData, encoding: NSUTF8StringEncoding) {
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
        let height = cellIconSize.height
        return height + height*1.2
    }
    
    override func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        if action == #selector(self.copy(_:)) {
            return true
        }
        return false
    }
    
    override func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        // Copy
        if let icon = FontAwesomeIcon(rawValue: indexPath.row) {
            let pasteboard = UIPasteboard.generalPasteboard()
            
            pasteboard.string = icon.name
            print("Copied '\(icon.name)' to paste board!")
        }
    }
}

extension UIViewController {
    
    func updateTitleView() {
        
        guard let title = self.title else {
            return
        }
        
        let icon = FontAwesomeIcon(rawValue: self.tabBarItem.tag)!
        let color = self.view.tintColor ?? UIColor.blueColor()
        let titleSize = CGFloat(20)
        let edgeInsets = UIEdgeInsetsMake(0, 0, 0, titleSize/2)
        
        
        let attributes = [NSForegroundColorAttributeName: color,
                          NSFontAttributeName: UIFont.systemFontOfSize(titleSize)] as [String : AnyObject]
        
        let mString = NSMutableAttributedString(string: title, attributes: attributes)
        
        let iconString = icon.attributedString(ofSize: titleSize, color: color, edgeInsets: edgeInsets)
        mString.insertAttributedString(iconString, atIndex: 0)
        
        let label = UILabel()
        label.attributedText = mString
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
}
