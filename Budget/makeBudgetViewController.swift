//
//  makeBudgetViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class makeBudgetViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var budgetName: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBAction func inputBudgetName(_ sender: UITextField) {
        NSLog(budgetName.text!);
        if(budgetName.text != "") {
            continueBtn.isEnabled = true
            continueBtn.alpha = 1
        } else {
            continueBtn.isEnabled = false
            continueBtn.alpha = 0.4
        }
    }
    
    func textFieldShouldReturn(_ budgetName: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func submitName(_ sender: UIButton) {
        let budgetTypeController = self.storyboard?.instantiateViewController(withIdentifier: "budgetTypeViewController") as! budgetTypeViewController
        budgetTypeController.budgetName = self.budgetName.text!
        print("???")
        self.present(budgetTypeController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.budgetName.delegate = self;
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
