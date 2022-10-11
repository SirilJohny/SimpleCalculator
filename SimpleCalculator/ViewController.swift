//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by DDUKK on 23/09/22.
//

import UIKit

class ViewController: UIViewController {
    let instance = MyClac(j : "gggggg")
   

    @IBOutlet weak var input: UITextField!
    var workings: String = ""
    
    
    @IBOutlet weak var output: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //clearAll()
    }
    func clearAll()
    {
        
        input.text = ""
        
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        input.text = workings
    }
    
    
    func specialCharacter(char: Character) -> Bool
    {
        
        switch char {
        case "*" : return true
        case "+" : return true
        case "-" : return true
        case "/" : return true
            
        default: return false
        }

    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func zero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func one(_ sender: Any) {
        
        addToWorkings(value: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    
    @IBAction func seven(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    
    @IBAction func nine(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    @IBAction func divide(_ sender: Any) {
        addToWorkings(value: "")
    }
    
    @IBAction func mul(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func minus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func plus(_ sender: Any) {
        addToWorkings(value: "+")
       
        
    }
    @IBAction func Answer(_ sender: Any) {
        
        
        
        
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            input.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if specialCharacter(char: char)
            {
                funcCharIndexes.append(count)
            }
            count += 1
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
    
    
    
    @IBAction func clear(_ sender: Any) {
        input.text = instance.j
       // workings = ""
    }
}


