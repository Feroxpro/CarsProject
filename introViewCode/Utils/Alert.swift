//
//  Alert.swift
//  Carros
//
//  Created by Felipe Domingos on 30/10/22.
//

import Foundation
import UIKit

class Alert:NSObject {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(title: String, message: String, completion:(()->Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { action in
            completion?()
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true, completion: nil)
}
}

