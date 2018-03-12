//
//  addNewExpensesViewController.swift
//  Budget
//
//  Created by Benny Nguyen on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit
import DropDown

class addNewExpensesViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputAmount: UITextField!
    @IBOutlet var expenseInput: [UIButton]!
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var budgetLeftLabel: UILabel!
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var timeLeft: UILabel!
    
    @IBAction func expenseInput(_ sender: Any) {
    }
    
    var nums = ["0", ".", "0", "0"]
    
    //passed variables
    var budgets: [Budget] = [];
    var budget: Budget?;
    
    //var expenses = ["Groceries": [35.00, 100.00], //"Category": [spent, budget]
       // "Leisure": [120.38, 200.00],
       // "Automotive": [250.00, 1000.50]]
    //var category = "Groceries" //temp data
    var currency = "$" //temp data
    let dropdown = DropDown()
    //var expenses = [String: [Double]]
    //var currency = String()
    //var category = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryText.text = budget?.budgetName;
        dropdown.textFont = UIFont.systemFont(ofSize: 24)
        dropdown.textColor = UIColor.white
        dropdown.backgroundColor = UIColor(red:0.72, green:0.86, blue:0.69, alpha:1.0)
        dropdown.cornerRadius = 15
        dropdown.anchorView = view
        //dropdown.dataSource = Array(expenses.keys)
        dropdown.bottomOffset = CGPoint(x: 0, y: dropdown.plainView.bounds.height + 120)
        budgetLeftLabel.text! = "Budget left: \(currency)\(budget?.moneyLeftAmount ?? "$0.00")"
        timeLeft.text! = "Time left: \(budget?.daysLeft ?? 0)"
        
        self.expenseName.delegate = self;
    }
    
    // Open drop down menu and store the selected item into the category variable
    @IBAction func clickCategory(_ sender: Any) {
        dropdown.show()
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            //self.category = item
            //self.categoryText.text = item
            //self.budgetLeftLabel.text! = "Budget left:"
            //self.budgetLeftLabel.text! += "\(self.currency)\(self.expenses[self.category]![1] - self.expenses[self.category]![0])"
        }
    }
    
    // Take in input for number or action whenever a button is pressed
    @IBAction func clickButton(_ sender: UIButton) {
        if sender.tag <= 9 {
            if inputAmount.text!.starts(with: currency + "0") {
                nums[0] = nums[2]
                nums[2] = nums[3]
                let temp = nums.removeLast()
                nums.append(String(sender.tag))
                nums[2] = temp
            } else {
                nums.remove(at: nums.count - 3)
                nums.append(String(sender.tag))
                nums.insert(".", at: nums.count - 2)
            }
        } else if sender.tag == 10 { //back button is pressed
            if nums.count > 4 {
                nums.removeLast()
                let temp = nums[nums.count - 3]
                nums[nums.count - 3] = "."
                nums[nums.count - 2] = temp
            } else {
                nums[3] = nums[2]
                nums[2] = nums[0]
                nums[0] = "0"
            }
        } else { //OK is pressed
            inputAmount.text!.remove(at: inputAmount.text!.startIndex) //remove dollar symbol to turn into a double
            let expense = Expense(expense: inputAmount.text!, spentOn: expenseName.text!);
            budget?.expenses.append(expense);
        
            
            if let amount = budget?.moneyLeftAmount, let newAmount = Double(amount) {
                if let inputExpense = inputAmount.text, let input = Double(inputExpense) {
                    budget?.moneyLeftAmount = String(newAmount - input);
                }
            }
            
           
            //budget?.moneyLeftAmount = String( - Double(inputAmount.text)!);
            
            
           // expenses[category]![0] = expenses[category]![0] + Double(inputAmount.text!)!
            budgetLeftLabel.text! = "Budget left: \(currency)\(budget?.moneyLeftAmount ?? "$0.00")"
            timeLeft.text! = "Time left: \(budget?.daysLeft ?? 0)"
        }
        inputAmount.text! = currency + nums.joined()
    }
    
    @IBAction func back(_ sender: UIButton) {
        let budgetInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "budgetInfoViewController") as! budgetInfoViewController
        budgetInfoViewController.budgets = self.budgets;
        budgetInfoViewController.budget = self.budget;
        self.present(budgetInfoViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ expenseName: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}



// Put in option to choose corner radius, border color, and border width
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
