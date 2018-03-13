//
//  moneyLeftViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class moneyLeftViewController: UIViewController {
    // passed variables
    var budgets: [Budget] = [];
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetCurrencyType: String = "";
    var budgetAmount: String = "";
    var daysLeft:Int = 0;
    var expenses:[Expense] = [];
    var currencyVal: String = "";
    
    @IBOutlet weak var continueBtn: UIButton!
    
    var moneyLeftAmount = "";
    @IBOutlet weak var moneyLeftOnScreen: UIButton!
    
    
    
    @IBAction func addMoneyLeft(_ sender: UIButton) {
        let addMoneyLeftController = self.storyboard?.instantiateViewController(withIdentifier: "addMoneyLeftViewController") as! addMoneyLeftViewController
        addMoneyLeftController.budgets = self.budgets; 
        addMoneyLeftController.budgetName = self.budgetName;
        addMoneyLeftController.budgetType = self.budgetType;
        addMoneyLeftController.budgetCurrencyType = self.budgetCurrencyType;
        addMoneyLeftController.budgetAmount = self.budgetAmount;
        addMoneyLeftController.moneyLeftAmount = self.moneyLeftAmount;
        self.present(addMoneyLeftController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        if(budgetCurrencyType) == "yen" {
            currencyVal = "¥";
        } else if (budgetCurrencyType) == "cad" {
            currencyVal = "C$";
        } else {
            currencyVal = "$";
        }
        
        super.viewDidLoad()
        
        print(budgetName);
        print(budgetType);
        print(budgetCurrencyType);
        print(budgetAmount);
        print(moneyLeftAmount);
        
        if budgetType == "Weekly" {
            daysLeft = 7;
        } else if budgetType == "Monthly" {
            daysLeft = 30;
        } else if budgetType == "One-Off" {
            daysLeft = 9999; //means unlimited
        } else {
            daysLeft = 14;
        }

        // Do any additional setup after loading the view.
        if moneyLeftAmount == "" {
            continueBtn.isEnabled = false;
            continueBtn.alpha = 0.4;
            moneyLeftOnScreen.setTitle(currencyVal + "0.00", for: .normal);
        } else {
            continueBtn.isEnabled = true;
            continueBtn.alpha = 1.0;
            moneyLeftOnScreen.setTitle(currencyVal + moneyLeftAmount, for: .normal);
        }
    
    }
    
    @IBAction func submitMoneyLeft(_ sender: UIButton) {
        let spent = Double( Double(budgetAmount)! - Double(moneyLeftAmount)!);
        
        let expense = Expense(expense: String(spent), spentOn: "already spent");
        expenses.append(expense);
        
        let budgetListController = self.storyboard?.instantiateViewController(withIdentifier: "budgetListController") as! BudgetListViewController
        budgetListController.budgets = self.budgets;
        budgetListController.budgetName = self.budgetName;
        budgetListController.budgetType = self.budgetType;
        budgetListController.budgetCurrencyType = self.budgetCurrencyType;
        budgetListController.budgetAmount = self.budgetAmount;
        budgetListController.moneyLeftAmount = self.moneyLeftAmount;
        budgetListController.daysLeft = self.daysLeft;
        budgetListController.expenses = self.expenses;
        self.present(budgetListController, animated: true, completion: nil)
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
