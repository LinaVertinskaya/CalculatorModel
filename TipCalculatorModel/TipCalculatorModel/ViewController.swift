//
//  ViewController.swift
//  TipCalculatorModel
//
//  Created by Лина Вертинская on 18.06.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!


    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }

    @IBAction func calculateTapped(_ sender: Any) {

        tipCalc.total = Double((totalTextField.text as! NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        resultsTextView.text = results
    }


    @IBAction func taxPercentageChanged(_ sender: Any) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }

    @IBAction func viewTapped(_ sender: Any) {
        totalTextField.resignFirstResponder()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }


}

