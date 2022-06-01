//
//  ForgotPasswordViewController.swift
//  PredictionsFootball
//
//  Created by Разработчик on 16.05.2020.
//  Copyright © 2020 Разработчик. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var sendEmailButton: UIButton!
    
    @IBAction func sendEmail(_ sender: Any) {
        let resetEmail = emailTextField.text
        Auth.auth().sendPasswordReset(withEmail: resetEmail!, completion: { (error) in
            if error != nil{
                self.showMessage("Reset Failed")
            }else {
                 if Auth.auth().currentUser!.isEmailVerified{
                    self.showMessage("Reset email sent successfully")
                }
                 else{
                    self.showMessage("Please verify your \(resetEmail!)!")
                }
            }
        })
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
         setUpElements()
    }
    
    func showMessage(_ message: String){
           labelMessage.text = message
           labelMessage.alpha = 1
       }
    func setUpElements(){
           Utilities.styleTextField(emailTextField)
           Utilities.styleFilledButton(sendEmailButton)
       }

}
