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
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetStartDate: String = "";
    var budgetCurrencyType: String = "";
    var budgetAmount: String = "";
    
    @IBOutlet weak var continueBtn: UIButton!
    
    var moneyLeftAmount = "";
    @IBOutlet weak var moneyLeftOnScreen: UIButton!
    
    
    
    @IBAction func addMoneyLeft(_ sender: UIButton) {
        let addMoneyLeftController = self.storyboard?.instantiateViewController(withIdentifier: "addMoneyLeftViewController") as! addMoneyLeftViewController
        addMoneyLeftController.budgetName = self.budgetName;
        addMoneyLeftController.budgetType = self.budgetType;
        addMoneyLeftController.budgetStartDate = self.budgetStartDate;
        addMoneyLeftController.budgetCurrencyType = self.budgetCurrencyType;
        addMoneyLeftController.budgetAmount = self.budgetAmount;
        addMoneyLeftController.moneyLeftAmount = self.moneyLeftAmount;
        self.present(addMoneyLeftController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(budgetName);
        print(budgetType);
        print(budgetStartDate);
        print(budgetCurrencyType);
        print(budgetAmount);
        print(moneyLeftAmount);

        // Do any additional setup after loading the view.
        if moneyLeftAmount == "" {
            continueBtn.isEnabled = false;
            continueBtn.alpha = 0.4;
            moneyLeftOnScreen.titleLabel?.text = "0.00";
        } else {
            continueBtn.isEnabled = true;
            continueBtn.alpha = 1.0;
            moneyLeftOnScreen.setTitle(moneyLeftAmount, for: .normal);
        }
    }
    @IBAction func submitMoneyLeft(_ sender: UIButton) {
        let budgetListController = self.storyboard?.instantiateViewController(withIdentifier: "budgetListController") as! BudgetListViewController
        budgetListController.budgetName = self.budgetName;
        budgetListController.budgetType = self.budgetType;
        budgetListController.budgetStartDate = self.budgetStartDate;
        budgetListController.budgetCurrencyType = self.budgetCurrencyType;
        budgetListController.budgetAmount = self.budgetAmount;
        budgetListController.moneyLeftAmount = self.moneyLeftAmount;
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
