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
        setValueTextField(for: redTextField, greenTextField, blueTextField)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }

    
    @IBAction func rgbSlider(_ sender: UISlider) {
        updateColor()
        
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: bleuLabel)
        }
        
        switch sender {
        case redSlider: setValueTextField(for: redTextField)
        case greenSlider: setValueTextField(for: greenTextField)
        default: setValueTextField(for: blueTextField)
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
    
    private func setValueTextField(for textflieds: UITextField...) {
        textflieds.forEach { textfield in
            switch textfield {
            case redTextField:
                textfield.text = updateName(from: redSlider)
            case greenTextField:
                textfield.text = updateName(from: greenSlider)
            default:
                textfield.text = updateName(from: blueSlider)
            }
            
        }
    }
    
    private func updateName(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    // MARK: - Методы для работы с клавиатурой
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

}

extension ColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else {return}
        guard let sliderValue = Float(newValue) else {return}
        
        if textField == redTextField {
            redSlider.value = sliderValue
            redLabel.text = updateName(from: redSlider)
        } else if textField == greenTextField {
            greenSlider.value = sliderValue
            greenLabel.text = updateName(from: greenSlider)
        } else {
            blueSlider.value = sliderValue
            bleuLabel.text = updateName(from: blueSlider)
        }
        updateColor()
    }
}

