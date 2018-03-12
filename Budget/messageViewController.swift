//
//  messageViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/12/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit
import MessageUI

class messageViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    guard let messageAppURL = NSURL(string: "sms:")
      else { return }
    if UIApplication.shared.canOpenURL(messageAppURL as URL) {
      UIApplication.shared.openURL(messageAppURL as URL)
    }
  }
}
