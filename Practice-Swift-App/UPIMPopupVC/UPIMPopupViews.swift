//
//  UPIMPopupViews.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 13/05/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import Foundation
import UIKit

class MandateScheduleSuccess: UIView {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var headerImgView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImgView.layer.cornerRadius = headerImgView.frame.height / 2.0
    }
    
    func setDataInView(imageName: String, text: String) {
        headerImgView.image = UIImage.init(named: imageName)
        textLabel.text = text
        setNeedsLayout()
    }
}

class MandateReceiveSuccess: UIView {
    
    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var bankDetailLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImgView.layer.cornerRadius = headerImgView.frame.height / 2.0
    }
    
    func setDataInView(imageName: String, amount: String, bankDetail: String) {
        headerImgView.image = UIImage.init(named: imageName)
        amountLabel.text = amount
        bankDetailLabel.text = bankDetail
        
        setNeedsLayout()
    }
}

class MandateFailed: UIView {
    
    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorDetailLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImgView.layer.cornerRadius = headerImgView.frame.height / 2.0
    }
    
    func setDataInView(imageName: String, title: String, errorDetail: String) {
        headerImgView.image = UIImage.init(named: imageName)
        titleLabel.text = title
        errorDetailLabel.text = errorDetail
        
        setNeedsLayout()
    }
    
    @IBAction func didTappedRetry(_ sender: Any) {
        
    }
}

class MandatePending: UIView {
    
    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailMsgLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImgView.layer.cornerRadius = headerImgView.frame.height / 2.0
    }
    
    func setDataInView(imageName: String, title: String, detail: String) {
        headerImgView.image = UIImage.init(named: imageName)
        titleLabel.text = title
        detailMsgLabel.text = detail
        
        setNeedsLayout()
    }
}

class MandateDeclined: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    
    @IBAction func didTappedOk(_ sender: Any) {
        
    }
}

class MandateConfirmation: UIView {
    
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var declineBtn: UIButton!
    @IBOutlet weak var payerNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var validaityLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        crossBtn.layer.cornerRadius = crossBtn.frame.height / 2.0
    }
    
    @IBAction func didTappedCancelButton(_ sender: Any) {
        
    }
    
    @IBAction func didTappedDeclineButton(_ sender: Any) {
        
    }
}
