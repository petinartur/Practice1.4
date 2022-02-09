//
//  StartViewController.swift
//  Practice1.4
//
//  Created by Артур Петин on 25.01.2022.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class StartViewController: UIViewController {
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {return}
        colorVC.delegate = self
        colorVC.viewColor = view.backgroundColor
    }

}

extension StartViewController: ColorViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
