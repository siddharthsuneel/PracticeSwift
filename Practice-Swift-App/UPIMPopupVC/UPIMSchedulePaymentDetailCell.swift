//
//  UPIMSchedulePaymentDetailCell.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 17/05/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class UPIMSchedulePaymentDetailCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var rrnNumberLabel: UILabel!
    @IBOutlet weak var bankImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.cornerRadius = 4.0
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.init(red: 226/255.0, green: 235/255.0, blue: 238/255.0, alpha: 1.0).cgColor
    }

    func setup() {
        selectionStyle = .none
    }
}

class UPIMSchedulePaymentTimelineCell: UITableViewCell {
    
    @IBOutlet weak var dotImgView: UIImageView!
    @IBOutlet weak var upperTimelineView: UIView!
    @IBOutlet weak var lowerTimelineView: UIView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setup() {
        selectionStyle = .none
    }
}
