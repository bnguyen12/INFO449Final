//
//  budgetInfoViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/12/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class budgetInfoViewController: UIViewController {
    //passed variables
    var budgets: [Budget] = [];
    var budget: Budget?;

    @IBOutlet weak var budgetNameLabel: UILabel!
    
    @IBAction func backButton(_ sender: UIButton) {
        let budgetListController = self.storyboard?.instantiateViewController(withIdentifier: "budgetListController") as! BudgetListViewController
        budgetListController.budgets = self.budgets;
        self.present(budgetListController, animated: true, completion: nil)
    }
    
    @IBAction func addExpenses(_ sender: UIButton) {
        let addNewExpensesController = self.storyboard?.instantiateViewController(withIdentifier: "addNewExpensesController") as! addNewExpensesViewController
        addNewExpensesController.budgets = self.budgets;
        addNewExpensesController.budget = self.budget; 
        self.present(addNewExpensesController, animated: true, completion: nil)
    }
    
    @IBAction func viewHistory(_ sender: UIButton) {
    }
    
    @IBAction func sendSMS(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        budgetNameLabel.text = budget?.budgetName;
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
