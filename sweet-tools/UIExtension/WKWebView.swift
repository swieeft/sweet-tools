//
//  WKWebView.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit
import WebKit

extension WKWebView {
    public func load(url urlStr:String) {
        let url = URL (string: urlStr)
        let request = URLRequest(url: url!)
        load(request)
    }
    
    public func anchorSetting(view:UIView, leading:Bool = true, trailing:Bool = true, top:Bool = true, bottom:Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraint:[NSLayoutConstraint] = []
        
        if leading { constraint.append(leadingAnchor.constraint(equalTo: view.leadingAnchor)) }
        if trailing { constraint.append(trailingAnchor.constraint(equalTo: view.trailingAnchor)) }
        if top { constraint.append(topAnchor.constraint(equalTo: view.topAnchor)) }
        if bottom { constraint.append(bottomAnchor.constraint(equalTo: view.bottomAnchor)) }
        
        NSLayoutConstraint.activate(constraint)
    }
}
