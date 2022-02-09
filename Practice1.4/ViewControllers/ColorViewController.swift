//
//  ViewController.swift
//  Practice1.4
//  Created by Артур Петин on 19.10.2021.
//

import UIKit



class ColorViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var bleuLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: ColorViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = viewColor
        
        setSlider()
        setValue(for: redLabel, greenLabel, bleuLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }

    
    @IBAction func rgbSlider(_ sender: UISlider) {
        updateColor()
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: bleuLabel)
            setValue(for: blueTextField)
        }
        
        updateColor()
    }
    
    
    
    @IBAction func DoneButtonPressed() {
        delegate?.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    
    private func updateColor(){
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
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
    
    private func setValue(for textflieds: UITextField...) {
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
    
    private func setSlider() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func updateName(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

extension ColorViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redLabel)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenLabel)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: bleuLabel)
            }
            updateColor()
            return
        }
        showAlert(title: "Wrong fomat!", message: "Please Enter correct value")
    }
    
}
