//
//  CGFloat.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    public var decimalFormatString: String {
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        
        guard let string = formatter.string(for: self) else {
            return ""
        }
        
        return string
    }
}
