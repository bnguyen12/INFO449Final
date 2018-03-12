//
//  Budget.swift
//  Budget
//
//  Created by Lisa Koss on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class Budget: NSObject {
    var budgetName:String = ""
    var budgetType:String = ""
    var budgetStartDate: String = ""
    var budgetCurrencyType: String = ""
    var budgetAmount: String = ""
    var moneyLeftAmount: String = ""
    var expenses:[Expense] = []
    
    init(budgetName:String, budgetType:String, budgetStartDate:String, budgetCurrencyType:String, budgetAmount:String, moneyLeftAmount:String, expenses:[Expense]) {
        self.budgetName = budgetName
        self.budgetType = budgetType
        self.budgetStartDate = budgetStartDate
        self.budgetCurrencyType = budgetCurrencyType
        self.budgetAmount = budgetAmount
        self.moneyLeftAmount = moneyLeftAmount
        self.expenses = expenses
    }
}
