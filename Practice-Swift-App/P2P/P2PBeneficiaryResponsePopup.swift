//
//  P2PBeneficiaryResponsePopup.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 06/06/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

enum UPIBeneficiaryResponsePopupType {
    case none
    case processing
    case success
    case failed        
    
    func getHeaderImage() ->  UIImage {
        switch self {
        case .processing:
            return UIImage()
        default:
            return UIImage()
        }
    }
}

protocol P2PBeneficiaryResponsePopupDelegate: class {
    func didTappedActionButton(forPopupType type: UPIBeneficiaryResponsePopupType)
}

class P2PBeneficiaryResponsePopup: UIViewController {
    
    //MARK: Outlets & Variables
    @IBOutlet weak var headerStackView: UIStackView!
    @IBOutlet weak var loaderContentView: UIView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var imageContentView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionStackView: UIStackView!
    @IBOutlet weak var descriptionPrimaryLabel: UILabel!
    @IBOutlet weak var descriptionSecondaryLabel: UILabel!
    @IBOutlet weak var footerButton: UIButton!
    
    //Variable
    var popupType: UPIBeneficiaryResponsePopupType = .none
    weak var delegate: P2PBeneficiaryResponsePopupDelegate?
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Methods
    private func setup() {
        switch popupType {
        case .processing:
            imageContentView.isHidden = true
            footerButton.isHidden = true
            descriptionStackView.isHidden = true
            break
        case .success:
            loaderContentView.isHidden = true
            footerButton.isHidden = true
            descriptionStackView.isHidden = true
            break
        case .failed:
            loaderContentView.isHidden = true
            break
        default:
            footerButton.isHidden = true
            descriptionStackView.isHidden = true
            titleLabel.isHidden = true
            headerStackView.isHidden = true
            break
        }
    }
    
    
    //MARK: IBAction
    @IBAction func footerButtonAction(_ sender: Any) {
        delegate?.didTappedActionButton(forPopupType: popupType)
    }
    
    //MARK: Public Methods
    
    func setDataInView() {
        
    }
}
