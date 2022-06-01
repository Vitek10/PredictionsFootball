//
//  ProfileViewController.swift
//  PredictionsFootball
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    let db = Firestore.firestore()
    let currentUser = Auth.auth().currentUser?.uid ?? ""
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        updateUsername()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsersRealtimeDatabase()
    }
    
    func UsersRealtimeDatabase(){
        db.collection("users").whereField("uid", isEqualTo: currentUser).getDocuments { (querySnapshot, err) in
        if let err = err {
            print(err.localizedDescription)
                    return
            } else {
                let document = querySnapshot!.documents.first
                let dataDescription = document?.data()
                guard let email = dataDescription?["email"] else { return }
                guard let username = dataDescription?["username"] else { return }
                guard let country = dataDescription?["country"] else { return }
                self.usernameTextField.text = username as? String
                self.countryTextField.text = country as? String
                self.emailTextField.text = email as? String
                }
           }
    }
    
    func updateUsername(){
       db.collection("users").whereField("uid", isEqualTo: currentUser).getDocuments { (querySnapshot, err) in
                if let err = err {
                         print(err.localizedDescription)
                          return
                      }  else {
                          let document = querySnapshot!.documents.first
                            document!.reference.updateData([
                                "username": self.usernameTextField.text!,
                                "country": self.countryTextField.text!
                          ])
            }
        }
         Database.database().reference().root.child("users").child(currentUser).updateChildValues(["username":  self.usernameTextField.text!,
              "country": self.countryTextField.text!])
    }
    
}
