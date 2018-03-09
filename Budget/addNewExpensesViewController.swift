//
//  addNewExpensesViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class addNewExpensesViewController: UIViewController {
  
  @IBOutlet weak var inputAmount: UITextField!
  @IBOutlet var expenseInput: [UIButton]!
  var expenseAmount = Double()
  var nums = ["0", ".", "0", "0"]
  //var categories = [String]
  //var currency = String()
  var categories = ["Groceries", "Leisure", "Automotive"]
  var currency = "$"
  
  override func viewDidLoad() {
      super.viewDidLoad()

  }
  
  @IBAction func clickButton(_ sender: UIButton) {
    if sender.tag <= 9 {
      if inputAmount.text!.starts(with: currency + "0") {
        nums[0] = nums[2]
        nums[2] = nums[3]
        let temp = nums.removeLast()
        nums.append(String(sender.tag))
        nums[2] = temp
      } else {
        nums.remove(at: nums.count - 3)
        nums.append(String(sender.tag))
        nums.insert(".", at: nums.count - 2)
      }
    } else if sender.tag == 10 { //back button is pressed
      if nums.count > 4 {
        nums.removeLast()
        let temp = nums[nums.count - 3]
        nums[nums.count - 3] = "."
        nums[nums.count - 2] = temp
      } else {
        nums[3] = nums[2]
        nums[2] = nums[0]
        nums[0] = "0"
      }
    } else { //OK is pressed
      inputAmount.text!.remove(at: inputAmount.text!.startIndex)
      expenseAmount = Double(inputAmount.text!)!
    }
    inputAmount.text! = currency + nums.joined()
  }
}

// Put in option to choose corner radius, border color, and border width
extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get {
      return UIColor(cgColor: layer.borderColor!)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
}
