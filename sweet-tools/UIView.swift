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
                                cornerRadii: CGSize(width: cornerWidth, height: cornerHeight))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
    
    public func roundedAllCorners(superView:UIView, cornerWidth:CGFloat, cornerHeight:CGFloat) {
        roundedSelectedCorners(superView: superView, corner: UIRectCorner.allCorners, cornerWidth: cornerWidth, cornerHeight: cornerHeight)
    }
}
