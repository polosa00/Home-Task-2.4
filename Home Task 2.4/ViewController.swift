//
//  ViewController.swift
//  Home Task 2.4
//
//  Created by Александр Полочанин on 23.03.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var transformColorView: UIView!
    
    @IBOutlet var redChanelLabel: UILabel!
    @IBOutlet var greenChanelLabel: UILabel!
    @IBOutlet var blueChanelLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = Float.random(in: 0...255)
        greenSlider.value = Float.random(in: 0...255)
        blueSlider.value = Float.random(in: 0...255)
        
        setupColorValues()
        setupLabelValues()
    }
    
    @IBAction func redChanelSlider() {
        setupLabelValues()
        setupColorValues()
    }
    
    @IBAction func tappedRedButton() {
        guard let inputText = redTextField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Поле для ввода пустое!", andMessage: "Пожалуйста, введите данные")
            return
        }
        
        if let inputValue = redTextField.text, let floatValue = Float(inputValue) {
            redSlider.value = floatValue
            redChanelLabel.text = String(floatValue)
            if floatValue > 255 {
                showAlert(withTitle: "Вы ввели значение превышающее 255!", andMessage: "Введите значение от 0 до 255")
            }
        }
        
        let chanelValuePattern = "^[0-9]{0,3}$"
        let isChanelValueValid = NSPredicate(format: "SELF MATCHES %@", chanelValuePattern)
            .evaluate(with: inputText)
        
        if !isChanelValueValid {
            showAlert(
                withTitle: "Неверный формат",
                andMessage: "Введите значение от 0 до 255"
            )
            return
        }
        
        setupColorValues()
    }
    
    @IBAction func tappedGreenButton() {
        guard let inputText = greenTextField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Поле для ввода пустое!", andMessage: "Пожалуйста, введите данные")
            return
        }
        
        if let inputValue = greenTextField.text, let floatValue = Float(inputValue) {
            greenSlider.value = floatValue
            greenChanelLabel.text = String(floatValue)
            if floatValue > 255 {
                showAlert(withTitle: "Вы ввели значение превышающее 255!", andMessage: "Введите значение от 0 до 255")
            }
        }
        
        let chanelValuePattern = "^[0-9]{0,3}$"
        let isChanelValuePattern = NSPredicate(format: "SELF MATCHES %@", chanelValuePattern)
            .evaluate(with: inputText)
        
        if !isChanelValuePattern {
            showAlert(withTitle: "Неверный формат", andMessage: "Введите значение от 0 до 255")
        }
        
        setupColorValues()
    }
    
    @IBAction func tappedBlueButton() {
        guard let inputText = blueTextField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Поле для ввода пустое!", andMessage: "Пожалуйста, введите данные")
            return
        }
        
        if let inputValue = blueTextField.text, let floatValue = Float(inputValue) {
            blueSlider.value = floatValue
            blueChanelLabel.text = String(floatValue)
            if floatValue > 255 {
                showAlert(withTitle: "Вы ввели значение превышающее 255!", andMessage: "Введите значение от 0 до 255")
            }
        }
        
        let chanelValuePattern = "^[0-9]{0,3}$"
        let isChanelValuePattern = NSPredicate(format: "SELF MATCHES %@", chanelValuePattern)
            .evaluate(with: inputText)
        
        if !isChanelValuePattern {
            showAlert(withTitle: "Неверный формат", andMessage: "Введите значение от 0 до 255")
        }
        
        setupColorValues()
        
    }
    
}

extension ViewController {
    private func setupLabelValues() {
        redChanelLabel.text = String(format: "%.2f", redSlider.value)
        greenChanelLabel.text = String(format: "%.2f", greenSlider.value)
        blueChanelLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setupColorValues() {
        transformColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value) / 255,
            green: CGFloat(greenSlider.value) / 255,
            blue: CGFloat(blueSlider.value) / 255,
            alpha: 1
        )
    }
}

extension ViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.redTextField.text = ""
            self.redChanelLabel.text = "0.00"
            self.redSlider.value = 0
            
            self.greenTextField.text = ""
            self.greenChanelLabel.text = "0.00"
            self.greenSlider.value = 0
            
            self.blueTextField.text = ""
            self.blueChanelLabel.text = "0.00"
            self.blueSlider.value = 0
        }
        alert.addAction(okAction)
        present(alert, animated: true)

    }
}

