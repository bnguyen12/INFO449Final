//
//  graphViewController.swift
//  Budget
//
//  Created by Alexis Koss on 3/7/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit
import Charts

class graphViewController: UIViewController {
    //passed variables
    var budgets: [Budget] = [];
    var budget: Budget?;
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var txtTextBox: UITextField!
    @IBOutlet weak var budgetName: UILabel!
    
    var numbers: [Double] = [];
    
    @IBAction func listButton(_ sender: UIButton) {
        let spendingHistoryViewController = self.storyboard?.instantiateViewController(withIdentifier: "spendingHistoryViewController") as! spendingHistoryViewController
        spendingHistoryViewController.budgets = self.budgets;
        spendingHistoryViewController.budget = self.budget;
        self.present(spendingHistoryViewController, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        let budgetInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "budgetInfoViewController") as! budgetInfoViewController
        budgetInfoViewController.budgets = self.budgets;
        budgetInfoViewController.budget = self.budget;
        self.present(budgetInfoViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for expense in (budget?.expenses)! {
            numbers.append(Double(expense.expense)!);
        }
        
        budgetNameLabel.text = budget?.budgetName;
        
        let bars = ["Expenses", "Total Budget"]
        var money:[Double] = [];
        
        var onGoingTotal:Double = 0.0;
        if let amount = budget?.moneyLeftAmount, let newAmount = Double(amount) {
            if let amount = budget?.budgetAmount, let totalBudget = Double(amount) {
                onGoingTotal += totalBudget - newAmount;
            }
        }

        money.append(onGoingTotal); //add all expenses + left over money difference
        if let amount = budget?.budgetAmount, let totalBudget = Double(amount) {
            money.append(totalBudget); //add total budget amount
        }

        setChart(dataPoints: bars, values: money)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            NSLog(String(describing: dataEntry));
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Expenses, Total Budget")
        let chartData = BarChartData();
        chartData.addDataSet(chartDataSet);
        chartDataSet.colors = ChartColorTemplates.colorful();
        
        barChartView.data = chartData;
        barChartView.chartDescription?.text = "Spending vs Total Budget"
       // chtChart.data = chartData;
    }
    
}

