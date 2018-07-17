//
//  CardyViewCell.swift
//  CardyViewDemo
//
//  Created by 박길남 on 2018. 7. 17..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import UIKit

struct cellData {
    var icon:UIImage?
    var title:String?
    var contents:UIImage?
    
    init(icon:UIImage? = nil, title:String? = nil, contents:UIImage? = nil) {
        self.icon = icon
        self.title = title
        self.contents = contents
    }
}

class CardyViewCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        cardViewFrame()
        cellBackgroundView.roundedAllCorners(cornerRadius: 10)
        
        iconImageView.circleImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
