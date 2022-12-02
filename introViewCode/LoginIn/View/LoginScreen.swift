//
//  LoginView.swift
//  introViewCode
//
//  Created by Felipe Domingos on 16/11/22.
//

import Foundation
import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
}

class LoginScreen: UIView {
    
    weak var delegate:LoginScreenProtocol?
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    let vc = ViewController()


    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Carros"
        return label
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Login:"
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Senha:"
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "digite seu login"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "digite sua senha"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var btnLogin: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7.5
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(self.tappedLoginbtn), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubViews()
        self.setUpConstraints()
    }
    
    private func configSubViews(){
        self.addSubview(self.titleLabel)
        self.addSubview(self.loginLabel)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.btnLogin)
    }
    
    @objc public func tappedLoginbtn() {
        self.delegate?.actionLoginButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 180),
            self.loginLabel.bottomAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: -50),
            self.loginTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 180),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 45),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 180),
            self.passwordLabel.bottomAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: -50),
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 40),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            self.btnLogin.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.btnLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.btnLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.btnLogin.heightAnchor.constraint(equalToConstant: 45)
            

        ])
    }
}
