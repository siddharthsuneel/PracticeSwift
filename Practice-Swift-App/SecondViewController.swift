//
//  SecondViewController.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 09/04/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.estimatedRowHeight = 60
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    var dataSource: [KnowMoreDataSource]?
    
    class var mainStoryboard: UIStoryboard { get { return UIStoryboard(name: "Main", bundle: nil) } }
    
    class var newInstance: SecondViewController {
        get { return  SecondViewController.mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        dataSource = createDataSource()
    }
    
    private func createDataSource() -> [KnowMoreDataSource] {
        var resultArr:[KnowMoreDataSource] = []
        
        resultArr.append(KnowMoreDataSource(title: "Put money on hold in your UPI linked bank account for a payment to be done on a later date.", subtitle: "You will continue to earn interest on the money on hold"))
        
        resultArr.append(KnowMoreDataSource(title: "As per validity dates, your payment will be completed automatically.", subtitle: ""))
        
        resultArr.append(KnowMoreDataSource(title: "You can schedule payments for a friends, families and businesses.", subtitle: ""))
        
        resultArr.append(KnowMoreDataSource(title: "You can even use this feature for online payments with Pay later option in UPI.", subtitle: ""))
        
        return resultArr
    }
    
    @IBAction func didTappedCancelButton(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 110.0
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UPIMKnowMoreCell") as! UPIMKnowMoreCell
        if let knowMoreObj = dataSource?[indexPath.row] {
            cell.setDataInCell(titleText: knowMoreObj.titleText, subtitleText: knowMoreObj.subtitleText)
        }
        return cell
    }
}

class KnowMoreDataSource {
    var titleText: String
    var subtitleText: String
    
    init(title: String, subtitle: String) {
        titleText = title
        subtitleText = subtitle
    }
}
