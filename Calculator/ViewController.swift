//
//  ViewController.swift
//  Calculator
//
//  Created by Владислав Яшков on 22.11.17.
//  Copyright © 2017 Владислав Яшков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Double = 0
    var previosNumber:Double = 0
    var doMathoperation = false
    var operation: String = ""
    var start = true
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func numberButton(_ sender: UIButton) {
        number = 0
        if(doMathoperation){
            textLabel.text = ""
            textLabel.text = textLabel.text! + sender.currentTitle!
            number = Double(textLabel.text!)!
            doMathoperation = false
        }
        else{
            textLabel.text = textLabel.text! + sender.currentTitle!
            number = Double(textLabel.text!)!
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        switch sender.currentTitle! {
            case "C":
                number = 0
                previosNumber = 0
                operation = ""
                textLabel.text = ""
                start = true
        default:
                return 1
            }
    }
    
    @IBAction func operationButton(_ sender: UIButton) {
        switch sender.currentTitle! {
            
        case "*":
            if(start){
                previosNumber = number
                start = false
            }
            else{
                previosNumber = previosNumber * number
            }
            textLabel.text = "*"
            doMathoperation = true
            operation = "*"

        case "/":
            textLabel.text = "/"
            if(start){
                previosNumber = number
                start = false
            }
            else{
                previosNumber = previosNumber / number
            }
            doMathoperation = true
            operation = "/"


        case "-":
            textLabel.text = "-"
            if(start){
                previosNumber = number
                start = false
            }
            else{
                previosNumber = previosNumber - number
            }
            doMathoperation = true
            operation = "-"


        case "+":
            if(start){
                previosNumber = number
                start = false
            }
            else{
                previosNumber = previosNumber + number
            }
            textLabel.text = "+"
            doMathoperation = true
            operation = "+"

        case "=":
            textLabel.text = "="
			textLabel.text = textLabel.text! + String(calculate())
			number = 0
			doMathoperation = true
        default:
            return 1
        }
    }
	
	func calculate() -> Double{
            if(operation == "+"){
                return previosNumber + number
            }
            if(operation == "-"){
                return previosNumber - number
            }
            if(operation == "*"){
                return previosNumber * number
            }
            if(operation == "/"){
                return previosNumber / number
            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

