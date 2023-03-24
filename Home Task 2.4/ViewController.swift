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

