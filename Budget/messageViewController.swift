//
//  messageViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/12/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit
import MessageUI
import DropDown 

class messageViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    //passed variables
    var budgets: [Budget] = [];
    var budget: Budget?;
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var sendBtn: UIButton!
    //var expenses = ["Groceries": [35.00, 100.00], //"Category": [spent, budget]
       // "Leisure": [120.38, 200.00],
        //"Automotive": [250.00, 1000.50]]
    // var expenses = [String: [Double]]
    //var category = "Groceries" //temp data
    var currency = "$" //temp data
    let dropdown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtn.layer.cornerRadius = 10
        categoryLabel.text! = "Current category: \(budget?.budgetName ?? "N/A")"
        dropdown.textFont = UIFont.systemFont(ofSize: 24)
        dropdown.textColor = UIColor.white
        dropdown.backgroundColor = UIColor(red:0.72, green:0.86, blue:0.69, alpha:1.0)
        dropdown.cornerRadius = 15
        dropdown.anchorView = view
        var budgetNames:[String] = [];
        for budget in budgets {
            budgetNames.append(budget.budgetName)
        }
        dropdown.dataSource = budgetNames;
        dropdown.bottomOffset = CGPoint(x: 0, y: dropdown.plainView.bounds.height + 223)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        let budgetInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "budgetInfoViewController") as! budgetInfoViewController
        budgetInfoViewController.budgets = self.budgets;
        budgetInfoViewController.budget = self.budget;
        self.present(budgetInfoViewController, animated: true, completion: nil)
    }
    
    // Open drop down menu when clicked
    @IBAction func clickCategory(_ sender: UIButton) {
        dropdown.show()
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            for budget in self.budgets {
                if item == budget.budgetName {
                    self.budget = budget;
                }
            }
            
            let messageController = self.storyboard?.instantiateViewController(withIdentifier: "messageController") as! messageViewController
            messageController.budgets = self.budgets;
            messageController.budget = self.budget;
            
            self.categoryLabel.text! = "Current category: \(self.budget?.budgetName ?? "N/A")"
            self.present(messageController, animated: true, completion: nil)
            
            //self.category = item
            //self.categoryText.text = self.budget?.budgetName;
        }
    }
    
    // Send a message about the budget if "send" is pressed
    @IBAction func pressSend(_ sender: UIButton) {
        let controller = MFMessageComposeViewController()
        let left = "\(budget?.moneyLeftAmount ?? "0")"
        let total = "\(self.budget?.budgetAmount ?? "0")"
        if (MFMessageComposeViewController.canSendText()) {
            var message = "Here's my budget if you're interested: I have \(currency + left) left out of "
            message += "\(currency + total) for \(budget?.budgetName ?? "0")!"
            controller.body = message
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    // Conform to MFMessageComposeViewControllerDelegate protocol
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)}
}

