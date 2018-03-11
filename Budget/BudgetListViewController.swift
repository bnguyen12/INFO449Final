//
//  BudgetListViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class BudgetListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var budgets: [Budget] = []
    @IBOutlet weak var budgetCategories: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let budgetName = budgets[indexPath.row]
        
        cell.textLabel?.text = budgetName.budgetTitle
        cell.detailTextLabel?.text = budgetName.budgetType
        
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        questionViewController.category = self.quizCategories[indexPath.row]
        self.present(questionViewController, animated: true, completion: nil)
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        budgetCategories.dataSource = self
        budgetCategories.delegate = self
        budgetCategories.tableFooterView = UIView() // makes the table the height of the view
        
        let expense1 = Expense(expense: "$2.03", spentOn: "Food");
        
        let budget1 = Budget(budgetTitle: "Grocery", budgetType: "Weekly", expenses:[expense1])
        
        budgets = [budget1]

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
