//
//  UPIMKnowMoreCell.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 09/05/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class UPIMKnowMoreCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataInCell(titleText: String, subtitleText: String) {
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
        
        setNeedsLayout()
    }

    
}
