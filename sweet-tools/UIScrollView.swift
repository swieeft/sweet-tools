//
//  UIScrollView.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    public func pageScrollViewInitlize() {
        isPagingEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        scrollsToTop = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func addPageViews(views:[UIView]) {
        
        var newFrame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<views.count {
            newFrame.origin.x = frame.size.width * CGFloat(index)
            newFrame.size.width = frame.size.width
            newFrame.size.height = frame.size.height
            
            views[index].frame =  newFrame
            addSubview(views[index])
        }
        
        let width = frame.size.width * CGFloat(views.count)
        let height = frame.size.height
        
        contentSize = CGSize(width: width, height: height)
    }
}
