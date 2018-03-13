//
//  budgetAmountViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class budgetAmountViewController: UIViewController {
    // passed variables
    var budgets: [Budget] = [];
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetCurrencyType: String = "";
    var currencyVal: String = "";
    
    //button ctrls
    @IBOutlet weak var continueBtn: UIButton!
    
    var budgetAmount = ""
    @IBOutlet weak var budgetAmountScreen: UIButton!
    
    @IBAction func addBudgetAmount(_ sender: UIButton) {
        let addBudgetAmountController = self.storyboard?.instantiateViewController(withIdentifier: "addBudgetAmountViewController") as! addBudgetAmountViewController
        addBudgetAmountController.budgets = self.budgets; 
        addBudgetAmountController.budgetName = self.budgetName;
        addBudgetAmountController.budgetType = self.budgetType;
        addBudgetAmountController.budgetCurrencyType = self.budgetCurrencyType
        addBudgetAmountController.budgetAmount = self.budgetAmount;
        self.present(addBudgetAmountController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(budgetCurrencyType) == "yen" {
            currencyVal = "¥";
        } else if (budgetCurrencyType) == "cad" {
            currencyVal = "C$";
        } else {
            currencyVal = "$";
        }
        
        print(budgetName);
        print(budgetType);
        print(budgetCurrencyType);
        print(budgetAmount);
    

        // Do any additional setup after loading the view.
        if budgetAmount == "" {
            continueBtn.isEnabled = false;
            continueBtn.alpha = 0.4;
            budgetAmountScreen.setTitle(currencyVal + "0.00", for: .normal);
        } else {
            continueBtn.isEnabled = true;
            continueBtn.alpha = 1.0;
            budgetAmountScreen.setTitle(currencyVal + budgetAmount, for: .normal);
        }
    }

    @IBAction func submitBudgetAmount(_ sender: UIButton) {
        let moneyLeftController = self.storyboard?.instantiateViewController(withIdentifier: "moneyLeftViewController") as! moneyLeftViewController
        moneyLeftController.budgets = self.budgets; 
        moneyLeftController.budgetName = self.budgetName;
        moneyLeftController.budgetType = self.budgetType;
        moneyLeftController.budgetCurrencyType = self.budgetCurrencyType;
        moneyLeftController.budgetAmount = self.budgetAmount;
        self.present(moneyLeftController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
