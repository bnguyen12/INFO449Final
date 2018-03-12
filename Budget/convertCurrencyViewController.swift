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
   
    //passed variables
    var budgets: [Budget] = [];
    var budget: Budget?;
    
    @IBOutlet weak var table: UITableView!
    var currencies = ["usd", "cad", "yen"]
    var currency = "";

    //var currency = String() //get from segue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
        currency = (budget?.budgetCurrencyType)!;
        
        
        //var expenses = ["Groceries": [30.33, 100.00], //string is category, first value of array is spent amount, second value is budget amount
            //"Automotive": [120.00, 2000.00],
            //"Housing": [750.25, 10000.00]]
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
        return budgets.count
    }
    
    // Put cells with expense category and amount spent in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! convertCurrencyCustomCell
        budget = budgets[indexPath.row]
        cell.label.text! = (budget?.budgetName)!;
        var currencySymbol = "$"
        if currency == "cad" {
            currencySymbol = "C$"
        } else if currency == "yen" {
            currencySymbol = "￥"
        }
        
        if let amount = budget?.moneyLeftAmount, var newAmount = Double(amount) {
            cell.amount.text! = currencySymbol + String(format:"%.02f", newAmount) //always add two numbers after decimal
        }
        
       
        return cell
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        let budgetListController = self.storyboard?.instantiateViewController(withIdentifier: "budgetListController") as! BudgetListViewController
        budgetListController.budgets = self.budgets;
        self.present(budgetListController, animated: true, completion: nil)
    }
    
    
    // Convert currency based on current rates as of March 9th, 2018
    func convertCurrency(_ switchedCurrency: String) -> Void {
        switch currency {
        case "usd":
            if switchedCurrency == "cad" {
                //for key in budget?.expenses.keys {
                
                if let amount = budget?.moneyLeftAmount, var newAmount = Double(amount) {
                    newAmount = newAmount * 1.28
                    budget?.moneyLeftAmount = String(newAmount);
                    budget?.budgetCurrencyType = "C$"
                }
                
               // }
            } else if switchedCurrency == "yen" {
               // for key in expenses.keys {
                if let amount = budget?.moneyLeftAmount, var newAmount = Double(amount) {
                    newAmount = newAmount * 106.80
                    budget?.moneyLeftAmount = String(newAmount);
                    budget?.budgetCurrencyType = "￥"
                }
                   // expenses[key]![0] = expenses[key]![0] * 106.80
                //}
            }
        case "cad":
            if switchedCurrency == "usd" {
                //for key in expenses.keys {
                   // expenses[key]![0] = expenses[key]![0] * 0.78
                //}
                if let amount = budget?.moneyLeftAmount, var newAmount = Double(amount) {
                    newAmount = newAmount * 0.78
                    budget?.moneyLeftAmount = String(newAmount);
                     budget?.budgetCurrencyType = "$"
                }
                
            } else if switchedCurrency == "yen" {
                //for key in expenses.keys {
                   // expenses[key]![0] = expenses[key]![0] * 83.38
               // }
                
                if let amount = budget?.moneyLeftAmount, var newAmount = Double(amount) {
                    newAmount = newAmount * 83.38
                    budget?.moneyLeftAmount = String(newAmount);
                     budget?.budgetCurrencyType = "￥"
                }
            }
        default:
            if switchedCurrency == "usd" {
                //for key in expenses.keys {
                   // expenses[key]![0] = expenses[key]![0] * 0.0094
                //}
                
                if let amount = budget?.moneyLeftAmount, var newAmount = Double(amount) {
                    newAmount = newAmount * 0.0094
                    budget?.moneyLeftAmount = String(newAmount);
                    budget?.budgetCurrencyType = "$"
                }
                
            } else if switchedCurrency == "cad" {
               // for key in expenses.keys {
                   // expenses[key]![0] = expenses[key]![0] * 0.012
               // }
                
                if let amount = budget?.moneyLeftAmount, var newAmount = Double(amount) {
                    newAmount = newAmount * 0.012
                    budget?.moneyLeftAmount = String(newAmount);
                    budget?.budgetCurrencyType = "C$"
                }
            }
        }
    }
}

