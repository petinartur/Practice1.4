//
//  ViewController.swift
//  Practice1.4
//
//  Created by Артур Петин on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var bleuLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10
        
        updateColor()
        setValue(for: redLabel, greenLabel, bleuLabel)
    }

    
    @IBAction func rgbSlider(_ sender: UISlider) {
        updateColor()
        
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: bleuLabel)
            
        }
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
                label.text = stirng(from: redSlider)
            case greenLabel:
                label.text = stirng(from: greenSlider)
            default:
                label.text = stirng(from: blueSlider)
            }
        }
    }
    
    private func stirng(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
