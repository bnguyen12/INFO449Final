//
//  ViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/1/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class titleViewController: UIViewController {

  @IBOutlet var buttons: [UIButton]!
  @IBOutlet var currencyButtons: [UIButton]!
  @IBOutlet weak var currencyQuestion: UILabel!
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var nameSubmit: UIButton!
  var name = String()
  var currency = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameField.placeholder = "Write your name"
    nameField.layer.cornerRadius = 10
    currencyQuestion.layer.cornerRadius = 10
    
    for button in buttons {
      button.layer.cornerRadius = 10
    }
    
    for button in currencyButtons {
      button.isHidden = true
      button.layer.cornerRadius = 10
      button.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
      button.titleLabel?.minimumScaleFactor = 0.5
      button.titleLabel?.adjustsFontSizeToFitWidth = true
    }
  }
  
  //Clicked the start button to enable name field
  @IBAction func clickStart(_ sender: UIButton) {
    sender.flash()
    sender.isEnabled = false
    nameField.isHidden = false
    nameSubmit.isHidden = false
  }
  
  //When "OK" is pressed, check if name field is filled out and show currency buttons
  @IBAction func verifyName(_ sender: UIButton) {
    if !nameField.text!.isEmpty {
      sender.flash()
      name = nameField.text!
      nameField.isEnabled = false
      nameSubmit.isEnabled = false
      currencyQuestion.isHidden = false
      
      for button in currencyButtons {
        button.isHidden = false
      }
    } else {
      sender.shake()
    }
  }
  
  @IBAction func selectCurrency(_ sender: UIButton) {
    currency = sender.titleLabel!.text!
  }
  
}

