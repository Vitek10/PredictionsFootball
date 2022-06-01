//
//  LoginViewController.swift
//  Demo predictions
//
//  Created by Витя on 3/24/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var forgotButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func setUpElements(){
           
           errorLabel.alpha = 0
           
           Utilities.styleTextField(emailTextField)
           Utilities.styleTextField(passwordTextField)
           Utilities.styleFilledButton(loginButton)
           Utilities.styleHollowButton(forgotButton)
       }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
         Auth.auth().signIn(withEmail:email, password: password) { (result,error) in
                       if error != nil {
                        self.errorLabel.text = error!.localizedDescription
                        self.errorLabel.alpha = 1
                       }
                       else{
                        if Auth.auth().currentUser!.isEmailVerified{
                        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController)
                        self.view.window?.rootViewController = homeViewController
                        self.view.window?.makeKeyAndVisible()
                        }else{
                            print("Please Verify it")
                        }
            }
        }
    
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
