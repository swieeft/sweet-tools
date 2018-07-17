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
}

extension UITableViewCell: ReusableView {
    
}

extension UITableViewCell: NibLoadableView {
    
}


extension ReusableView where Self: UIView {
    internal static var reuserIdentifier: String {
        return String(describing: self)
    }
}

extension NibLoadableView where Self: UIView {
    internal static var NibName: String {
        return String(describing: self)
    }
}
