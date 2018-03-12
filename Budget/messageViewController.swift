//
//  messageViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/12/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit
import MessageUI

class messageViewController: UIViewController, MFMessageComposeViewControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  // Send a message about the budget if "send" is pressed
  @IBAction func pressSend(_ sender: UIButton) {
    let controller = MFMessageComposeViewController()
    if (MFMessageComposeViewController.canSendText()) {
      controller.body = "Here's my budget if you're interested: "
      controller.messageComposeDelegate = self
      self.present(controller, animated: true, completion: nil)
    }
  }
  
  // Conform to MFMessageComposeViewControllerDelegate protocol
  func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                    didFinishWith result: MessageComposeResult) {
    controller.dismiss(animated: true, completion: nil)}
}
