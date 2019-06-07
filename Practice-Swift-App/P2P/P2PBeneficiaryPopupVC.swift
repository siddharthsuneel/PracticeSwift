//
//  P2PBeneficiaryPopupVC.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 06/06/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class P2PBeneficiaryPopupVC: UIViewController {
    
    //MARK: Outlets & Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var beneficiaryStackView: UIStackView!
    @IBOutlet weak var beneficiaryContentView: UIView!
    @IBOutlet weak var beneficiaryPhoneLabel: UILabel!
    @IBOutlet weak var beneficiaryNameLabel: UILabel!
    @IBOutlet weak var footerButton: UIButton!
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Methods
    private func setup() {
        
    }

    private func shouldHideBeneficiaryView(_ state: Bool) {
        beneficiaryStackView.isHidden = state
    }
    
    //MARK: IBAction
    @IBAction func cancelButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func footerButtonAction(_ sender: Any) {
        
    }
    
    
    //MARK: Public Methods
    func configureForAddBeneficiaryView() {
        shouldHideBeneficiaryView(true)
    }
    
    func configureForCoolingView() {
        shouldHideBeneficiaryView(false)
    }
    
    func setDataInView() {
        titleLabel.text = ""
        subtitleLabel.text = ""
        beneficiaryPhoneLabel.text = ""
        beneficiaryNameLabel.text = ""
        footerButton.setTitle("", for: .normal)
    }
    
}
