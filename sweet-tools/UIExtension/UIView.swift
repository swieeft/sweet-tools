//
//  UIView.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func roundedSelectedCorners(superView:UIView, corner:UIRectCorner, cornerWidth:CGFloat, cornerHeight:CGFloat){
        clipsToBounds = true
        
        let path = UIBezierPath(roundedRect: superView.bounds,
                                byRoundingCorners: corner,
                                cornerRadii: CGSize(width: 15, height: 10))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
    
    public func roundedAllCorners(cornerRadius:CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
