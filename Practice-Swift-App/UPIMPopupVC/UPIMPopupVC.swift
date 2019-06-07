//
//  UPIMPopupVC.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 13/05/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

enum UPIMandatePopupType {
    case none
    case processing
    case scheduleSuccess
    case receiveSuccess
    case failed
    case pending
    case declined
    
    func getHeaderImage() ->  UIImage {
        switch self {
        case .processing:
            return UIImage()
        default:
            return UIImage()
        }
    }
}

protocol UPIMPopupDelegate: class {
    func didTappedActionButton(forPopupType type: UPIMandatePopupType)
}

class UPIMPopupVC: UIViewController {

    //MARK: IBOutlets
    
    //ContainerView
    @IBOutlet weak var blurredView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var headerStackView: UIStackView!
    @IBOutlet weak var loaderContentView: UIView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var imageContentView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var footerButton: UIButton!
    @IBOutlet weak var bottomPaddingView: UIView!
    
    //MARK: Variable
    var popupType: UPIMandatePopupType = .none
    weak var delegate: UPIMPopupDelegate?
    
    class var mainStoryboard: UIStoryboard {
        get { return UIStoryboard(name: "UPIMPopup", bundle: nil) }
    }
    class var newInstance: UPIMPopupVC {
        get { return  UPIMPopupVC.mainStoryboard.instantiateViewController(withIdentifier: "UPIMPopupVC") as! UPIMPopupVC }
    }
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //set rounded corners of headerContentView here
        loaderView.layer.cornerRadius = loaderView.frame.height / 2.0
        headerImageView.layer.cornerRadius = headerImageView.frame.height / 2.0
    }

    //MARK: Private Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view?.tag == 111 {
            dismiss(animated: true, completion: nil)
        }
    }
    
    /// Hide/Unhide view components based on popupType
    private func setupView() {
        switch popupType {
        case .processing:
            imageContentView.isHidden = true
            buttonContainerView.isHidden = true
            subtitleLabel.isHidden = true
            break
        case .scheduleSuccess:
            loaderContentView.isHidden = true
            buttonContainerView.isHidden = true
            subtitleLabel.isHidden = true
            break
        case .receiveSuccess:
            loaderContentView.isHidden = true
            buttonContainerView.isHidden = true
            break
        case .pending:
            loaderContentView.isHidden = true
            buttonContainerView.isHidden = true
            break
        case .declined:
            loaderContentView.isHidden = true
            headerStackView.isHidden = true
            subtitleLabel.isHidden = true
            titleLabel.textAlignment = .left
            bottomPaddingView.isHidden = true
            break
        case .failed:
            loaderContentView.isHidden = true
            bottomPaddingView.isHidden = true
            break
        default:
            buttonContainerView.isHidden = true
            subtitleLabel.isHidden = true
            titleLabel.isHidden = true
            headerStackView.isHidden = true
            bottomPaddingView.isHidden = true
            break
        }
        
        setupFont()
    }
    
    
    /// Set font of Labels if needed
    /// Default Fonts -
    /// TitleLabel: systemFont size: 21 weight: bold
    /// SubtitleLabel: systemFont size: 12 weight: regular
    
    private func setupFont() {
        switch popupType {
        case .processing:
            titleLabel.font = UIFont.systemFont(ofSize: 21.0, weight: .semibold)
            break
        case .scheduleSuccess:
            titleLabel.font = UIFont.systemFont(ofSize: 21.0, weight: .semibold)
            break
        case .receiveSuccess:
            titleLabel.font = UIFont.systemFont(ofSize: 21.0, weight: .semibold)
            break
        case .declined:
            titleLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
            break
        default:
            break
        }
    }
    
    //MARK: Public Methods
    func setData(title: String, attributedSubtitle: NSAttributedString, buttonTitle: String) {
        titleLabel.text = title
        subtitleLabel.attributedText = attributedSubtitle
        footerButton.setTitle(buttonTitle, for: .normal)
        
        view.layoutIfNeeded()
    }
    
    func setDataInView(title: String, subtitle: String, buttonTitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        footerButton.setTitle(buttonTitle, for: .normal)
        
        view.layoutIfNeeded()
    }
    
    //MARK: IBActions
    @IBAction func didTappedFooterButton(_ sender: Any) {
        delegate?.didTappedActionButton(forPopupType: popupType)
    }
    
}
