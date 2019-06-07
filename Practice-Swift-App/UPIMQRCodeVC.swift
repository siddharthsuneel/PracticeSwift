//
//  UPIMQRCodeVC.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 09/05/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class UPIMQRCodeVC: UIViewController {

    @IBOutlet weak var navBarView: UIView!
    @IBOutlet var shareQRView: UPIMShareQRView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var payeeNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var validityLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    class var mainStoryboard: UIStoryboard { get { return UIStoryboard(name: "Main", bundle: nil) } }
    class var newInstance: UPIMQRCodeVC {
        get { return  UPIMQRCodeVC.mainStoryboard.instantiateViewController(withIdentifier: "UPIMQRCodeVC") as! UPIMQRCodeVC }
    }
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        shareButton.layer.borderWidth = 1.0
        shareButton.layer.borderColor = UIColor.init(red: 0/255.0, green: 185/255.0, blue: 245/255.0, alpha: 1.0).cgColor
    }
    
    //MARK: Private Methods
    private func setup() {
        
    }
    
    private func showShareView(state: Bool) {
        //When state is true show share view & hide scroll view
        configureShareQRView(state: !state)
        configureScrollView(state: state)
    }
    
    private func configureShareQRView(state: Bool) {
        shareQRView.isHidden = state
        if state {
            shareQRView.removeFromSuperview()
        }else {
            view.addSubview(shareQRView)
        }
    }
    
    private func configureScrollView(state: Bool) {
        navBarView.isHidden = state
        scrollContentView.isHidden = state
    }
    
    //MARK: Public Methods
    
    
    //MARK: IBActions
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: Any) {
        if let image = qrImageView.image {
            showShareView(state: true)
            shareQRView.setDataInView(payeeName: payeeNameLabel.text, message: messageLabel.text, shareImage: image, amount: amountLabel.text, validityText: validityLabel.text)
            let snapshot = shareQRView.takeSnapshot()
            showShareView(state: false)
            let activityViewController = UIActivityViewController(activityItems: ["Title",MyImageItemSource("Subject",previewImage:snapshot)], applicationActivities:nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
}

extension UIView {
    
    func takeSnapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

class UPIMShareQRView: UIView {
    
    @IBOutlet weak var payeeNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var validityLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setDataInView(payeeName: String?, message: String?, shareImage: UIImage, amount: String?, validityText: String?) {
        payeeNameLabel.text = "Payee Name"
        messageLabel.text = "Message Text"
        amountLabel.text = "Amount"
        validityLabel.text = "Validity of 90 days"
    }
}

class MyImageItemSource: NSObject, UIActivityItemSource {
    let subject : String
    let displayImage : UIImage
    
    init(_ subjValue:String,previewImage img : UIImage){
        self.subject = subjValue
        self.displayImage = img
    }
    
    public func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return ""
    }
    
    public func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if activityType == UIActivity.ActivityType.message {
            return nil
        }else{
            return displayImage
        }
    }
    
    public func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String{
        if activityType == UIActivity.ActivityType.mail {
            return subject
        }
        return ""
    }
}
