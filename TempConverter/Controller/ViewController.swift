//
//  ViewController.swift
//  TempConverter
//
//  Created by Felipe Domingos on 26/09/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var tempTextField: UITextField!
    @IBOutlet weak var pickField: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedLabel: UILabel!
    @IBOutlet weak var pickerLabel: UILabel!
    

    var gradePickerValues = ["", "Celsius", "Kelvin", "Farenheit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickField.dataSource = self
        pickField.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gradePickerValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradePickerValues[row] as String
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerLabel.text = gradePickerValues[row]
    }
    
    
    @IBAction func selectedCtrlBtn(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                segmentedLabel.text = "Celsius"
                gradePickerValues.removeAll()
                gradePickerValues.append("")
                gradePickerValues.append("Kelvin")
                gradePickerValues.append("Farenheit")
                pickField.reloadAllComponents()
            case 1:
                segmentedLabel.text = "Kelvin"
                gradePickerValues.removeAll()
                gradePickerValues.append("")
                gradePickerValues.append("Celsius")
                gradePickerValues.append("Farenheit")
                pickField.reloadAllComponents()
            case 2:
                segmentedLabel.text = "Farenheit"
                gradePickerValues.removeAll()
                gradePickerValues.append("")
                gradePickerValues.append("Celsius")
                gradePickerValues.append("Kelvin")
                pickField.reloadAllComponents()
            default: break
        }
    }
    
    @IBAction func converterBtn(_ sender: Any) {
        guard let temperatura = tempTextField?.text, let temp = Double(temperatura) else { return }
        let conversion = Conversion(temp: temp)
            let result = conversion.temp
        if segmentedLabel.text == "Celsius" && pickerLabel.text == "Kelvin" {
            let ck = result + 273.15
            resultLabel.text = "\(ck) K"
            resultLabel.textColor = UIColor.black
            tempTextField.text = ""
            pickField.selectRow(0, inComponent: 0, animated: true)
            segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        } else if segmentedLabel.text == "Celsius" && pickerLabel.text == "Farenheit" {
            let cf = ((result * 9)/5)+32
            resultLabel.text = "\(cf)ºF"
            resultLabel.textColor = UIColor.black
            tempTextField.text = ""
            pickField.selectRow(0, inComponent: 0, animated: true)
            segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        } else if segmentedLabel.text == "Kelvin" && pickerLabel.text == "Celsius" {
            let kc = result - 273.15
            resultLabel.text = "\(kc) ºC"
            resultLabel.textColor = UIColor.black
            tempTextField.text = ""
            pickField.selectRow(0, inComponent: 0, animated: true)
            segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        } else if segmentedLabel.text == "Kelvin" && pickerLabel.text == "Farenheit" {
            let kf = (((result - 273.15)*9)/5)+32
            resultLabel.text = "\(kf) ºF"
            resultLabel.textColor = UIColor.black
            tempTextField.text = ""
            pickField.selectRow(0, inComponent: 0, animated: true)
            segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        }  else if segmentedLabel.text == "Farenheit" && pickerLabel.text == "Celsius" {
            let fc = (((result - 32)*5)/9)
            let conv = String(format: "%.2f", fc)
            resultLabel.text = "\(conv) ºC"
            resultLabel.textColor = UIColor.black
            tempTextField.text = ""
            pickField.selectRow(0, inComponent: 0, animated: true)
            segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        } else if segmentedLabel.text == "Farenheit" && pickerLabel.text == "Kelvin" {
            let fk = (((result - 32)*5)/9)+273.15
            let conv = String(format: "%.2f", fk)
            resultLabel.text = "\(conv) K"
            resultLabel.textColor = UIColor.black
            tempTextField.text = ""
            pickField.selectRow(0, inComponent: 0, animated: true)
            segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        }
    }
}
