//
//  addMoneyLeftViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class addMoneyLeftViewController: UIViewController {
    //passed variables
    var budgets: [Budget] = [];
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetCurrencyType: String = "";
    var budgetAmount: String = "";
    var moneyLeftAmount: String = "";
    var currencyVal:String = "";

    @IBOutlet weak var onScreenMoneyLeft: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var backspace: UIButton!
    @IBOutlet weak var decimal: UIButton!
    
    @IBAction func submitMoneyLeft(_ sender: UIButton) {
        let moneyLeftController = self.storyboard?.instantiateViewController(withIdentifier: "moneyLeftViewController") as! moneyLeftViewController
        moneyLeftController.budgets = self.budgets;
        moneyLeftController.budgetName = self.budgetName;
        moneyLeftController.budgetType = self.budgetType;
        moneyLeftController.budgetCurrencyType = self.budgetCurrencyType;
        moneyLeftController.budgetAmount = self.budgetAmount;
        moneyLeftController.moneyLeftAmount = self.moneyLeftAmount;
        self.present(moneyLeftController, animated: true, completion: nil)
    }
    
    
    @IBAction func calculatorPad(_ sender: UIButton) {
        if sender.titleLabel?.text == "⇠" && backspace.isEnabled == true {
            moneyLeftAmount.removeLast();
            onScreenMoneyLeft.text = currencyVal + moneyLeftAmount;
        } else {
            
            if sender.titleLabel?.text == "." {
                if moneyLeftAmount.range(of: ".") != nil {
                    decimal.isEnabled = false;
                    decimal.alpha = 0.4;
                    //disable the dot button
                    //alpha it
                } else {
                    decimal.isEnabled = false;
                    decimal.alpha = 0.4;
                    moneyLeftAmount += (sender.titleLabel?.text!)!;
                    onScreenMoneyLeft.text = currencyVal + moneyLeftAmount;
                }
            } else {
                if moneyLeftAmount.range(of: ".") == nil {
                    decimal.isEnabled = true;
                    decimal.alpha = 1.0;
                }
                moneyLeftAmount += (sender.titleLabel?.text!)!;
                onScreenMoneyLeft.text = currencyVal + moneyLeftAmount;
            }
        }
        
        if moneyLeftAmount.range(of: ".") == nil {
            decimal.isEnabled = true;
            decimal.alpha = 1.0;
        }
            
            
        
        if moneyLeftAmount == "" {
            backspace.isEnabled = false;
            backspace.alpha = 0.4;
            submitBtn.isEnabled = false;
            submitBtn.alpha = 0.4;
            onScreenMoneyLeft.text = currencyVal + "0.00";
        } else {
            backspace.isEnabled = true;
            backspace.alpha = 1.0;
            submitBtn.isEnabled = true;
            submitBtn.alpha = 1.0;
            onScreenMoneyLeft.text = currencyVal + moneyLeftAmount;
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

        if moneyLeftAmount == "" {
            submitBtn.isEnabled = false;
            submitBtn.alpha = 0.4;
            backspace.isEnabled = false;
            backspace.alpha = 0.4;
            onScreenMoneyLeft.text = currencyVal + "0.00";
        } else {
            submitBtn.isEnabled = true;
            submitBtn.alpha = 1.0;
            backspace.isEnabled = true;
            backspace.alpha = 1.0;
            onScreenMoneyLeft.text = currencyVal + moneyLeftAmount;
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
