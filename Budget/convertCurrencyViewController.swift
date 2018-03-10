//
//  convertCurrencyViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/9/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit
import CircleMenu

class convertCurrencyViewController: UIViewController, CircleMenuDelegate, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var table: UITableView!
  var currencies = ["usd", "cad", "yen"]
  var currency = "usd"
  var expenses = ["Groceries": 30.33,
                  "Automotive": 120.00,
                  "Housing": 750.25]
  //var currency = String() //get from segue
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMenu()
  }
  
  // Setup circular menu
  fileprivate func setupMenu() {
    let selectMenu = CircleMenu(
      frame: CGRect(x: 0, y: self.view.center.y - 150, width: 50, height: 50),
      normalIcon:"menu_icon",
      selectedIcon:"close_icon",
      buttonsCount: 3,
      duration: 2,
      distance: 120)
    selectMenu.delegate = self
    selectMenu.layer.cornerRadius = selectMenu.frame.size.width / 2.0
    selectMenu.backgroundColor = UIColor(red:0.72, green:0.86, blue:0.69, alpha:1.0)
    selectMenu.center.x = self.view.center.x
    view.addSubview(selectMenu)
  }
  
  // Puts the icons for USD, CAD, and YEN in the menu circle
  func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
    button.backgroundColor = UIColor(red:0.72, green:0.86, blue:0.69, alpha:1.0)
    button.setImage(UIImage(named: currencies[atIndex]), for: .normal)
  }
  
  // Set current currency to whatever was selected
  func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
    convertCurrency(currencies[atIndex])
    currency = currencies[atIndex]
    table.reloadData()
  }
  
  // Make the table half the size of the view
  override func viewDidLayoutSubviews() {
    table.frame = CGRect(x: 0, y: self.view.center.y, width: self.view.bounds.width, height: self.view.bounds.width / 2)
  }
  
  // Return number of rows in table
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return expenses.count
  }
  
  // Put cells with expense category and amount spent in table
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      as! convertCurrencyCustomCell
    cell.label.text! = Array(expenses.keys)[indexPath.row]
    var currencySymbol = "$"
    if currency == "cad" {
      currencySymbol = "C$"
    } else if currency == "yen" {
      currencySymbol = "￥"
    }
    
    cell.amount.text! = currencySymbol + String(format:"%.02f", expenses[cell.label.text!]!) //always add two numbers after decimal
    return cell
  }
  
  // Convert currency based on current rates as of March 9th, 2018
  func convertCurrency(_ switchedCurrency: String) -> Void {
    switch currency {
    case "usd":
      if switchedCurrency == "cad" {
        expenses.forEach { expenses[$0.0] = $0.1 * 1.28 }
      } else if switchedCurrency == "yen" {
        expenses.forEach { expenses[$0.0] = $0.1 * 106.80 }
      }
    case "cad":
      if switchedCurrency == "usd" {
        expenses.forEach { expenses[$0.0] = $0.1 * 0.78 }
      } else if switchedCurrency == "yen" {
        expenses.forEach { expenses[$0.0] = $0.1 * 83.38 }
      }
    default:
      if switchedCurrency == "usd" {
        expenses.forEach { expenses[$0.0] = $0.1 * 0.0094 }
      } else if switchedCurrency == "cad" {
        expenses.forEach { expenses[$0.0] = $0.1 * 0.012 }
      }
    }
  }
}
