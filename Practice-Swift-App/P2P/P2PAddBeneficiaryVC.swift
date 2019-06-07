//
//  P2PAddBeneficiaryVC.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 07/06/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

enum P2PBeneficiaryPopupType {
    case addBeneficiary
    case otpConfirmation
    case processing
    case success
    case failed
    case coolingPeriod
    case none
    
    func getHeaderImage() ->  UIImage {
        switch self {
        case .processing:
            return UIImage()
        default:
            return UIImage()
        }
    }
}

class P2PAddBeneficiaryVC: UIViewController {

    //MARK: Outlets & Variables
    @IBOutlet weak var addBeneficiaryStackView: UIStackView!
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var responseStackView: UIStackView!
    @IBOutlet weak var bottomStripView: UIView!
    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    
    //Add Beneficiary
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var beneficiaryDetailStackView: UIStackView!
    @IBOutlet weak var beneficiaryPhoneLbl: UILabel!
    @IBOutlet weak var beneficiaryNameLbl: UILabel!
    @IBOutlet weak var addBeneficiaryButton: UIButton!
    
    //OTP View
    @IBOutlet weak var msgLbl: UILabel!
    
    //Response pop
    @IBOutlet weak var respTitleLbl: UILabel!
    @IBOutlet weak var respImgView: UIImageView!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var impNoteLbl: UILabel!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var paymentSettingLbl: UIView!
    
    class var p2pStoryboard: UIStoryboard {
        get { return UIStoryboard(name: "P2P", bundle: nil) }
    }
    class var newInstance: P2PAddBeneficiaryVC {
        return  P2PAddBeneficiaryVC.p2pStoryboard.instantiateViewController(withIdentifier: "P2PAddBeneficiaryVC") as! P2PAddBeneficiaryVC
    }
    
    var viewTpe: P2PBeneficiaryPopupType = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.constant = -500
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewBottom.constant = 0
        animate(completion:nil)
    }
    
    //MARK: Private Methods
    private func setup() {
        switch viewTpe {
        case .addBeneficiary, .coolingPeriod:
            otpView.isHidden = true
            responseStackView.isHidden = true
            addBeneficiaryStackView.isHidden = false
            bottomStripView.isHidden = false
            break
        case .otpConfirmation:
            otpView.isHidden = false
            responseStackView.isHidden = true
            addBeneficiaryStackView.isHidden = true
            bottomStripView.isHidden = true
            break
        case .processing, .success, .failed:
            otpView.isHidden = true
            responseStackView.isHidden = false
            addBeneficiaryStackView.isHidden = true
            bottomStripView.isHidden = false
            break
        default:
            break
        }
    }
    
    private func refreshView() {
        setup()
        view.layoutIfNeeded()
    }
    
    private func animate(completion:((Bool) -> Void)?){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.view.layoutIfNeeded()
        }, completion:completion)
    }
    
    //MARK: Public Methods
    func setViewType(_ type: P2PBeneficiaryPopupType) {
        viewTpe = type
    }
    
    //IBActions
    @IBAction func dismissAction(_ sender: Any) {
        viewBottom.constant = -500
        animate { (complete) in
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    @IBAction func addBeneficiaryAction(_ sender: Any) {
        viewTpe = .otpConfirmation
        refreshView()
    }
    
    @IBAction func confirmOTPButton(_ sender: Any) {
        viewTpe = .processing
        refreshView()
    }
    
    @IBAction func retryButtonAction(_ sender: Any) {
        viewTpe = .success
        refreshView()
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        viewTpe = .failed
        refreshView()
    }
}
