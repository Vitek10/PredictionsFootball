//
//  SignUpViewController.swift
//  Demo predictions
//
//  Created by Витя on 3/24/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(countryTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    func validateFields() -> String?{
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || countryTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields!"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPassword(cleanedPassword) == false {
            
            return "Please 8 characters"
        }
        
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            //let uidUser = (Auth.auth().currentUser?.uid)!
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let country = countryTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           if (usernameTextField.text?.isEmpty == false){
            let databaseRef = Database.database().reference()
            databaseRef.child("users").queryOrdered(byChild: "username").queryEqual(toValue: username).observeSingleEvent(of: DataEventType.value, with: { (snapshot:DataSnapshot) in
                      if snapshot.exists(){
                        self.showError("User is exist")
                      }
                      else if self.isValidEmail(email) == true{
                          Auth.auth().createUser(withEmail:email, password: password ) { (result,err) in
                          if err != nil {
                            self.showError("Email is exist")
//                             if (Auth.auth().currentUser!.isEmailVerified)==false{
//                                Auth.auth().currentUser?.sendEmailVerification(completion: {(error) in
//                                    self.showError("Please Verify it again...")
//                                    self.updateUsername(username)
//                                    self.updatePassword(password)
//                                })
//                             }else{
//                              self.showError("Email is exist")
//                            }
                              }
                           // Auth.auth().currentUser?.reload(completion: { (err) in
//                            if Auth.auth().currentUser!.isEmailVerified == true{
//                               self.showError("Email is exist")
//                            }
                          else {
                              Auth.auth().currentUser?.sendEmailVerification(completion: {(error) in
                                 self.showError("Please Verify it")
                                 self.userSignUp(username:username,country:country,email:email)
                                })
                              }
                           // })
//                            Timer.scheduledTimer(withTimeInterval: 180.0, repeats: false) { timer in
//                                if Auth.auth().currentUser!.isEmailVerified == false{
//                                let user = Auth.auth().currentUser
//                                user?.delete { error in
//                                    if error != nil {
//                                    // An error happened.
//                                  } else {
//                                    // Account deleted.
//                                  }
//                                    self.removeUserFromCloudFirestore()
//                                }
//                            }
//                          }
                        }
                    
                        
                      }else{
                         self.showError("Error creating email")
                }
                   
                  })
            }
                
        }
        
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? SegmentsViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func userSignUp(username:String,country:String,email:String){
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        db.collection("users").addDocument(data: ["email":email,"username":username,"country":country,"uid":uid!]){ (error) in
            self.updateUsername(username)
                if error  != nil{
                self.showError("Error saving user data")
            }
        }
    }
    
    func isValidEmail(_ validateEmail: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: validateEmail)
    }
    
    func updateUsername(_ username:String){
        let user = Auth.auth().currentUser
            if let user = user {
                let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = username
                    changeRequest.commitChanges { error in
                        if error != nil {
                            // An error happened.
                            } else {
                                // Profile updated.
                }
            }
        }
    }
    
    func updatePassword(_ password:String){
        Auth.auth().currentUser?.updatePassword(to: password) { (error) in
          if error != nil {
          // An error happened.
          } else {
              // Profile updated.
                  }
              }
        }
    func removeUserFromCloudFirestore(){
        let uid = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()
        db.collection("users").whereField("uid", isEqualTo: uid).getDocuments() { (querySnapshot, err) in
          if let err = err {
            print("Error getting documents: \(err)")
          } else {
            for document in querySnapshot!.documents {
              document.reference.delete()
            }
          }
        }
    }
//    func checkIfTheEmailIsVerified(){
//        Auth.auth().currentUser?.reload(completion: { (err) in
//            if err == nil{
//                if Auth.auth().currentUser!.isEmailVerified{
//
//                } else {
//
//                    print("It aint verified yet")
//
//                }
//            } else {
//
//                print(err?.localizedDescription)
//
//            }
//        })
//
//    }
    
}

