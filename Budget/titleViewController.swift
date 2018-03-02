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
    UIView.animate(withDuration: 0.5, animations: {
      self.nameField.alpha = 1.0
      self.nameSubmit.alpha = 1.0
    })
  }
  
  //When "OK" is pressed, check if name field is filled out and show currency buttons
  @IBAction func verifyName(_ sender: UIButton) {
    if !nameField.text!.isEmpty {
      sender.flash()
      name = nameField.text!
      nameField.isEnabled = false
      nameSubmit.isEnabled = false
      
      UIView.animate(withDuration: 0.5, animations: {
        self.currencyQuestion.alpha = 1.0
        for button in self.currencyButtons {
          button.alpha = 1.0
        }
      })
    } else {
      sender.shake()
    }
  }
  
  // Set current currency according to which button was clicked
  @IBAction func selectCurrency(_ sender: UIButton) {
    currency = sender.titleLabel!.text!
    for button in currencyButtons {
      button.backgroundColor = UIColor(red:0.96, green:0.98, blue:0.95, alpha:1.0)
    }
    
    sender.backgroundColor = UIColor(red:0.37, green:0.64, blue:0.33, alpha:1.0)
  }
  
}

