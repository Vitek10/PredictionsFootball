//
//  SegmentsViewController.swift
//  testFirebase
//
//  Created by Разработчик on 21.04.2020.
//  Copyright © 2020 Разработчик. All rights reserved.
//

import UIKit
import Firebase

class SegmentsViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var sumScore: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var ref: DatabaseReference!
    var segmentList = [segmentsModel]()
    let userID = Auth.auth().currentUser?.uid
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
         switch sender.selectedSegmentIndex {
           case 0:
               firstView.isHidden = false
               secondView.isHidden = true
               thirdView.isHidden = true
               fourthView.isHidden = true
           case 1:
               firstView.isHidden = true
               secondView.isHidden = false
               thirdView.isHidden = true
               fourthView.isHidden = true
           case 2:
               firstView.isHidden = true
               secondView.isHidden = true
               thirdView.isHidden = false
               fourthView.isHidden = true
           case 3:
               firstView.isHidden = true
               secondView.isHidden = true
               thirdView.isHidden = true
               fourthView.isHidden = false
           default:
               break;
           }
        self.scoreSum()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFirebase()
        UsersRealtimeDatabase()
        selectedSegment()
        scoreSum()
    }
    
    func configureFirebase(){
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
        func UsersRealtimeDatabase(){
             let db = Firestore.firestore()
             let currentUser = Auth.auth().currentUser?.uid ?? ""
             //let uid = Auth.auth().currentUser?.uid
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
                    guard let uid = dataDescription?["uid"] else { return }
                    let ref = Database.database().reference()
                    let usersRef = ref.child("users").child(currentUser)
                    //let newUserRef = usersRef.child(uid!)
                    usersRef.setValue(["email":email,"username":username,"country":country,"uid":uid])
                }
        }
      }
    
    func selectedSegment(){
        ref = Database.database().reference().child("switchSegments")
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
            print(snapshot)
                self.segmentList.removeAll()
                    let segmentObject = snapshot.value! as? [String : AnyObject]
                    let segmentIndex = segmentObject?["index"]
                    let segments = segmentsModel(segmentIndex: segmentIndex as! String?)
                    self.segmentList.append(segments)
                    let index = segmentIndex as! String
            self.segmentedControl.selectedSegmentIndex = Int(index)!
                   switch self.segmentedControl.selectedSegmentIndex {
                        case 0:
                            self.firstView.isHidden = false
                            self.secondView.isHidden = true
                            self.thirdView.isHidden = true
                            self.fourthView.isHidden = true
                        case 1:
                            self.firstView.isHidden = true
                            self.secondView.isHidden = false
                            self.thirdView.isHidden = true
                            self.fourthView.isHidden = true
                        case 2:
                            self.firstView.isHidden = true
                            self.secondView.isHidden = true
                            self.thirdView.isHidden = false
                            self.fourthView.isHidden = true
                        case 3:
                            self.firstView.isHidden = true
                            self.secondView.isHidden = true
                            self.thirdView.isHidden = true
                            self.fourthView.isHidden = false
                        default:
                            break;
        }
            
    })
        
}
    
    func scoreSum(){
        var sum = 0
        ref = Database.database().reference().child("UserScore").child(userID!)
        ref.observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot)
           for highscores in snapshot.children{
               let snap = highscores as! DataSnapshot
               let data = snap.value as? [String: Any]
               let score = data?["Score"] as? Int ?? 0
               sum += score
               self.sumScore.text! = String(sum)
               self.usersHighscore(score: String(sum))
           }
    }
  }
    
    func usersHighscore(score: String){
          let postSecondRef = Database.database().reference().child("UsersHighscore").child(userID!)
          let username = Auth.auth().currentUser?.displayName
                 let postSecondObject = [
                     "username": username,
                     "Score": score
                         ]
                         postSecondRef.setValue(postSecondObject,withCompletionBlock: {error, ref in
                             if error == nil{
                                 self.dismiss(animated: true, completion: nil)
                   }
                             else {

               }
          })
    }
}
    


