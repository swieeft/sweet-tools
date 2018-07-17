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
    func initialCardyView(backgroundColor:UIColor = UIColor.clear, spearatorStyle cellSpearatorStyle:UITableViewCellSeparatorStyle = .none) {
        self.backgroundColor = backgroundColor
        self.separatorStyle = cellSpearatorStyle
    }
    
    func register<T:UITableViewCell>(_: T.Type, bundle:Bundle? = nil) {
        let nib = UINib(nibName: T.NibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuserIdentifier)
    }
    
    func dequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuserIdentifier, for: indexPath) as? T else {
            fatalError("Error! \(T.reuserIdentifier)")
        }
        
        return cell
    }
}
