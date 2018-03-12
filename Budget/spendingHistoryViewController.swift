//
//  spendingHistoryViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/12/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class spendingHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    //passed variables
    var budgets: [Budget] = [];
    var budget: Budget?;
    
    var currencyVal = "";
    
    @IBOutlet weak var budgetNameLabel: UILabel!
    @IBOutlet weak var expensesTable: UITableView!
    @IBOutlet weak var budgetTypeLabel: UILabel!
    @IBOutlet weak var budgetSpentLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budget!.expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let expense = budget?.expenses[indexPath.row]
        
        if(budget?.budgetCurrencyType)! == "yen" {
            currencyVal = "¥";
        } else if (budget?.budgetCurrencyType)! == "cad" {
            currencyVal = "C$";
        } else {
            currencyVal = "$";
        }
        
        cell.textLabel?.text = currencyVal + (expense?.expense)!;
        cell.detailTextLabel?.text = "Spent on: " + (expense?.spentOn)!;
    
        return cell
    }
    
    
    @IBAction func graphButton(_ sender: UIButton) {
        let graphViewController = self.storyboard?.instantiateViewController(withIdentifier: "graphViewController") as! graphViewController
        graphViewController.budgets = self.budgets;
        graphViewController.budget = self.budget;
        self.present(graphViewController, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let budgetInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "budgetInfoViewController") as! budgetInfoViewController
        budgetInfoViewController.budgets = self.budgets;
        budgetInfoViewController.budget = self.budget;
        self.present(budgetInfoViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(budget?.budgetCurrencyType)! == "yen" {
            currencyVal = "¥";
        } else if (budget?.budgetCurrencyType)! == "cad" {
            currencyVal = "C$";
        } else {
            currencyVal = "$";
        }
        
        expensesTable.dataSource = self
        expensesTable.delegate = self
        expensesTable.tableFooterView = UIView() // makes the table the height of the view
        
        budgetNameLabel.text = budget?.budgetName;
        budgetTypeLabel.text = budget?.budgetType;
        
        if(!(budget?.expenses.isEmpty)!) {
            if(budget?.expenses[0].spentOn != "already spent") {
                if let amountLeft = budget?.moneyLeftAmount, let newAmountLeft = Double(amountLeft) {
                    if let budgetAmount = budget?.budgetAmount, let newBudgetAmount = Double(budgetAmount) {
                        budgetSpentLabel.text = currencyVal + String(newBudgetAmount - newAmountLeft) + " spent";
                        
                        budget?.expenses.append(Expense(expense: String(newBudgetAmount - newAmountLeft), spentOn: "already spent"));
                    }
                }
            }
        }
        
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
