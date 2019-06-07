//
//  UPIMSchedulePaymentDetailVC.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 17/05/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class UPIMSchedulePaymentDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.estimatedRowHeight = 60
            tableView.separatorStyle = .none
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var tableViewHeight: CGFloat {
        tableView.layoutIfNeeded()
        return tableView.contentSize.height
    }
    
    class var mainStoryboard: UIStoryboard { get { return UIStoryboard(name: "UPIMPopup", bundle: nil) } }
    
    class var newInstance: UPIMSchedulePaymentDetailVC {
        get { return  UPIMSchedulePaymentDetailVC.mainStoryboard.instantiateViewController(withIdentifier: "UPIMSchedulePaymentDetailVC") as! UPIMSchedulePaymentDetailVC }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableViewHeightConstraint.constant = tableViewHeight
    }
    
    
    @IBAction func didTappedCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension UPIMSchedulePaymentDetailVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 182.0
        }else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UPIMSchedulePaymentDetailCell") as! UPIMSchedulePaymentDetailCell
            
            /*
             if timeline is not available
             hide border of cell container view
             */
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UPIMSchedulePaymentTimelineCell") as! UPIMSchedulePaymentTimelineCell
            
            /*
             if indexPath.row == 0 {
             //Hide upperView of cell
             }else if indexPath.row == dataSource.count {
             //Hide lowerView of cell
             }
             */
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.001
        }else {
            return 40.0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Section Title"
        }
        return nil
    }
}
