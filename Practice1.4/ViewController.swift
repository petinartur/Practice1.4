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
        super.viewDidLoad()//
        viewColor.layer.cornerRadius = 10
        
        updateColor()
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        bleuLabel.text = String(format: "%.2f", blueSlider.value)
    }

    @IBAction func redSliderActiv() {
        updateColor()
        redLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderActiv() {
        updateColor()
        greenLabel.text = String(format: "%.2f", greenSlider.value)
    }
    @IBAction func blueSliderActiv() {
        updateColor()
        bleuLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func updateColor(){
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        viewColor.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }
}
