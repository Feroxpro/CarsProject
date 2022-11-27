//
//  ViewController.swift
//  introViewCode
//
//  Created by Felipe Domingos on 10/11/22.
//

import UIKit

class ViewController: UIViewController, LoginScreenProtocol {
    
    
    var loginScreen: LoginScreen?
    var alert: Alert?
    lazy var viewModel: CarsViewModel = {
        let vm = CarsViewModel(viewController: self)
        return vm
    }()
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundimage = UIImageView(frame: UIScreen.main.bounds)
        backgroundimage.image = UIImage(named: "bmw")
        backgroundimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundimage, at: 0)
        self.loginScreen?.loginTextField.text = "user"
        self.loginScreen?.passwordTextField.text = "123"
        self.alert = Alert(controller: self)
        self.loginScreen?.delegate(delegate: self)
        

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


extension ViewController {
    func actionLoginButton() {
            self.viewModel.validate(user: loginScreen?.loginTextField.text ?? "", pass: loginScreen?.passwordTextField.text ?? "")
        }
        
    }
