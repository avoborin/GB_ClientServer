//
//  myVKClientSignInViewController.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 06.04.2021.
//

import UIKit

class myVKClientSignInViewController: UIViewController {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let fromSignInToTabBarSegue = "fromSignInToTabBarSegue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginTextField.placeholder = "Enter login here"
        passwordTextField.placeholder = "Enter password here"
    }
    
    func showSignInAlert (alertText: String) {
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: UIAlertController.Style.alert)
        let actionButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: {_ in self.loginTextField.text = ""
            self.passwordTextField.text = ""
            
        })
        alertController.addAction(actionButton)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func pressSignInButton(_ sender: Any) {
        guard let login = self.loginTextField.text,
              let password = self.passwordTextField.text,
              login.trimmingCharacters(in: .whitespacesAndNewlines) == "admin",
              password.trimmingCharacters(in: .whitespacesAndNewlines) == "1234567"
        else {
            showSignInAlert(alertText: "Wrong or empty login or password test fields")
            return
        }
        
        performSegue(withIdentifier: self.fromSignInToTabBarSegue, sender: self)
        
    }
    
    
}

