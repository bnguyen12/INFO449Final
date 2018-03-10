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
    currency = currencies[atIndex]
  }
  
  // Make the table half the size of the view
  override func viewDidLayoutSubviews() {
    table.frame = CGRect(x: 0, y: self.view.center.y, width: self.view.bounds.width, height: self.view.bounds.width / 2)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return expenses.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    return cell
  }
}
