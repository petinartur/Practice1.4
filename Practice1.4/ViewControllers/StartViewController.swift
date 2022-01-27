//
//  StartViewController.swift
//  Practice1.4
//
//  Created by Артур Петин on 25.01.2022.
//

import UIKit

protocol backgorundColorDelegate {
    func setColot(for red: CGFloat, green: CGFloat, blue: CGFloat)
}
class StartViewController: UIViewController, backgorundColorDelegate {
    
    func setColot(for red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
    

    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {return}
        colorVC.delegate = self
    }

}
