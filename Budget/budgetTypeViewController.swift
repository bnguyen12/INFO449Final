//
//  budgetTypeViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class budgetTypeViewController: UIViewController {
    
    // passed variable
    var budgetName: String = "";
    
    var budgetType: String = "";
    
    // budget types
    @IBOutlet weak var weeklyButton: UIButton!
    @IBOutlet weak var monthlyButton: UIButton!
    @IBOutlet weak var oneoffButton: UIButton!
    @IBOutlet weak var paydayButton: UIButton!
    
    // continue button
    @IBOutlet weak var continueBtn: UIButton!
    
    
    @IBAction func pressWeekly(_ sender: Any) {
        if weeklyButton.isSelected {
            weeklyButton.isSelected = false;
            weeklyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            continueBtn.isEnabled = false;
            continueBtn.alpha = 0.4
        } else {
            weeklyButton.isSelected = true;
            weeklyButton.backgroundColor = UIColor(red:0.29, green:0.79, blue:0.72, alpha:1.0);
            weeklyButton.setTitleColor(.gray, for: .selected);
            monthlyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            oneoffButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            paydayButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            budgetType = "Weekly";
            monthlyButton.isSelected = false;
            oneoffButton.isSelected = false;
            paydayButton.isSelected = false;
            continueBtn.isEnabled = true;
            continueBtn.alpha = 1;
        }
    }
    
    @IBAction func pressMonthly(_ sender: Any) {
        if monthlyButton.isSelected {
            monthlyButton.isSelected = false;
            monthlyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            continueBtn.isEnabled = false;
            continueBtn.alpha = 0.4
        } else {
            monthlyButton.isSelected = true;
            monthlyButton.backgroundColor = UIColor(red:0.29, green:0.79, blue:0.72, alpha:1.0);
            monthlyButton.setTitleColor(.gray, for: .selected);
            weeklyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            oneoffButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            paydayButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            budgetType = "Monthly";
            weeklyButton.isSelected = false;
            oneoffButton.isSelected = false;
            paydayButton.isSelected = false;
            continueBtn.isEnabled = true;
            continueBtn.alpha = 1;
        }
    }
    
    @IBAction func pressOneoff(_ sender: Any) {
        if oneoffButton.isSelected {
            oneoffButton.isSelected = false;
            oneoffButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            continueBtn.isEnabled = false;
            continueBtn.alpha = 0.4
        } else {
            oneoffButton.isSelected = true;
            oneoffButton.backgroundColor = UIColor(red:0.29, green:0.79, blue:0.72, alpha:1.0);
            oneoffButton.setTitleColor(.gray, for: .selected);
            monthlyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            weeklyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            paydayButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            budgetType = "One-Off";
            monthlyButton.isSelected = false;
            weeklyButton.isSelected = false;
            paydayButton.isSelected = false;
            continueBtn.isEnabled = true;
            continueBtn.alpha = 1;
        }
    }
    
    @IBAction func pressPayday(_ sender: Any) {
        if paydayButton.isSelected {
            paydayButton.isSelected = false;
            paydayButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            continueBtn.isEnabled = false;
            continueBtn.alpha = 0.4
        } else {
            paydayButton.isSelected = true;
            paydayButton.backgroundColor = UIColor(red:0.29, green:0.79, blue:0.72, alpha:1.0);
            paydayButton.setTitleColor(.gray, for: .selected);
            monthlyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            oneoffButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            weeklyButton.backgroundColor = UIColor(red:1, green:1, blue:1, alpha:1.0);
            budgetType = "Payday";
            monthlyButton.isSelected = false;
            oneoffButton.isSelected = false;
            weeklyButton.isSelected = false;
            continueBtn.isEnabled = true;
            continueBtn.alpha = 1;
        }
    }
    
    @IBAction func submitType(_ sender: UIButton) {
        let budgetStartDateController = self.storyboard?.instantiateViewController(withIdentifier: "budgetStartDateViewController") as! budgetStartDateViewController
        budgetStartDateController.budgetName = self.budgetName;
        budgetStartDateController.budgetType = self.budgetType;
        self.present(budgetStartDateController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("yesssss good controller")
        NSLog(budgetName);

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
