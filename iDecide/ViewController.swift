//
//  ViewController.swift
//  iDecide
//
//  Created by Nicole on 8/3/16.
//  Copyright © 2016 Nicole Nigro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var numberOfChoices: [String] = [ "Pick a Number", "2", "3", "4", "5"]
    var decisionMaker: [String] = []
    var currentRow: Int = 0

    
    @IBOutlet weak var getDecisionLabel: UIButton!
    
    
    @IBOutlet weak var makeAnotherDecisionLabel: UIButton!
    
    @IBOutlet weak var iDecideLabel: UILabel!
    
    @IBOutlet weak var numberPicker: UIPickerView!
    
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var textFieldOne: UITextField!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var textFieldTwo: UITextField!
    
    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var textFieldThree: UITextField!
    
    @IBOutlet weak var labelFour: UILabel!
    
    @IBOutlet weak var textFieldFour: UITextField!
    
    @IBOutlet weak var labelFive: UILabel!
    
    @IBOutlet weak var textFieldFive: UITextField!
    
    @IBAction func getDecisionTapped(_ sender: AnyObject) {
        var randomIndex: Int = 0
        if self.currentRow == 0{
            let title: String = "Number of Choices Not Selected"
            let message: String = "Please choose a number then try again"
            let okText: String = "Ok"
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel , handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }else if currentRow == 1 {
            if self.textFieldOne.text == "" || self.textFieldTwo.text == "" {
                let title: String = "Empty Text Field"
                let message: String = "Please fill in all of the text fields that are shown"
                let okText: String = "Ok"
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel , handler: nil)
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            } else {
            decisionMaker.append(textFieldOne.text!)
            decisionMaker.append(textFieldTwo.text!)
            randomIndex = Int(arc4random_uniform(UInt32(decisionMaker.count - 1)))
            finalDecisionLabel.alpha = 0
            finalDecisionLabel.text = decisionMaker[randomIndex]
            animateFinal(finalDecisionLabel)
            }
        }else if currentRow == 2 {
            if self.textFieldOne.text == "" || self.textFieldTwo.text == "" || self.textFieldThree.text == ""{
                let title: String = "Empty Text Field"
                let message: String = "Please fill in all of the text fields that are shown"
                let okText: String = "Ok"
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel , handler: nil)
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            } else {
            decisionMaker.append(textFieldOne.text!)
            decisionMaker.append(textFieldTwo.text!)
            decisionMaker.append(textFieldThree.text!)
            randomIndex = Int(arc4random_uniform(UInt32(decisionMaker.count - 1)))
            finalDecisionLabel.alpha = 0
            finalDecisionLabel.text = decisionMaker[randomIndex]
            animateFinal(finalDecisionLabel)
            }
        }else if currentRow == 3 {
            if self.textFieldOne.text == "" || self.textFieldTwo.text == "" || self.textFieldThree.text == "" || self.textFieldFour.text == ""{
                let title: String = "Empty Text Field"
                let message: String = "Please fill in all of the text fields that are shown"
                let okText: String = "Ok"
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel , handler: nil)
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            } else {
            decisionMaker.append(textFieldOne.text!)
            decisionMaker.append(textFieldTwo.text!)
            decisionMaker.append(textFieldThree.text!)
            decisionMaker.append(textFieldFour.text!)
            randomIndex = Int(arc4random_uniform(UInt32(decisionMaker.count - 1)))
            finalDecisionLabel.alpha = 0
            finalDecisionLabel.text = decisionMaker[randomIndex]
            animateFinal(finalDecisionLabel)
            }
        }else if currentRow == 4 {
            if self.textFieldOne.text == "" || self.textFieldTwo.text == "" || self.textFieldThree.text == "" || self.textFieldFour.text == "" || self.textFieldFive.text == ""{
                let title: String = "Empty Text Field"
                let message: String = "Please fill in all of the text fields that are shown"
                let okText: String = "Ok"
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel , handler: nil)
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            } else {
            decisionMaker.append(textFieldOne.text!)
            decisionMaker.append(textFieldTwo.text!)
            decisionMaker.append(textFieldThree.text!)
            decisionMaker.append(textFieldFour.text!)
            decisionMaker.append(textFieldFive.text!)
            randomIndex = Int(arc4random_uniform(UInt32(decisionMaker.count - 1)))
            finalDecisionLabel.alpha = 0
            finalDecisionLabel.text = decisionMaker[randomIndex]
            animateFinal(finalDecisionLabel)
            }
        }
        
        
        
    }
    
    @IBOutlet weak var finalDecisionLabel: UILabel!
    
    @IBAction func makeAnotherDecisionTapped(_ sender: AnyObject) {
        numberPicker.reloadAllComponents()
        numberPicker.selectRow(0, inComponent: 0, animated: true)
        decisionMaker = []
        currentRow = 0
        textFieldOne.text = ""
        textFieldTwo.text = ""
        textFieldThree.text = ""
        textFieldFour.text = ""
        textFieldFive.text = ""
        
        textFieldOne.isHidden = true
        textFieldTwo.isHidden = true
        textFieldThree.isHidden = true
        textFieldFour.isHidden = true
        textFieldFive.isHidden = true
        
        labelOne.isHidden = true
        labelTwo.isHidden = true
        labelThree.isHidden = true
        labelFour.isHidden = true
        labelFive.isHidden = true
        
        finalDecisionLabel.text = ""
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.numberPicker.delegate = self
        self.numberPicker.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "black wood")!)
        
        textFieldOne.isHidden = true
        textFieldTwo.isHidden = true
        textFieldThree.isHidden = true
        textFieldFour.isHidden = true
        textFieldFive.isHidden = true
        
        labelOne.isHidden = true
        labelTwo.isHidden = true
        labelThree.isHidden = true
        labelFour.isHidden = true
        labelFive.isHidden = true
        
        getDecisionLabel.layer.cornerRadius = 5
        getDecisionLabel.layer.borderWidth = 1
        getDecisionLabel.layer.borderColor = UIColor.white.cgColor
        
        makeAnotherDecisionLabel.layer.cornerRadius = 5
        makeAnotherDecisionLabel.layer.borderWidth = 1
        makeAnotherDecisionLabel.layer.borderColor = UIColor.white.cgColor
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfChoices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberOfChoices[row]
    }
    
    func  pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 0 {
            currentRow = 0
        }
        if row == 1 {
            textFieldOne.alpha = 0
            textFieldTwo.alpha = 0
            
            labelOne.alpha = 0
            labelTwo.alpha = 0
            
            currentRow = 1
            textFieldOne.isHidden = false
            textFieldTwo.isHidden = false
            
            animateLabel(textFieldOne)
            animateLabel(textFieldTwo)
            
            animateLabel2(labelOne)
            animateLabel2(labelTwo)
            
            textFieldThree.isHidden = true
            textFieldFour.isHidden = true
            textFieldFive.isHidden = true
            
            labelOne.isHidden = false
            labelTwo.isHidden = false
            
            
            labelThree.isHidden = true
            labelFour.isHidden = true
            labelFive.isHidden = true
        }else if row == 2 {
            textFieldOne.alpha = 0
            textFieldTwo.alpha = 0
            textFieldThree.alpha = 0
            
            labelOne.alpha = 0
            labelTwo.alpha = 0
            labelThree.alpha = 0
            
            currentRow = 2
            textFieldOne.isHidden = false
            textFieldTwo.isHidden = false
            textFieldThree.isHidden = false
            
            textFieldFour.isHidden = true
            textFieldFive.isHidden = true

            animateLabel(textFieldOne)
            animateLabel(textFieldTwo)
            animateLabel(textFieldThree)
            
            animateLabel2(labelOne)
            animateLabel2(labelTwo)
            animateLabel2(labelThree)
            
            labelOne.isHidden = false
            labelTwo.isHidden = false
            labelThree.isHidden = false
            
            labelFour.isHidden = true
            labelFive.isHidden = true
        }else if row == 3{
            textFieldOne.alpha = 0
            textFieldTwo.alpha = 0
            textFieldThree.alpha = 0
            textFieldFour.alpha = 0
            
            labelOne.alpha = 0
            labelTwo.alpha = 0
            labelThree.alpha = 0
            labelFour.alpha = 0
            
            currentRow = 3
            textFieldOne.isHidden = false
            textFieldTwo.isHidden = false
            textFieldThree.isHidden = false
            textFieldFour.isHidden = false

            textFieldFive.isHidden = true
            
            animateLabel(textFieldOne)
            animateLabel(textFieldTwo)
            animateLabel(textFieldThree)
            animateLabel(textFieldFour)
            
            animateLabel2(labelOne)
            animateLabel2(labelTwo)
            animateLabel2(labelThree)
            animateLabel2(labelFour)
            
            labelOne.isHidden = false
            labelTwo.isHidden = false
            labelThree.isHidden = false
            labelFour.isHidden = false
            
            labelFive.isHidden = true
        }else if row == 4 {
            textFieldOne.alpha = 0
            textFieldTwo.alpha = 0
            textFieldThree.alpha = 0
            textFieldFour.alpha = 0
            textFieldFive.alpha = 0
            
            labelOne.alpha = 0
            labelTwo.alpha = 0
            labelThree.alpha = 0
            labelFour.alpha = 0
            labelFive.alpha = 0
            
            currentRow = 4
            textFieldOne.isHidden = false
            textFieldTwo.isHidden = false
            textFieldThree.isHidden = false
            textFieldFour.isHidden = false
            textFieldFive.isHidden = false
            
            animateLabel(textFieldOne)
            animateLabel(textFieldTwo)
            animateLabel(textFieldThree)
            animateLabel(textFieldFour)
            animateLabel(textFieldFive)
            
            animateLabel2(labelOne)
            animateLabel2(labelTwo)
            animateLabel2(labelThree)
            animateLabel2(labelFour)
            animateLabel2(labelFive)
            
            labelOne.isHidden = false
            labelTwo.isHidden = false
            labelThree.isHidden = false
            labelFour.isHidden = false
            labelFive.isHidden = false
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        let pickerLabel = UILabel()
        let myTitle = NSAttributedString(string: numberOfChoices[row], attributes: [NSAttributedStringKey.font:UIFont(name: "Gill Sans", size: 30.0)!, NSAttributedStringKey.foregroundColor: UIColor.white])
        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    func animateLabel(_ textField: UITextField) {
        let myAnimation = {() -> Void in
            textField.alpha = 1
        }
        UIView.animate(withDuration: 2, animations: myAnimation)
    }
    func animateLabel2(_ label: UILabel) {
        let myAnimation = {() -> Void in
            label.alpha = 1
        }
        UIView.animate(withDuration: 2, animations: myAnimation)
    }
    func animateFinal(_ label: UILabel) {
        let myAnimation = {() -> Void in
            label.alpha = 1
        }
        UIView.animate(withDuration: 3, animations: myAnimation)
    }
}
