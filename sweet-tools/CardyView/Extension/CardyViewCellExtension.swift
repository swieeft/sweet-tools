//
//  CardyViewCellExtension.swift
//  sweet-tools
//
//  Created by 박길남 on 2018. 7. 17..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    public func initCardyView(selectionStyle style:UITableViewCellSelectionStyle = .none, backgroundColor color:UIColor = .clear, shadowOffset:CGSize = CGSize(width: 0, height: 0), shadowColor:UIColor = .black, shadowOpacity:Float = 0.3, shadowRadius:CGFloat = 3) {
        selectionStyle = style
        backgroundColor = color
        
        contentView.layer.masksToBounds = false
        contentView.layer.shadowOffset = shadowOffset
        contentView.layer.shadowColor = shadowColor.cgColor
        contentView.layer.shadowOpacity = shadowOpacity
        contentView.layer.shadowRadius = shadowRadius
    }
    
    public static func register(tableView: UITableView) {
        let Nib = UINib(nibName: self.NibName, bundle: nil)
        tableView.register(Nib, forCellReuseIdentifier: self.reuseIdentifier)
        
        Logger.debug(message: "nibName:\(self.NibName), identifier:\(self.reuseIdentifier) register")
    }
    
    public static func dequeueReusableCell(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) else {
            Logger.error(message: "Error! \(self.reuseIdentifier)")
            fatalError("Error! \(self.reuseIdentifier)")
        }
        
        Logger.debug(message: "dequeue cell : \(self.reuseIdentifier)")
        
        return cell
    }
}

extension UITableViewCell: ReusableView {
    
}

extension UITableViewCell: NibLoadableView {
    
}


extension ReusableView where Self: UIView {
    internal static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension NibLoadableView where Self: UIView {
    internal static var NibName: String {
        return String(describing: self)
    }
}
