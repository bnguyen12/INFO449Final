//
//  Expense.swift
//  Budget
//
//  Created by Lisa Koss on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class Expense: NSObject {
    var expense:String = ""
    var spentOn:String = ""
    
    init(expense:String, spentOn:String) {
        self.expense = expense
        self.spentOn = spentOn
    }
    
}
