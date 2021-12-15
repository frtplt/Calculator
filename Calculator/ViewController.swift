//
//  ViewController.swift
//  Calculator
//
//  Created by Firat on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var workingsLabel: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        
        // Do any additional setup after loading the view.
    }
    func clearAll(){
        workings = ""
        resultLabel.text = ""
        workingsLabel.text = ""
    }
    func addtoworkings(value: String){
        workings = workings + value
        workingsLabel.text = workings
    }
    
    
    @IBAction func clearTap(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: UIButton) {
        if(!workings.isEmpty){
            workings.removeLast()
            resultLabel.text = workings
        }
    }
    @IBAction func percentTap(_ sender: UIButton) {
        addtoworkings(value: "%")
    }
    @IBAction func divideTapp(_ sender: UIButton) {
        addtoworkings(value: "/")
    }
    @IBAction func sevenTap(_ sender: UIButton) {
        addtoworkings(value: "7")
    }
    @IBAction func eightTap(_ sender: UIButton) {
        addtoworkings(value: "8")
    }
    @IBAction func nineTap(_ sender: UIButton) {
        addtoworkings(value: "9")
    }
    @IBAction func multiplyTap(_ sender: UIButton) {
        addtoworkings(value: "*")
    }
    @IBAction func fourTap(_ sender: UIButton) {
        addtoworkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: UIButton) {
        addtoworkings(value: "5")
    }
    @IBAction func sixTap(_ sender: UIButton) {
        addtoworkings(value: "6")
    }
    @IBAction func minusTap(_ sender: UIButton) {
        addtoworkings(value: "-")
    }
    @IBAction func oneTap(_ sender: UIButton) {
        addtoworkings(value: "1")
    }
    @IBAction func twoTap(_ sender: UIButton) {
        addtoworkings(value: "2")
    }
    @IBAction func threeTap(_ sender: UIButton) {
        addtoworkings(value: "3")
    }
    @IBAction func plusTap(_ sender: UIButton) {
        addtoworkings(value: "+")
    }
    @IBAction func zeroTap(_ sender: UIButton) {
        addtoworkings(value: "0")
    }
    @IBAction func dotTap(_ sender: UIButton) {
        addtoworkings(value: ".")
    }
    @IBAction func equalsTap(_ sender: UIButton) {
        if (validInput()){
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultLabel.text = resultString
        }
        else{
            let alert = UIAlertController.init(title: "Invalid Input", message: "Calculator could not math", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OKay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        func validInput() -> Bool {
            var count = 0
            var funcCharIndexes = [Int]()
            for char in workings {
                if(specialCharacter(char: char)){
                    funcCharIndexes.append(count)
                }
                count += 1
                return true
            }
            var previous: Int = -1
            
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                
                if(index == workings.count - 1)
                {
                    return false
                }
                
                if (previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }
                previous = index
            }
            
            return true
        }
        func specialCharacter (char: Character) -> Bool{
            if (char == "*"){
                return true
            }
            if (char == "/"){
                return true
            }
            if (char == "+"){
                return true
            }
            return false
        }
        func formatResult(result: Double) -> String {
                if(result.truncatingRemainder(dividingBy: 1 ) == 0){
                    return String(format: "%.0f", result)
                }
                else{
                    return String(format: "%.2f", result)
                }
            }
            
        }
    }

