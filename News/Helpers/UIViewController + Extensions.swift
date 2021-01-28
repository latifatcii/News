//
//  UIViewController + Extensions.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
