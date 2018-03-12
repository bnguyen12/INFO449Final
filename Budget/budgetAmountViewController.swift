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
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetStartDate: String = "";
    var budgetCurrencyType: String = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(budgetName);
        print(budgetType);
        print(budgetStartDate);
        print(budgetCurrencyType);

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
