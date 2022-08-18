//
//  RegisterScreen.swift
//  Crower
//
//  Created by Otávio Albuquerque on 18/08/22.
//

import UIKit

class RegisterScreen: UIView {
    
    
    
    
    lazy var titleView: UILabel = {
        var title = UILabel()
        title.text = "𝓡𝓮𝓰𝓲𝓼𝓽𝓮𝓻"
        title.font = UIFont.systemFont(ofSize: 40)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var nameField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.borderStyle = .roundedRect
        field.keyboardType = .default
        field.isSecureTextEntry = false
        field.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        field.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 0.4)
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.white.cgColor
        return field
    }()
    
    lazy var emailField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.borderStyle = .roundedRect
        field.keyboardType = .default
        field.isSecureTextEntry = false
        field.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        field.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 0.4)
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.white.cgColor
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.borderStyle = .roundedRect
        field.keyboardType = .default
        field.isSecureTextEntry = true
        field.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        field.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 0.4)
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.white.cgColor
        return field
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor (red: 0.23, green: 0.65, blue: 0.95, alpha: 1)
        return button
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.18, alpha: 1.00)
        addSubview(titleView)
        addSubview(nameField)
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(registerButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            nameField.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 130),
            nameField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            nameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor,constant: 15),
            emailField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            emailField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 15),
            passwordField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 100),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 39)
            
            
        ])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
