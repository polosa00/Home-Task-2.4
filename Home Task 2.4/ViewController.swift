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
    
    
    private var redChanel: CGFloat = 1
    private var greenChanel: CGFloat = 1
    private var blueChanel: CGFloat = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    @IBAction func redChanelSlider() {
        
        redChanelLabel.text = String(format: "%.2f", redSlider.value)
        greenChanelLabel.text = String(format: "%.2f", greenSlider.value)
        blueChanelLabel.text = String(format: "%.2f", blueSlider.value)
        
        redChanel = CGFloat(redSlider.value)
        greenChanel = CGFloat(greenSlider.value)
        blueChanel = CGFloat(blueSlider.value)
        
        transformColorView.backgroundColor = UIColor(
            red: redChanel / 255,
            green: greenChanel / 255,
            blue: blueChanel / 255,
            alpha: 1
        )
    }
}

