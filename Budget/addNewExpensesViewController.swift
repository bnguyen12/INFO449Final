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
    
    @IBOutlet weak var inputAmount: UILabel!
    @IBOutlet var expenseInput: [UIButton]!
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var budgetLeftLabel: UILabel!
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var timeLeft: UILabel!
    
    var nums = ["0", ".", "0", "0"]
    var currencyVal:String = "";
    
    //passed variables
    var budgets: [Budget] = [];
    var budget: Budget?;
    
    //var expenses = ["Groceries": [35.00, 100.00], //"Category": [spent, budget]
       // "Leisure": [120.38, 200.00],
       // "Automotive": [250.00, 1000.50]]
    //var category = "Groceries" //temp data
    //var currency = "$" //temp data
    let dropdown = DropDown()
    //var expenses = [String: [Double]]
    //var currency = String()
    //var category = String()
    @IBOutlet weak var ok: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(budget?.budgetCurrencyType) == "yen" {
            currencyVal = "¥";
        } else if (budget?.budgetCurrencyType) == "cad" {
            currencyVal = "C$";
        } else {
            currencyVal = "$";
        }
        
        categoryText.text = budget?.budgetName;
        dropdown.textFont = UIFont.systemFont(ofSize: 24)
        dropdown.textColor = UIColor.white
        dropdown.backgroundColor = UIColor(red:0.72, green:0.86, blue:0.69, alpha:1.0)
        dropdown.cornerRadius = 15
        dropdown.anchorView = view
        var budgetNames:[String] = [];
        for budget in budgets {
            budgetNames.append(budget.budgetName)
        }
        dropdown.dataSource = budgetNames;
        dropdown.bottomOffset = CGPoint(x: 0, y: dropdown.plainView.bounds.height + 120)
        
        if let amount = budget?.moneyLeftAmount, let newAmount = Double(amount) {
            budgetLeftLabel.text! = "Budget left: " + currencyVal + String(format:"%.02f", newAmount) //always add two numbers after decimal
        }
        
        
        //budgetLeftLabel.text! = "Budget left: \(currencyVal)\(budget?.moneyLeftAmount ?? "0.00")"
        if(budget?.daysLeft == 9999) {
            timeLeft.text! = "Time left: unlimited"
        } else {
            timeLeft.text! = "Time left: \(budget?.daysLeft ?? 0)"
        }
        
        inputAmount.text! = "";
        inputAmount.text! = currencyVal + "0.00";
        
        self.expenseName.delegate = self;
        
    }
    
    // Open drop down menu and store the selected item into the category variable
    @IBAction func clickCategory(_ sender: Any) {
        dropdown.show()
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            for budget in self.budgets {
                if item == budget.budgetName {
                    self.budget = budget;
                }
            }
            
            let expensesViewController = self.storyboard?.instantiateViewController(withIdentifier: "addNewExpensesController") as! addNewExpensesViewController
            expensesViewController.budgets = self.budgets;
            expensesViewController.budget = self.budget;
            
            self.categoryText.text = self.budget?.budgetName;
            
            if let amount = self.budget?.moneyLeftAmount, let newAmount = Double(amount) {
                self.budgetLeftLabel.text! = "Budget left: " + self.currencyVal + String(format:"%.02f", newAmount) //always add two numbers after decimal
            }
            self.timeLeft.text! = "Time left: \(self.budget?.daysLeft ?? 0)"
            self.present(expensesViewController, animated: true, completion: nil)
            
            //self.category = item
            self.categoryText.text = self.budget?.budgetName;
            //self.budgetLeftLabel.text! = "Budget left:"
            //self.budgetLeftLabel.text! += "\(self.currency)\(self.expenses[self.category]![1] - self.expenses[self.category]![0])"
        }
    }
    
    // Take in input for number or action whenever a button is pressed
    @IBAction func clickButton(_ sender: UIButton) {
        
        if sender.tag <= 9 {
            if inputAmount.text!.starts(with: currencyVal + "0") {
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
            if(currencyVal.count > 1) {
                inputAmount.text!.remove(at: inputAmount.text!.startIndex) //remove dollar symbol to turn into a double
                inputAmount.text!.remove(at: inputAmount.text!.startIndex) //remove dollar symbol to turn into a double
            } else {
                inputAmount.text!.remove(at: inputAmount.text!.startIndex) //remove dollar symbol to turn into a double
            }
            
            let expense = Expense(expense: inputAmount.text!, spentOn: expenseName.text!);
            budget?.expenses.append(expense);
        
            
            if let amount = budget?.moneyLeftAmount, let newAmount = Double(amount) {
                if let inputExpense = inputAmount.text, let input = Double(inputExpense) {
                    budget?.moneyLeftAmount = String(newAmount - input);
                }
            }
            
           
            //budget?.moneyLeftAmount = String( - Double(inputAmount.text)!);
            
            
           // expenses[category]![0] = expenses[category]![0] + Double(inputAmount.text!)!
            if let amount = budget?.moneyLeftAmount, let newAmount = Double(amount) {
                budgetLeftLabel.text! = "Budget left: " + currencyVal + String(format:"%.02f", newAmount) //always add two numbers after decimal
            }
            if(budget?.daysLeft == 9999) {
                timeLeft.text! = "Time left: unlimited"
            } else {
                timeLeft.text! = "Time left: \(budget?.daysLeft ?? 0)"
            }
        }
        inputAmount.text! = currencyVal + nums.joined()
        
        if (inputAmount.text != "0.00") {
            //enable as soon as any changes are made
            ok.isEnabled = true;
            ok.alpha = 1.0;
        } else {
            //enable as soon as any changes are made
            ok.isEnabled = false;
            ok.alpha = 0.4;
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        let budgetInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "budgetInfoViewController") as! budgetInfoViewController
        budgetInfoViewController.budgets = self.budgets;
        budgetInfoViewController.budget = self.budget;
        self.present(budgetInfoViewController, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        expenseName.text = ""
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
