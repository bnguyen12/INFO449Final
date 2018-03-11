//
//  Budget.swift
//  Budget
//
//  Created by Lisa Koss on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class Budget: NSObject {
    var budgetTitle:String = ""
    var budgetType:String = ""
    var expenses:[Expense] = []
    
    init(budgetTitle:String, budgetType:String, expenses:[Expense]) {
        self.budgetTitle = budgetTitle
        self.budgetType = budgetType
        self.expenses = expenses
    }
}
