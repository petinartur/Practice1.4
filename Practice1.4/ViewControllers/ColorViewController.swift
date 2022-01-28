//
//  ViewController.swift
//  Practice1.4
//  Created by Артур Петин on 19.10.2021.
//

import UIKit



class ColorViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var bleuLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    var delegate: backgorundColorDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        viewColor.layer.cornerRadius = 10
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        updateColor()
        setValue(for: redLabel, greenLabel, bleuLabel)
        
        //viewColor.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }

    
    @IBAction func rgbSlider(_ sender: UISlider) {
        updateColor()
        
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: bleuLabel)
        }
    }
    
    
    
    @IBAction func DoneButtonPressed() {
        delegate.setColot(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value)
        )
    }
    
    
    private func updateColor(){
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        viewColor.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = updateName(from: redSlider)
            case greenLabel:
                label.text = updateName(from: greenSlider)
            default:
                label.text = updateName(from: blueSlider)
            }
        }
    }
    
    private func updateName(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
