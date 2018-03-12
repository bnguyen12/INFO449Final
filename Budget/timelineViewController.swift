//
//  timelineViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class timelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var table: UITableView!
  @IBOutlet weak var timeLeftLbl: UILabel!
  var expenses = ["Groceries": [25.0, 105.99],
                  "Automotive": [250.25, 1000.00],
                  "Housing": [862.49, 10500.50]]
  var timeline = ["Groceries": "Week",
                  "Automotive": "Month",
                  "Housing": "Year"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // Return number of rows
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return expenses.count
  }
  
  // Fill in all the rows in table
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTimelineTableViewCell
    cell.cellLbl.text! = Array(expenses.keys)[indexPath.row]
    for button in cell.buttons {
      button.tag = indexPath.row
      button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
      if button.titleLabel!.text! == timeline[cell.cellLbl.text!] {
        button.isSelected = true
      }
    }
    return cell
  }
  
  // If the cell is clicked, update the label to show how many days until budget is refreshed
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var timeLeft = Array(expenses.keys)[indexPath.row] + ":"
    let cell = table.cellForRow(at: indexPath) as! customTimelineTableViewCell
    for button in cell.buttons {
      if button.isSelected {
        if button.titleLabel!.text! == "Week" {
          timeLeft += " 7 Days Left!"
        } else if button.titleLabel!.text! == "Month" {
          timeLeft += " 31 Days Left!"
        } else {
          timeLeft += " 365 Days Left!"
        }
      }
    }
    timeLeftLbl.text! = timeLeft
  }
  
  // If any of the radio buttons are touched, update the timeline
  @objc func buttonClicked(_ sender: UIButton) {
    for cell in table.visibleCells {
      let customCell = cell as! customTimelineTableViewCell
      for button in customCell.buttons {
        if button.isSelected {
          timeline[customCell.cellLbl!.text!] = button.titleLabel!.text!
        }
      }
    }
  }
}
