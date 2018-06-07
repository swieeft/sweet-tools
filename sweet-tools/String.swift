//
//  String.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
