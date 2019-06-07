//
//  ViewController.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 26/02/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabelSetup()
        // Do any additional setup after loading the view, typically from a nib.        
//        setupFBLoginButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        drawDashLine()
    }
    
    func testLabelSetup() {
        testLabel.attributedText = getKnowMoreAttributedText()
//        textView.attributedText = getKnowMoreAttributedText()
        
        
//        testLabel.text = "Put money on hold from your UPI linked bank account for a payment to be done on a later date. Know more"
    }
    
    func drawDashLine() {
        if let str = testLabel.text as NSString? {
            guard let rect = testLabel.boundingRectForCharacterRange(range: str.range(of: "Know more")) else { return }
            print(rect)
            
            let  p0 = CGPoint(x: rect.minX, y: rect.maxY)
            let  p1 = CGPoint(x: rect.maxX, y: rect.maxY)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.strokeColor = UIColor.darkText.cgColor
            shapeLayer.lineWidth = 1
            shapeLayer.lineDashPattern = [3, 2] // 7 is the length of dash, 3 is length of the gap.
            
            let path = CGMutablePath()
            path.addLines(between: [p0, p1])
            shapeLayer.path = path
            view.layer.addSublayer(shapeLayer)
        }
    }
    
    func getKnowMoreAttributedText() -> NSAttributedString {
        
//        let resultStr = "Put money on hold from your UPI linked bank account for a payment to be done on a later date. " + "Know more"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5.0
        
        //.underlineStyle : dashed, .underlineColor :UIColor.black,
        
//        let attribs = [.underlineStyle : dashed, .underlineColor :UIColor.black, .foregroundColor: UIColor.darkText, .font: UIFont.systemFont(ofSize: 12.0), .paragraphStyle: paragraphStyle] as [NSAttributedString.Key : Any]
//
//        let attrString = NSAttributedString(string: "Know more", attributes: attribs)
        
        let defaultAttr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.darkText, .font: UIFont.systemFont(ofSize: 12.0)]
        
        let resultStr = NSMutableAttributedString(string: "Some random text. Dashed underline text", attributes: defaultAttr)
        
        let dashed =  NSUnderlineStyle.patternDot.rawValue | NSUnderlineStyle.single.rawValue
        
        resultStr.addAttributes([.underlineStyle : dashed], range: (resultStr.string as NSString).range(of: "Dashed underline text"))
        
        return resultStr
    }

  
    func getAttributedString() -> NSAttributedString {
        let defaultAttr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.darkText, .font: UIFont.systemFont(ofSize: 12.0)]
        
        let resultStr = NSMutableAttributedString(string: "Some random text. Dashed underline text", attributes: defaultAttr)
        
        let dashed =  NSUnderlineStyle.patternDot.rawValue | NSUnderlineStyle.single.rawValue
        
        resultStr.addAttributes([.underlineStyle : dashed], range: (resultStr.string as NSString).range(of: "Know more"))
        
        return resultStr
    }
    
    @IBAction func didTappedButton(_ sender: Any) {
        let vc = SecondViewController.newInstance
        present(vc, animated: true) {
          
        }
    }
    
    @IBAction func didTappedQRCode(_ sender: Any) {
        let vc = UPIMQRCodeVC.newInstance
//        navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true) {
            
        }
    }
    
    @IBAction func mandatePopupAction(_ sender: Any) {
        let vc = MandatePopupListVC.newInstance
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTappedPaymentDetail(_ sender: Any) {
        let vc = UPIMSchedulePaymentDetailVC.newInstance
        present(vc, animated: true) {
            
        }
    }
    
}


extension UILabel {
    func boundingRectForCharacterRange(range: NSRange) -> CGRect? {
        
        guard let attributedText = attributedText else { return nil }
        
        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: intrinsicContentSize)
        
        textContainer.lineFragmentPadding = 0.0
        
        layoutManager.addTextContainer(textContainer)
        
        var glyphRange = NSRange()
        
        layoutManager.characterRange(forGlyphRange: range, actualGlyphRange: &glyphRange)
        
        return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
    }
}
