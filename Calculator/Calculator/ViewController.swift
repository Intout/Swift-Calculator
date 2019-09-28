
//  ViewController.swift
//  Calculator

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ClearB: RoundButton! //Clear Button
    // Number's tags are start with 11, calculation operator's tags start with 21.
    var numberOnScreen: Double = 0
    var tempNumber: Double = 0
    var performingMath = false
    var TempText: String = "" // If numbers on screen haven't changed, storing that numbers in this var and
    var calcOperation = 0 // For identifying calculation
    var tagValue = 0 // For labling "Clear" Button
    var EqualCheck = false // Setting display number to new number after pressing equal
    
    @IBOutlet weak var Display: UILabel!
    
    // With this function we are able to take numbers from user's input.
    @IBAction func Numbers(_ sender: UIButton) {
        
        // This function checks for any mathematical operation input given by user and then clear our display for new number.
        if performingMath == true && Display.text!.last! != "."{
            
            if sender.tag == 11{
                TempText = Display.text!
            }
            else{
                Display.text! = String(sender.tag-1)
            }
            
            numberOnScreen = Double(Display.text!)!
            performingMath = false
            
            if  Display.text != "0" || tempNumber != 0{
                ClearB.setTitle("C", for: .normal)
            }
        }
            
            
        else{
            // User's display input must not starts or ends dot because we need numaric input to perform mathematical operation.
            func DotChecker(Sentence: String) -> Bool {
                let Dot: Character = "."
                var Value = 0
                for Char in Sentence{
                    if Char == Dot{
                        Value += 1
                    }
                }
                if Value > 0{
                    return true
                }
                else{
                    return false
                }
            }
            // User has a only one chance to input dot to any individual number. So it should be in between integer numbers to express double or float number.
            if sender.tag == 11 && DotChecker(Sentence: Display.text!) == false && Display.text! != "" {
                Display.text = Display.text! + String(".")
            }
            else if sender.tag != 11 && Display.text! != TempText && Display.text! != "0" && EqualCheck == false{
                Display.text = Display.text! + String(sender.tag-1)
            }
            else if sender.tag != 11 && Display.text! == TempText && Display.text! != "0" && EqualCheck == false{
                Display.text = String(sender.tag-1)
            }
            else if Display.text! == "0" && EqualCheck == false{
                Display.text = String(sender.tag-1)
            }
            else if sender.tag != 11 && Display.text! == TempText && Display.text! != "0" && EqualCheck == true{
                Display.text! = String(sender.tag-1)
            }
            if Display.text!.last! != "." && Display.text!.first! != "."{
                numberOnScreen = Double(Display.text!)!
                if  Display.text != "0" || tempNumber != 0{
                    //if there is no any user input, clear button displays "AC" for "All Clear". When user enters input "AC" need to transform to "C" for "Clear".
                    ClearB.setTitle("C", for: .normal)
                }
                
            }
        }
    }
    
    @IBAction func CalcBut(_ sender: UIButton) {
        
        if Display.text != "" && sender.tag != 28 && Display.text!.last! != "." && Display.text!.first! != "."{
            
            tempNumber = Double(Display.text!)!
            
            if sender.tag == 24{
                EqualCheck = false
            }
            else if sender.tag == 25{
                EqualCheck = false
            }
            else if sender.tag == 26{
                EqualCheck = false
            }
            else if sender.tag == 27{
                EqualCheck = false
            }
            else if sender.tag == 22{
                Display.text! = String(Double(Display.text!)! * (-1))
                EqualCheck = false
            }
            else if sender.tag == 23{
                numberOnScreen = Double(Display.text!)!
                Display.text! = String(numberOnScreen / 100)
                EqualCheck = false
            }
            else if sender.tag == 21{
                // When clear button inputed display need to display "0" and "C" should transform to "AC"
                Display.text! = "0"
                ClearB.setTitle("AC", for: .normal)
                EqualCheck = false
            }
            
            calcOperation = sender.tag
            performingMath = true
        }
        else if sender.tag == 28 && Display.text != "" && Display.text!.last! != "." && Display.text!.first! != "."{
           
            if calcOperation == 27{
                numberOnScreen = Double(Display.text!)!
                Display.text! = String(tempNumber + numberOnScreen)
                EqualCheck = true
            }
            else if calcOperation == 26{
                numberOnScreen = Double(Display.text!)!
                Display.text! = String(tempNumber - numberOnScreen)
                EqualCheck = true
            }
            else if calcOperation == 25{
                numberOnScreen = Double(Display.text!)!
                Display.text! = String(tempNumber * numberOnScreen)
                EqualCheck = true
            }
            else if calcOperation == 24{
                numberOnScreen = Double(Display.text!)!
                Display.text! = String(tempNumber / numberOnScreen)
                EqualCheck = true
            }
            
        }
        else if sender.tag == 21 && Display.text != "" && Display.text!.last! != "." && Display.text!.first! != "."{
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

