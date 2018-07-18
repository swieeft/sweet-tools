//
//  ViewControllerExtension.swift
//  CardyViewDemo
//
//  Created by 박길남 on 2018. 7. 17..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CardyViewCell
        
        let data = cellDatas[indexPath.row]
        
        if let icon = data.icon {
            cell.iconImageView.image = icon
        }
        
        if let title = data.title {
            cell.titleLabel.text = title
        }
        
        if let contents = data.contents {
            cell.contentsImageView.image = contents
        }
        
        return cell
    }
}
