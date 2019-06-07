//
//  MandatePopupListVC.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 13/05/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class MandatePopupListVC: UIViewController {
    
    class var mainStoryboard: UIStoryboard { get { return UIStoryboard(name: "Main", bundle: nil) } }
    
    class var newInstance: MandatePopupListVC {
        get { return  MandatePopupListVC.mainStoryboard.instantiateViewController(withIdentifier: "MandatePopupListVC") as! MandatePopupListVC }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        
    }
    
    func showPopup(type: UPIMandatePopupType, withTitle title: String, subtitle: String, buttonTitle: String) {
        let vc = UPIMPopupVC.newInstance
        vc.popupType = type
        vc.delegate = self
        present(vc, animated: true) {
            vc.setDataInView(title: title, subtitle: subtitle, buttonTitle: buttonTitle)
        }
    }
    
    @IBAction func processingAction(_ sender: Any) {
        showPopup(type: .processing, withTitle: "Processing", subtitle: "", buttonTitle: "")
    }
    
    @IBAction func scheduleSuccessAction(_ sender: Any) {
        showPopup(type: .scheduleSuccess, withTitle: "Scheduled payment updated for uber India. Pvt. Ltd.", subtitle: "", buttonTitle: "")
    }
    
    @IBAction func receiveSuccessAction(_ sender: Any) {
        showPopup(type: .receiveSuccess, withTitle: "₹300 Received", subtitle: "IN YOUR\nState Bank of India XX 8241", buttonTitle: "")
    }
    
    @IBAction func failedAction(_ sender: Any) {
        showPopup(type: .failed, withTitle: "Update of payment failed for Uber India Pvt. Ltd.", subtitle: "Update failed due to some technical error Please try again later", buttonTitle: "Retry")
    }
    
    @IBAction func pendingAction(_ sender: Any) {
        showPopup(type: .pending, withTitle: "Processing update of payment for uber India Pvt. Ltd.", subtitle: "It may take upto 2 hours to update your scheduled payment request", buttonTitle: "")
    }
    
    @IBAction func declinedAction(_ sender: Any) {
        showPopup(type: .declined, withTitle: "Payment has been declined", subtitle: "", buttonTitle: "Ok")
    }
    
    @IBAction func confirmationAction(_ sender: Any) {
        showPopup(type: .none, withTitle: "", subtitle: "", buttonTitle: "")
    }
    
    @IBAction func impUpdatesAction(_ sender: Any) {
        showPopup(type: .none, withTitle: "", subtitle: "", buttonTitle: "")
    }
    
    @IBAction func mandateExpiredAction(_ sender: Any) {
        showPopup(type: .none, withTitle: "", subtitle: "", buttonTitle: "")
    }
    
    @IBAction func mandateOutOfRangeAction(_ sender: Any) {
        showPopup(type: .none, withTitle: "", subtitle: "", buttonTitle: "")
    }
}

extension MandatePopupListVC : UPIMPopupDelegate {
    func didTappedActionButton(forPopupType type: UPIMandatePopupType) {
        switch type {
        case .declined:
            print(("Declined popup button tapped"))
            break
        case .failed:
            //Retry Action
            print(("Failed popup button tapped"))
            break
        default:
            break
        }
    }
}
