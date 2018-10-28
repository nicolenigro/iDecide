//
//  QuizViewController.swift
//  iDecide
//
//  Created by Holly Ansel on 8/4/16.
//  Copyright © 2016 Nicole Nigro. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let numberArray: [String] = ["Pick a #", "1", "2", "3"]
    var emotionalMultiplier: Float = 0
    var financialMultiplier: Float = 0
    var physicalMultiplier: Float = 0
    var eSlider: Float = 0
    var fSlider: Float = 0
    var pSlider: Float = 0
    var finalPercentage: Float = 0
    var pickerRowComponent0: Int = 0
    var pickerRowComponent1: Int = 0
    var pickerRowComponent2: Int = 0
    
    
    
    
    @IBOutlet weak var riskPicker: UIPickerView!
    
    
    @IBOutlet weak var submitLabel: UIButton!
    
    
    @IBOutlet weak var takeQuizAgainLabel: UIButton!
    
    @IBAction func againButton(_ sender: AnyObject) {
        riskPicker.reloadAllComponents()
        riskPicker.selectRow(0, inComponent: 0, animated: true)
        riskPicker.selectRow(0, inComponent: 1, animated: true)
        riskPicker.selectRow(0, inComponent: 2, animated: true)
        emotionalMultiplier = 0
        financialMultiplier = 0
        physicalMultiplier = 0
        eSlider = 0
        fSlider = 0
        pSlider = 0
        finalPercentage = 0
        pickerRowComponent0 = 0
        pickerRowComponent1 = 0
        pickerRowComponent2 = 0
        riskFactorLabel.text = ""
        emotionalSlider.setValue(0.5, animated: true)
        financialSlider.setValue(0.5, animated: true)
        physicalSlider.setValue(0.5, animated: true)
    
        
    }
    @IBOutlet weak var emotionalSlider: UISlider!
    
    @IBOutlet weak var financialSlider: UISlider!
    
    @IBOutlet weak var physicalSlider: UISlider!
    
    @IBAction func submitButton(_ sender: AnyObject) {
        if self.pickerRowComponent0 == 0 || self.pickerRowComponent1 == 0 || self.pickerRowComponent2 == 0{
            let title: String = "Ranking not selected"
            let message: String = "Please choose a ranking"
            let okText: String = "Ok"
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel , handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }else{
            
        sliderValue()
            
        finalPercentage = ((((emotionalMultiplier * eSlider) + (financialMultiplier * fSlider) + (physicalMultiplier * pSlider)) / 3) * 100)
        riskFactorLabel.alpha = 0
        riskFactorLabel.text = String("\(finalPercentage)% chance of this ending poorly")
        animateFinal(riskFactorLabel)
        }
    }
    
    @IBOutlet weak var riskFactorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "black wood")!)
        self.riskPicker.delegate = self
        self.riskPicker.dataSource = self
        
        submitLabel.layer.cornerRadius = 5
        submitLabel.layer.borderWidth = 1
        submitLabel.layer.borderColor = UIColor.white.cgColor
        
        takeQuizAgainLabel.layer.cornerRadius = 5
        takeQuizAgainLabel.layer.borderWidth = 1
        takeQuizAgainLabel.layer.borderColor = UIColor.white.cgColor
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sliderValue() {
        eSlider = emotionalSlider.value
        fSlider = financialSlider.value
        pSlider = physicalSlider.value
        
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberArray[row]
    }
    
    func  pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            emotionalMultiplier = 1.0/Float(row)
            pickerRowComponent0 = row
        }
        
        if component == 1 {
            financialMultiplier = 1.0/Float(row)
            pickerRowComponent1 = row

        }
        
        if component == 2{
            physicalMultiplier = 1.0/Float(row)
            pickerRowComponent2 = row
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        let pickerLabel = UILabel()
        let myTitle = NSAttributedString(string: numberArray[row], attributes: [NSAttributedStringKey.font:UIFont(name: "Gill Sans", size: 22.0)!, NSAttributedStringKey.foregroundColor: UIColor.white])
        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    func animateFinal(_ label: UILabel) {
        let myAnimation = {() -> Void in
            label.alpha = 1
        }
        UIView.animate(withDuration: 3, animations: myAnimation)
    }
}

