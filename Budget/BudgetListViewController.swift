//
//  BudgetListViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class BudgetListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // passed variables
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetStartDate: String = "";
    var budgetCurrencyType: String = "";
    var budgetAmount: String = "";
    var moneyLeftAmount: String = "";
    var daysLeft:Int = 0;
    
    var budgets: [Budget] = [];

    @IBOutlet weak var budgetCategories: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let budget = budgets[indexPath.row]
        
        cell.textLabel?.text = budget.budgetName;
        cell.detailTextLabel?.text = "Money left: " + budget.moneyLeftAmount;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let budgetInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "budgetInfoViewController") as! budgetInfoViewController
        budgetInfoViewController.budgets = self.budgets;
        budgetInfoViewController.budget = self.budgets[indexPath.row]; 
        self.present(budgetInfoViewController, animated: true, completion: nil)
    }
    
    @IBAction func addBudget(_ sender: UIButton) {
        let makeBudgetViewController = self.storyboard?.instantiateViewController(withIdentifier: "makeBudgetViewController") as! makeBudgetViewController
        makeBudgetViewController.budgets = self.budgets
        self.present(makeBudgetViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        budgetCategories.dataSource = self
        budgetCategories.delegate = self
        budgetCategories.tableFooterView = UIView() // makes the table the height of the view
        
        let budget = Budget(budgetName: budgetName, budgetType: budgetType, budgetCurrencyType: budgetCurrencyType, budgetAmount: budgetAmount, moneyLeftAmount: moneyLeftAmount, daysLeft: daysLeft, expenses:[]) 
        
        if(budget.budgetName != "") {
            budgets.append(budget)
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
