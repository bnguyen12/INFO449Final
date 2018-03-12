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
  
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var sendBtn: UIButton!
  var expenses = ["Groceries": [35.00, 100.00], //"Category": [spent, budget]
    "Leisure": [120.38, 200.00],
    "Automotive": [250.00, 1000.50]]
  // var expenses = [String: [Double]]
  var category = "Groceries" //temp data
  var currency = "$" //temp data
  let dropdown = DropDown()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    sendBtn.layer.cornerRadius = 10
    categoryLabel.text! = "Current category: \(category)"
    dropdown.textFont = UIFont.systemFont(ofSize: 24)
    dropdown.textColor = UIColor.white
    dropdown.backgroundColor = UIColor(red:0.72, green:0.86, blue:0.69, alpha:1.0)
    dropdown.cornerRadius = 15
    dropdown.anchorView = view
    dropdown.dataSource = Array(expenses.keys)
    dropdown.bottomOffset = CGPoint(x: 0, y: dropdown.plainView.bounds.height + 223)
  }
  
  // Open drop down menu when clicked
  @IBAction func clickCategory(_ sender: UIButton) {
    dropdown.show()
    dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
      self.categoryLabel.text! = "Current category: \(item)"
      self.category = item
    }
  }
  
  // Send a message about the budget if "send" is pressed
  @IBAction func pressSend(_ sender: UIButton) {
    let controller = MFMessageComposeViewController()
    let spent = "\(expenses[category]![0])"
    let budget = "\(expenses[category]![1])"
    if (MFMessageComposeViewController.canSendText()) {
      var message = "Here's my budget if you're interested: I've spent \(currency + spent) out of "
      message += "\(currency + budget) for \(category)!"
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
