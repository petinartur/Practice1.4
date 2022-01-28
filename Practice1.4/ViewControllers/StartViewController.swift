//
//  StartViewController.swift
//  Practice1.4
//
//  Created by Артур Петин on 25.01.2022.
//

import UIKit

protocol backgorundColorDelegate {
    func setColot(red: CGFloat, green: CGFloat, blue: CGFloat)
}
class StartViewController: UIViewController, backgorundColorDelegate {
    
    func setColot(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
     func vorkWithColor() {
        let backgroundcolod: UIColor = view.backgroundColor!
        let myColorComponents = backgroundcolod.components
        red = myColorComponents.red
        green = myColorComponents.green
        blue = myColorComponents.blue
    }
    

    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {return}
        vorkWithColor()
        colorVC.delegate = self
        colorVC.red = red
        colorVC.blue = blue
        colorVC.green = green
    }

}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
