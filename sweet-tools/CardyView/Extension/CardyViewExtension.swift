//
//  CardyViewExtension.swift
//  sweet-tools
//
//  Created by 박길남 on 2018. 7. 17..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    public func initialCardyView(backgroundColor:UIColor = UIColor.clear, spearatorStyle cellSpearatorStyle:UITableViewCellSeparatorStyle = .none) {
        self.backgroundColor = backgroundColor
        self.separatorStyle = cellSpearatorStyle
    }
    
    public func register<T:UITableViewCell>(_: T.Type, bundle:Bundle? = nil) {
        let nib = UINib(nibName: T.NibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error! \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
