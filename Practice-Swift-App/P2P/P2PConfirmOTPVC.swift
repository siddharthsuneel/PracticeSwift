//
//  P2PConfirmOTPVC.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 06/06/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class P2PConfirmOTPVC: UIViewController {

    //MARK: Outlets & Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var otpTF1: UITextField!
    @IBOutlet weak var otpTF2: UITextField!
    @IBOutlet weak var otpTF3: UITextField!
    @IBOutlet weak var otpTF4: UITextField!
    @IBOutlet weak var otpTF5: UITextField!
    @IBOutlet weak var otpTF6: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet var textfieldArray: [UITextField]!
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Methods
    private func setup() {
        setCustomDelegates()
        otpTF1.becomeFirstResponder()
        configureTextField()
    }
    
    private func configureTextField() {
        // Initialization code
        for otpTextfield in textfieldArray {
            otpTextfield.backgroundColor = UIColor.clear
            addBottomLayer(textField: otpTextfield)
//            otpTextfield.delegate = self
        }
    }
    
    func addBottomLayer(textField: UITextField){
        let layer = CALayer()
        layer.backgroundColor = UIColor.init(red: 224/255, green: 230/255, blue: 232/255, alpha: 1.0) .cgColor
        layer.frame = CGRect(x: 2.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        textField.layer.addSublayer(layer)
    }
    
    private func setCustomDelegates() {
//        otpTF1.jrPasscodeTextFieldDelegate = self
//        otpTF2.jrPasscodeTextFieldDelegate = self
//        otpTF3.jrPasscodeTextFieldDelegate = self
//        otpTF4.jrPasscodeTextFieldDelegate = self
//        otpTF5.jrPasscodeTextFieldDelegate = self
//        otpTF6.jrPasscodeTextFieldDelegate = self
    }
    
    //MARK: IBAction
    @IBAction func cancelButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func confirmButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func resendButtonAction(_ sender: Any) {
        
    }
    
    
    //MARK: Public Methods
    
    func setDataInView() {
        titleLabel.text = ""
        subtitleLabel.text = ""
    }
    
}

/*
extension P2PConfirmOTPVC : JRPasscodeTextFieldDelegate {
    
    private func txtBecomeResponder(textField: UITextField) {
        textField.becomeFirstResponder()
    }
    private func txtResigneResponder(textField: UITextField) {
        textField.resignFirstResponder()
        setPaytmThemeForOtp(textField,color: UIColor.gray)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > 6 || 5 == string.count || 4 == string.count || 3 == string.count || 2 == string.count {
            return false
        }
        
        if string.count == 6 {
//            return validateText(string:string)
            // check if all are numbers and assign it to each textFields
        }
        if ((textField.text?.count)! < 1) && (string.count > 0) {
            switch(textField){
            case otpTF1:
                txtBecomeResponder(textField: otpTF2)
            case otpTF2:
                txtBecomeResponder(textField: otpTF3)
            case otpTF3:
                txtBecomeResponder(textField: otpTF4)
            case otpTF4:
                txtBecomeResponder(textField: otpTF5)
            case otpTF5:
                txtBecomeResponder(textField: otpTF6)
            case otpTF6:
                txtBecomeResponder(textField: otpTF6)
            default:
                textField.text = string
                return true
            }
            textField.text = string
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            
            switch(textField){
            case otpTF2:
                txtBecomeResponder(textField: otpTF1)
            case otpTF3:
                txtBecomeResponder(textField: otpTF2)
            case otpTF4:
                txtBecomeResponder(textField: otpTF3)
            case otpTF5:
                txtBecomeResponder(textField: otpTF4)
            case otpTF6:
                txtBecomeResponder(textField: otpTF5)
            case otpTF1:
                txtBecomeResponder(textField: otpTF1)
                
            default:
                textField.text = string
                return true
            }
            textField.text = ""
            return false
            
        } else if ((textField.text?.count)! >= 1) {
            textField.text = string
            switch(textField){
            case otpTF1:
                txtBecomeResponder(textField: otpTF2)
            case otpTF2:
                txtBecomeResponder(textField: otpTF3)
            case otpTF3:
                txtBecomeResponder(textField: otpTF4)
            case otpTF4:
                txtBecomeResponder(textField: otpTF5)
            case otpTF5:
                txtBecomeResponder(textField: otpTF6)
            case otpTF6:
                txtBecomeResponder(textField: otpTF6)
            default:
                return true
            }
            return false
        }
        return true
    }
    
//    private func validateText( string : String) -> Bool {
//        if !string.isNumeric {
//            return false
//        }
//        if string.count == 6 {
//            otpTF1.text = string[0]
//            otpTF2.text = string[1]
//            otpTF3.text = string[2]
//            otpTF4.text = string[3]
//            otpTF5.text = string[4]
//            otpTF6.text = string[5]
//            txtBecomeResponder(textField: otpTF6)
//        }
//        return false
//    }
    
    func textFieldDidDeleteButtonPressed(_ textField : UITextField) {
        switch(textField){
        case otpTF2:
            otpTF1.text = nil
            txtBecomeResponder(textField: otpTF1)
        case otpTF3:
            otpTF2.text = nil
            txtBecomeResponder(textField: otpTF2)
        case otpTF4:
            otpTF3.text = nil
            txtBecomeResponder(textField: otpTF3)
        case otpTF5:
            otpTF4.text = nil
            txtBecomeResponder(textField: otpTF4)
        case otpTF6:
            otpTF5.text = nil
            txtBecomeResponder(textField: otpTF5)
        default:
            break
        }
    }
    
    private func border(textField: UITextField){
        let layer = CALayer()
        layer.name = textField.accessibilityLabel
        layer.frame = CGRect(x: 5.0, y: textField.frame.height - 2.0, width: textField.frame.size.width - 10.0, height: 2.0)
        layer.backgroundColor = UIColor.gray.cgColor
        textField.layer.addSublayer(layer)
    }
    fileprivate func setPaytmThemeForOtp(_ txtOtp: UITextField,color: UIColor) {
        if let layers = txtOtp.layer.sublayers {
            for layer in layers {
                if layer.name == txtOtp.accessibilityLabel {
                    layer.backgroundColor = color.cgColor
                }
            }
        }
    }
    
}

extension JR_OTPFieldTableViewCell {

    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
*/
