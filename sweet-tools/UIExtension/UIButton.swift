//
//  UIButton.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    public func setImageTint(color:UIColor) {
        let origImage = image(for: .normal)
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        setImage(tintedImage, for: .normal)
        tintColor = color
    }
    
    public func circleButton() {
        clipsToBounds = true
        layer.cornerRadius = 0.5 * bounds.size.width
    }
    
    public func roundedButton(){
        clipsToBounds = true
        layer.cornerRadius = 0.5 * bounds.size.height
    }
}

