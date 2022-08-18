//
//  RegisterScreenController.swift
//  Crower
//
//  Created by Otávio Albuquerque on 18/08/22.
//

import UIKit

class RegisterScreenController: UIViewController {
    
    var screen: RegisterScreen?
    
    override func loadView() {

        self.screen = RegisterScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen?.registerButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func registerAction() {
        let name = screen?.nameField.text
        let email = screen?.emailField.text
        let password = screen?.passwordField.text
        print(name)
        
        if name != "" && email != "" && password != ""{
            Task{
                let res = try await API.createUser(name: name!, email: email!, password: password!)
                if let res = res {
                    let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
                    homeController.session = res
                    show(homeController, sender: self)
                }
                
                
            }
            
        }
        
        
    }

}
