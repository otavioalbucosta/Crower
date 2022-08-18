//
//  ViewController.swift
//  Crower
//
//  Created by Otávio Albuquerque on 09/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        self.screen = LoginScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loadView()
        
        self.screen?.loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        self.screen?.passwordButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupHideKeyboardOnTap()
        let loginbottomLine = CALayer()
        loginbottomLine.frame = CGRect(x: 0, y: screen!.loginTextField.frame.height - 2, width: screen!.loginTextField.frame.width, height: 2)
        loginbottomLine.backgroundColor = UIColor.white.cgColor
        loginbottomLine.borderColor = UIColor.white.cgColor
        screen!.loginTextField.layer.addSublayer(loginbottomLine)
        
        let passwordbottomLine = CALayer()
        print(screen?.passwordTextField.frame)
        passwordbottomLine.frame = CGRect(x: 0, y: screen!.passwordTextField.frame.height - 1, width: screen!.passwordTextField.frame.width, height: 2)
        passwordbottomLine.backgroundColor = UIColor.white.cgColor
        passwordbottomLine.borderColor = UIColor.white.cgColor
        screen!.passwordTextField.layer.addSublayer(passwordbottomLine)
        
        
    }
    
    @objc func loginAction() {
        do{
            if screen?.loginTextField.text != "" && screen?.passwordTextField.text != "" {
                Task{
                    let res = try await API.login(username: (screen?.loginTextField.text)!, password: (screen?.passwordTextField.text!)!)
                    if let res = res {
                        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
                        homeController.session = res
                        show(homeController, sender: self)
                    }else{
                        self.screen?.descriptionLabel.text = "Senha errada!"
                    }
                    
                }
            }
        
            
        }catch {
            print(error)
        }
       
    }
    
    @objc func registerAction() {
        let registerController = RegisterScreenController()
        show(registerController, sender: self)
        
    }
    
    func setupHideKeyboardOnTap() {
            self.view.addGestureRecognizer(self.endEditingRecognizer())
            self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
        }

        /// Dismisses the keyboard from self.view
        private func endEditingRecognizer() -> UIGestureRecognizer {
            let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
            tap.cancelsTouchesInView = false
            return tap
        }


}

