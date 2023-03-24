//
//  ViewController.swift
//  Home Task 2.4
//
//  Created by Александр Полочанин on 23.03.23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlets
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
    
    @IBOutlet var redButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = Float.random(in: 0...255)
        greenSlider.value = Float.random(in: 0...255)
        blueSlider.value = Float.random(in: 0...255)
        
        setupColorValues()
        setupLabelValues()
        
        redTextField.isHidden = true
        greenTextField.isHidden = true
        blueTextField.isHidden = true
        
        redButton.isHidden = true
        greenButton.isHidden = true
        blueButton.isHidden = true
        
    }
    // MARK: - IBActions
    @IBAction private func rgbSlider() {
        setupLabelValues()
        setupColorValues()
    }
    
    
    @IBAction private func switcherForButtonsAndTF(_ sender: UISwitch) {
        if sender.isOn {
            redTextField.isHidden.toggle()
            greenTextField.isHidden.toggle()
            blueTextField.isHidden.toggle()
            
            redButton.isHidden.toggle()
            greenButton.isHidden.toggle()
            blueButton.isHidden.toggle()
            
            redSlider.setValue(Float.random(in: 0...255), animated: true)
            greenSlider.setValue(Float.random(in: 0...255), animated: true)
            blueSlider.setValue(Float.random(in: 0...255), animated: true)
            setupColorValues()
            
        } else {
            redTextField.isHidden.toggle()
            greenTextField.isHidden.toggle()
            blueTextField.isHidden.toggle()
            
            redButton.isHidden.toggle()
            greenButton.isHidden.toggle()
            blueButton.isHidden.toggle()
        }
    }
    
    @IBAction private func tappedRedButton() {
        guard let inputText = redTextField.text, !inputText.isEmpty else {
            showAlert(
                withTitle: "TEXT FIELD IS EMPTY",
                andMessage: "Please enter data"
            )
            return
        }
        
        if let inputValue = redTextField.text, let floatValue = Float(inputValue) {
            if floatValue > 255 {
                showAlert(
                    withTitle: "ATTENTION",
                    andMessage: "Value greater than 255. Input value from 0 to 255"
                )
            } else {
                redSlider.setValue(floatValue, animated: true)
                redChanelLabel.text = String(format: "%.2f",floatValue)
            }
        }
        
        let chanelValuePattern = "^[0-9]{0,3}$"
        let isChanelValueValid = NSPredicate(format: "SELF MATCHES %@", chanelValuePattern)
            .evaluate(with: inputText)
        
        if !isChanelValueValid {
            showAlert(
                withTitle: "WRONG FORMAT",
                andMessage: "Input value from 0 to 255"
            )
            return
        }
        
        setupColorValues()
    }
    
    @IBAction private func tappedGreenButton() {
        guard let inputText = greenTextField.text, !inputText.isEmpty else {
            showAlert(
                withTitle: "TEXT FIELD IS EMPTY",
                andMessage: "Please enter data"
            )
            return
        }
        
        if let inputValue = greenTextField.text, let floatValue = Float(inputValue) {
            if floatValue > 255 {
                showAlert(
                    withTitle: "ATTENTION",
                    andMessage: "Value greater than 255. Input value from 0 to 255"
                )
            } else {
                greenSlider.setValue(floatValue, animated: true)
                greenChanelLabel.text = String(format: "%.2f", floatValue)
            }
        }
        
        let chanelValuePattern = "^[0-9]{0,3}$"
        let isChanelValuePattern = NSPredicate(format: "SELF MATCHES %@", chanelValuePattern)
            .evaluate(with: inputText)
        
        if !isChanelValuePattern {
            showAlert(
                withTitle: "WRONG FORMAT",
                andMessage: "Input value from 0 to 255"
            )
        }
        
        setupColorValues()
    }
    
    @IBAction private func tappedBlueButton() {
        guard let inputText = blueTextField.text, !inputText.isEmpty else {
            showAlert(
                withTitle: "TEXT FIELD IS EMPTY",
                andMessage: "Please enter data"
            )
            return
        }
        
        if let inputValue = blueTextField.text, let floatValue = Float(inputValue) {
            if floatValue > 255 {
                showAlert(
                    withTitle: "ATTENTION",
                    andMessage: "Value greater than 255. Input value from 0 to 255"
                )
            } else {
                blueSlider.setValue(floatValue, animated: true)
                blueChanelLabel.text = String(format: "%.2f", floatValue)
            }
        }
        
        let chanelValuePattern = "^[0-9]{0,3}$"
        let isChanelValuePattern = NSPredicate(format: "SELF MATCHES %@", chanelValuePattern)
            .evaluate(with: inputText)
        
        if !isChanelValuePattern {
            showAlert(
                withTitle: "WRONG FORMAT",
                andMessage: "Input value from 0 to 255"
            )
        }
        
        setupColorValues()
    }
    
}

// MARK: - Extension for ViewController
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
            self.redSlider.setValue(0, animated: true)
            
            self.greenTextField.text = ""
            self.greenChanelLabel.text = "0.00"
            self.greenSlider.setValue(0, animated: true)
            
            self.blueTextField.text = ""
            self.blueChanelLabel.text = "0.00"
            self.blueSlider.setValue(0, animated: true)
            self.setupColorValues()
        }
        alert.addAction(okAction)
        present(alert, animated: true)

    }
}

