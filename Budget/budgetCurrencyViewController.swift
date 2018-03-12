//
//  budgetCurrencyViewController.swift
//  Budget
//
//  Created by Lisa Koss on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class budgetCurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // passed variables
    var budgetName: String = "";
    var budgetType: String = "";
    var budgetStartDate: String = "";
    
    var budgetCurrencyType: String = "";
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    var currencyPickerData: [String] = [];
    
    // code referenced from: https://codewithchris.com/uipickerview-example/
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyPickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyPickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        budgetCurrencyType = currencyPickerData[row];
    }
    
    @IBAction func submitCurrency(_ sender: UIButton) {
        let budgetAmountController = self.storyboard?.instantiateViewController(withIdentifier: "budgetAmountViewController") as! budgetAmountViewController
        budgetAmountController.budgetName = self.budgetName;
        budgetAmountController.budgetType = self.budgetType;
        budgetAmountController.budgetStartDate = self.budgetStartDate;
        budgetAmountController.budgetCurrencyType = self.budgetCurrencyType
        self.present(budgetAmountController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
        currencyPickerData = ["USD", "CAD", "YEN"];

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
