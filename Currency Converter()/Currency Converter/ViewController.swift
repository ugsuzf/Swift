//
//  ViewController.swift
//  Currency Converter
//
//  Created by Furkan Kaan Ugsuz on 16/09/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyCode.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyCode[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeCurrency = values[row]
        updateViews(input: activeCurrency)
    }
    

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var currencyCode: [String] = []
    var values: [Double] = []
    var activeCurrency = 0.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        fetchJSON()
        textField.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func updateViews(input: Double){
        guard let amountText = textField.text, let theAmountText = Double(amountText) else {return}
        if textField.text != ""{
            let total = theAmountText * activeCurrency
            priceLabel.text = String(format: "%.2f", total)
        }
        
    }
    
    func fetchJSON(){
        guard let url = URL(string: "https://v6.exchangerate-api.com/v6/b2531ad2822ba351e8b0abe1/latest/EUR") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let safeData = data else {return}
            
            do{
                let results = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                self.currencyCode.append(contentsOf: results.conversion_rates.keys)
                self.values.append(contentsOf: results.conversion_rates.values)
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                }
            }catch{
                print(error)
            }
        }.resume()
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

