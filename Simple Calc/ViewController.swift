//
//  ViewController.swift
//  Simple Calc
//
//  Created by Naruth Kongurai on 10/23/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var resultLabel: UILabel!
    public var equationHistory: [String] = []
    
    // MARK: Variables
    private var inputs = [Int]()
    private var digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    private var firstInputStr = ""
    private var secondInputStr = ""
    private var inputTrackerStr = ""
    private var hasClickedAnOperand = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "HistorySegue") {
            let history = segue.destination as! HistoryViewController
            history.equationHistory = self.equationHistory
        }
    }
    
    // MARK: Number Buttons
    @IBAction func num0(_ sender: UIButton) {
        let digit = "\(digits[0])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num1(_ sender: UIButton) {
        let digit = "\(digits[1])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num2(_ sender: UIButton) {
        let digit = "\(digits[2])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num3(_ sender: UIButton) {
        let digit = "\(digits[3])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num4(_ sender: UIButton) {
        let digit = "\(digits[4])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num5(_ sender: UIButton) {
        let digit = "\(digits[5])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num6(_ sender: UIButton) {
        let digit = "\(digits[06])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num7(_ sender: UIButton) {
        let digit = "\(digits[7])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num8(_ sender: UIButton) {
        let digit = "\(digits[8])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    @IBAction func num9(_ sender: UIButton) {
        let digit = "\(digits[9])"
        performInputTracking(digit)
        inputTrackerStr += digit
    }
    
    // MARK: Operations
    @IBAction func addBtn(_ sender: UIButton) {
        hasClickedAnOperand = true
        inputs.append(Int(resultLabel.text!)!)
        inputTrackerStr += " + "
        print("+ is clicked")
    }
    @IBAction func subtractBtn(_ sender: UIButton) {
        hasClickedAnOperand = true
        inputs.append(Int(resultLabel.text!)!)
        inputTrackerStr += " - "
        print("- is clicked")
    }
    @IBAction func multiplyBtn(_ sender: UIButton) {
        hasClickedAnOperand = true
        inputs.append(Int(resultLabel.text!)!)
        inputTrackerStr += " * "
        print("* is clicked")
    }
    @IBAction func divideBtn(_ sender: UIButton) {
        hasClickedAnOperand = true
        inputs.append(Int(resultLabel.text!)!)
        inputTrackerStr += " / "
        print("/ is clicked")
    }
    @IBAction func modBtn(_ sender: UIButton) {
        hasClickedAnOperand = true
        inputs.append(Int(resultLabel.text!)!)
        inputTrackerStr += " % "
        print("% is clicked")
    }
    
    @IBAction func equalsBtn(_ sender: UIButton) {
        print("Size of input is \(inputs.count)")
        
        if (inputs.count == 0) {
            clear()
        }
        
        if (inputs.count >= 1) {
            if (inputTrackerStr.contains("count")) {
                resultLabel.text = "\(inputs.count)"
                var dummyString = ""
                for num in inputs {
                    dummyString += "\(num) count "
                }
                equationHistory.append("\(dummyString)= \(inputs.count)")
                print(equationHistory)
            } else if (inputTrackerStr.contains("fact")) {
                let result = factorial(n: Int(resultLabel.text!)!)
                resultLabel.text = "\(result)"
                var dummyString = ""
                for num in inputs {
                    dummyString += "\(num) fact "
                }
                equationHistory.append("\(dummyString)= \(result)")
                print(equationHistory)
            } else if (inputTrackerStr.contains("average")) {
                let result = Double(Double(inputs.reduce(0, +)) / Double(inputs.count))
                resultLabel.text = "\(result)"
                var dummyString = ""
                for num in inputs {
                    dummyString += "\(num) average "
                }
                equationHistory.append("\(dummyString)= \(result)")
                print(equationHistory)
            } else {
                inputs.append(Int(resultLabel.text!)!)
            }
        }
        
        if (inputs.count == 2 && !inputTrackerStr.contains("fact") && !inputTrackerStr.contains("count") && !inputTrackerStr.contains("average")) {
            var result = 0
            
            let inputParts : Array = inputTrackerStr.split(separator: " ")
            let left = inputParts[0]
            let right = inputParts[2]
            let operand = inputParts[1]
            
            if (operand == "+") {
                result = Int(Int(left)! + Int(right)!)
            } else if (operand == "-") {
                result = Int(Int(left)! - Int(right)!)
            } else if (operand == "*") {
                result = Int(Int(left)! * Int(right)!)
            } else if (operand == "/") {
                result = Int(Int(left)! / Int(right)!)
            } else if (operand == "%") {
                result = Int(Int(left)! % Int(right)!)
            }
            
            if (operand == "+" || operand == "-" || operand == "*" || operand == "/" || operand == "%") {
                inputs = [Int]()
                resultLabel.text = "\(result)"
                
                print(result)
                
                firstInputStr = "\(result)"
                inputTrackerStr = firstInputStr
                secondInputStr = ""
                hasClickedAnOperand = false
            }
            
            equationHistory.append("\(left) \(operand) \(right) = \(result)")
            print(equationHistory)
        }
    }
    
    // MARK: Operation Functions (AC, Count, Average, Factorial)
    @IBAction func acBtn(_ sender: UIButton) {
        clear()
    }
    @IBAction func countBtn(_ sender: UIButton) {
        let digit = Int(resultLabel.text!)!
        inputs.append(digit)
        print("Count is clicked")
        firstInputStr = ""
        inputTrackerStr += " count "
    }
    @IBAction func avgBtn(_ sender: UIButton) {
        let digit = Int(resultLabel.text!)!
        inputs.append(digit)
        print("Average is clicked")
        firstInputStr = ""
        inputTrackerStr += " average "
    }
    @IBAction func factorialBtn(_ sender: UIButton) {
        let digit = Int(resultLabel.text!)!
        inputs.append(digit)
        print("Factorial is clicked")
        firstInputStr = ""
        inputTrackerStr += " fact "
    }
    
    // MARK: Private Methods
    private func factorial(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n * factorial(n:(n-1))
    }
    private func performInputTracking(_ digit: String) {
        if hasClickedAnOperand {
            secondInputStr += digit
            resultLabel.text = "\(secondInputStr)"
        } else {
            firstInputStr += digit
            resultLabel.text = "\(firstInputStr)"
        }
    }
    private func clear() {
        inputs = [Int]()
        resultLabel.text = "\(digits[0])"
        firstInputStr = ""
        secondInputStr = ""
        inputTrackerStr = ""
        hasClickedAnOperand = false
    }
}

