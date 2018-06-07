//
//  UITabelViewCell.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    public func cardViewFrame() {
        selectionStyle = .none
        backgroundColor = UIColor.clear
        
        contentView.layer.masksToBounds = false
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 3
    }
}
