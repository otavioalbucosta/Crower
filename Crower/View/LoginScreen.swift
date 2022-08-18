//
//  LoginScreen.swift
//  Crower
//
//  Created by Otávio Albuquerque on 18/08/22.
//

import UIKit

class LoginScreen: UIView {
    
    lazy var subImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "crowbg-1")
        return imageView
    }()
    
    lazy var titleView: UILabel = {
        var title = UILabel()
        title.text = "𝓒𝓻𝓸𝔀𝓮𝓻"
        title.font = UIFont.systemFont(ofSize: 40)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "Sua rede social favorita para crocitar!"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
        
    }()
    
    lazy var loginTextField: UITextField = {
        let field = UITextField()
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        field.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 0)
        field.textColor = .white
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: field.frame.height - 2, width: field.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.white.cgColor

        field.layer.addSublayer(bottomLine)
        
        return field
        
    }()
    
    lazy var passwordTextField: UITextField = {
        let field = UITextField()
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.borderStyle = .none
        field.keyboardType = .default
        field.isSecureTextEntry = true
        field.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        field.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 0)
        field.textColor = .white
        return field
        
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor (red: 0.23, green: 0.65, blue: 0.95, alpha: 1)
        return button
        
    }()
    
    lazy var passwordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Crie sua conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
//        button.backgroundColor = UIColor(red: 41/255, green: 1/255, blue: 1/255, alpha: 0.5)
        return button
        
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subImageView)
        addSubview(titleView)
        addSubview(descriptionLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(passwordButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
                NSLayoutConstraint.activate([
            subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -5),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 120),
            loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            loginTextField.heightAnchor.constraint(equalToConstant: 39),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 39),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: 39),
            
            passwordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 200),
            passwordButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            passwordButton.heightAnchor.constraint(equalToConstant: 39),
            
            
        
        
        ])
    }
    
}

