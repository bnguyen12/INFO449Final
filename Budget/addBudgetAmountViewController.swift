//
//  addBudgetAmountViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class addBudgetAmountViewController: UIViewController {
    //passed variables
    var budgets: [Budget] = [];
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetCurrencyType: String = "";
    var budgetAmount: String = "";
    var currencyVal:String = "";
    
    @IBOutlet weak var onScreenBudget: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var backspace: UIButton!
    @IBOutlet weak var decimal: UIButton!
    
    @IBAction func submitAmount(_ sender: UIButton) {
        let budgetAmountController = self.storyboard?.instantiateViewController(withIdentifier: "budgetAmountViewController") as! budgetAmountViewController
        budgetAmountController.budgets = self.budgets;
        budgetAmountController.budgetName = self.budgetName;
        budgetAmountController.budgetType = self.budgetType;
        budgetAmountController.budgetCurrencyType = self.budgetCurrencyType
        budgetAmountController.budgetAmount = self.budgetAmount;
        self.present(budgetAmountController, animated: true, completion: nil)
    }
    
    @IBAction func calculatorPad(_ sender: UIButton) {
        if sender.titleLabel?.text == "⇠" && backspace.isEnabled == true {
            budgetAmount.removeLast();
            onScreenBudget.text = currencyVal + budgetAmount;
        } else {
            if sender.titleLabel?.text == "." {
                if budgetAmount.range(of: ".") != nil {
                    decimal.isEnabled = false;
                    decimal.alpha = 0.4;
                    //disable the dot button
                    //alpha it
                } else {
                    decimal.isEnabled = false;
                    decimal.alpha = 0.4;
                    budgetAmount += (sender.titleLabel?.text!)!;
                    onScreenBudget.text = currencyVal + budgetAmount;
                }
            } else {
                if budgetAmount.range(of: ".") == nil {
                    decimal.isEnabled = true;
                    decimal.alpha = 1.0;
                }
                budgetAmount += (sender.titleLabel?.text!)!;
                onScreenBudget.text = currencyVal + budgetAmount;
            }
        }
        
        if budgetAmount.range(of: ".") == nil {
            decimal.isEnabled = true;
            decimal.alpha = 1.0;
        }
        
        if budgetAmount == "" {
            backspace.isEnabled = false;
            backspace.alpha = 0.4;
            submitBtn.isEnabled = false;
            submitBtn.alpha = 0.4;
            onScreenBudget.text = currencyVal + "0.00";
        } else {
            backspace.isEnabled = true;
            backspace.alpha = 1.0;
            submitBtn.isEnabled = true;
            submitBtn.alpha = 1.0;
            onScreenBudget.text = currencyVal + budgetAmount;
        }
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
        
        if budgetAmount == "" {
            submitBtn.isEnabled = false;
            submitBtn.alpha = 0.4;
            backspace.isEnabled = false;
            backspace.alpha = 0.4;
            onScreenBudget.text = currencyVal + "0.00";
        } else {
            submitBtn.isEnabled = true;
            submitBtn.alpha = 1.0;
            backspace.isEnabled = true;
            backspace.alpha = 1.0;
            onScreenBudget.text = currencyVal + budgetAmount;
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
