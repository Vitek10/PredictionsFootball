import UIKit
import Firebase

class ThirdMatchWeekViewController: UIViewController, UITextFieldDelegate {

   // First Match View
    @IBOutlet weak var firstTeam: UILabel!
    @IBOutlet weak var secondTeam: UILabel!
    @IBOutlet weak var firstScore: UITextField!
    @IBOutlet weak var secondScore: UITextField!
    @IBOutlet weak var firstScorePrediction: UILabel!
    @IBOutlet weak var secondScorePrediction: UILabel!
    @IBOutlet weak var FirstMatchlabelPoints: UILabel!
    @IBOutlet weak var FirstMatchHomeLabelResult: UILabel!
    @IBOutlet weak var FirstMatchGuestLabelResult: UILabel!
    @IBOutlet weak var firstMatchTimer: UILabel!
    @IBOutlet weak var firstMatchButton: UIButton!
    
    // Second Match View
    @IBOutlet weak var firstTeamSecond: UILabel!
    @IBOutlet weak var secondTeamSecond: UILabel!
    @IBOutlet weak var firstScoreSecond: UITextField!
    @IBOutlet weak var secondScoreSecond: UITextField!
    @IBOutlet weak var firstScorePredictionSecond: UILabel!
    @IBOutlet weak var secondScorePredictionSecond: UILabel!
    @IBOutlet weak var FirstMatchlabelPointsSecond: UILabel!
    @IBOutlet weak var FirstMatchHomeLabelResultSecond: UILabel!
    @IBOutlet weak var FirstMatchGuestLabelResultSecond: UILabel!
    @IBOutlet weak var firstMatchTimerSecond: UILabel!
    @IBOutlet weak var firstMatchButtonSecond: UIButton!
    
    // Third Match View
    @IBOutlet weak var firstTeamThird: UILabel!
    @IBOutlet weak var secondTeamThird: UILabel!
    @IBOutlet weak var firstScoreThird: UITextField!
    @IBOutlet weak var secondScoreThird: UITextField!
    @IBOutlet weak var firstScorePredictionThird: UILabel!
    @IBOutlet weak var secondScorePredictionThird: UILabel!
    @IBOutlet weak var FirstMatchlabelPointsThird: UILabel!
    @IBOutlet weak var FirstMatchHomeLabelResultThird: UILabel!
    @IBOutlet weak var FirstMatchGuestLabelResultThird: UILabel!
    @IBOutlet weak var firstMatchTimerThird: UILabel!
    @IBOutlet weak var firstMatchButtonThird: UIButton!

    // Fourth Match View
    @IBOutlet weak var firstTeamFourth: UILabel!
    @IBOutlet weak var secondTeamFourth: UILabel!
    @IBOutlet weak var firstScoreFourth: UITextField!
    @IBOutlet weak var secondScoreFourth: UITextField!
    @IBOutlet weak var firstScorePredictionFourth: UILabel!
    @IBOutlet weak var secondScorePredictionFourth: UILabel!
    @IBOutlet weak var FirstMatchlabelPointsFourth: UILabel!
    @IBOutlet weak var FirstMatchHomeLabelResultFourth: UILabel!
    @IBOutlet weak var FirstMatchGuestLabelResultFourth: UILabel!
    @IBOutlet weak var firstMatchTimerFourth: UILabel!
    @IBOutlet weak var firstMatchButtonFourth: UIButton!
    
    // Fifth Match View
    @IBOutlet weak var firstTeamFifth: UILabel!
    @IBOutlet weak var secondTeamFifth: UILabel!
    @IBOutlet weak var firstScoreFifth: UITextField!
    @IBOutlet weak var secondScoreFifth: UITextField!
    @IBOutlet weak var firstScorePredictionFifth: UILabel!
    @IBOutlet weak var secondScorePredictionFifth: UILabel!
    @IBOutlet weak var FirstMatchlabelPointsFifth: UILabel!
    @IBOutlet weak var FirstMatchHomeLabelResultFifth: UILabel!
    @IBOutlet weak var FirstMatchGuestLabelResultFifth: UILabel!
    @IBOutlet weak var firstMatchTimerFifth: UILabel!
    @IBOutlet weak var firstMatchButtonFifth: UIButton!
    
    
    var ref: DatabaseReference!
    var matchesList = [teamModel]()
    var matchesListPredictions = [predictionsModel]()
    var currentScore = 0
    let userID = Auth.auth().currentUser?.uid
    @IBAction func firstPredictionsTapped(_ sender: Any) {
        let postFirstRef = Database.database().reference().child("thirdWeek").child("firstMatchPredictions").child(userID!)
                let postFirstObject = [
                    "team_1": firstScore.text,
                    "team_2": secondScore.text
                        ]
                        postFirstRef.setValue(postFirstObject,withCompletionBlock: {error, ref in
                            if error == nil{
                                self.dismiss(animated: true, completion: nil)
                            }
                            else{
        
                            }
                        })
        firstMatchPredictionLabel()
    }
    @IBAction func secondPredictionsTapped(_ sender: Any) {
        let postSecondRef = Database.database().reference().child("thirdWeek").child("secondMatchPredictions").child(userID!)
               let postSecondObject = [
                   "team_1": firstScoreSecond.text,
                   "team_2": secondScoreSecond.text
                       ]
                       postSecondRef.setValue(postSecondObject,withCompletionBlock: {error, ref in
                           if error == nil{
                               self.dismiss(animated: true, completion: nil)
                 }
                           else {

             }
        })
        secondMatchPredictionLabel()
    }
     @IBAction func thirdPredictionsTapped(_ sender: Any) {
        let postSecondRef = Database.database().reference().child("thirdWeek").child("thirdMatchPredictions").child(userID!)
               let postSecondObject = [
                   "team_1": firstScoreThird.text,
                   "team_2": secondScoreThird.text
                       ]
                       postSecondRef.setValue(postSecondObject,withCompletionBlock: {error, ref in
                           if error == nil{
                               self.dismiss(animated: true, completion: nil)
                 }
                           else {

             }
        })
        thirdMatchPredictionLabel()
    }
    @IBAction func fourthPredictionsTapped(_ sender: Any) {
        let postSecondRef = Database.database().reference().child("thirdWeek").child("fourthMatchPredictions").child(userID!)
               let postSecondObject = [
                   "team_1": firstScoreFourth.text,
                   "team_2": secondScoreFourth.text
                       ]
                       postSecondRef.setValue(postSecondObject,withCompletionBlock: {error, ref in
                           if error == nil{
                               self.dismiss(animated: true, completion: nil)
                 }
                           else {

             }
        })
        fourthMatchPredictionLabel()
    }
    @IBAction func fifthPredictionsTapped(_ sender: Any) {
        let postSecondRef = Database.database().reference().child("thirdWeek").child("fifthMatchPredictions").child(userID!)
               let postSecondObject = [
                   "team_1": firstScoreFifth.text,
                   "team_2": secondScoreFifth.text
                       ]
                       postSecondRef.setValue(postSecondObject,withCompletionBlock: {error, ref in
                           if error == nil{
                               self.dismiss(animated: true, completion: nil)
                 }
                           else {

             }
        })
        fifthMatchPredictionLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFirebase()
        scoresDelegate()
        firstMatchData()
        firstMatchPredictionLabel()
        secondMatchData()
        secondMatchPredictionLabel()
        thirdMatchData()
        thirdMatchPredictionLabel()
        fourthMatchData()
        fourthMatchPredictionLabel()
        fifthMatchData()
        fifthMatchPredictionLabel()
    }
    
    func configureFirebase(){
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    func firstMatchData(){
        ref = Database.database().reference().child("thirdWeek").child("firstMatch").child("match")
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>0 {
                self.matchesList.removeAll()
                for matches in snapshot.children.allObjects as![DataSnapshot]{
                    let matchObject = matches.value as? [String: AnyObject]
                    let firstTeamName = matchObject?["team1"]
                    let secondTeamName = matchObject?["team2"]
                    let firstImageUrl = matchObject?["firstImage"]
                    let firstResult = matchObject?["firstTeamScore"]
                    let secondResult = matchObject?["secondTeamScore"]
                    let matchData = matchObject?["matchDate"]
                    let matchId = matchObject?["id"]
                    let match = teamModel(id: matchId as! String?, firstTeam:firstTeamName as! String?, secondTeam: secondTeamName as! String?, firstImage: firstImageUrl as! String?, firstTeamResult: firstResult as! String?, dataMatch: matchData as! String?, secondTeamResult: secondResult as! String?)
                    self.firstTeam.text = firstTeamName as? String
                    self.secondTeam.text = secondTeamName as? String
                    self.FirstMatchHomeLabelResult.text = firstResult as? String
                    self.FirstMatchGuestLabelResult.text = secondResult as? String
                    self.matchesList.append(match)
                    
                    //time match local and update time (Timer.scheduledTimer)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //Input Format
                    dateFormatter.timeZone = TimeZone(identifier: "Europe/Kiev")
                    if let UTCDate = dateFormatter.date(from: matchData as! String){
                        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" // Output Format
                        dateFormatter.timeZone = TimeZone.current
                        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate)
                        self.firstMatchTimer.text = UTCToCurrentFormat
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){timer in
                            if Date().compare(UTCDate) == .orderedDescending {
                                self.firstMatchButton.isEnabled = false
                                self.firstScore.isEnabled = false
                                self.secondScore.isEnabled = false
                                self.firstScore.text! = ""
                                self.secondScore.text! = ""
                                           }
                                   }
                           }
                            else{
                                self.firstMatchTimer.text = matchData as? String
                                self.firstMatchButton.isEnabled = false
                                self.firstScore.isEnabled = false
                                self.secondScore.isEnabled = false
                                self.firstScore.text! = ""
                                self.secondScore.text! = ""
                        }
                // result match with current score
                self.firstMatchPredictionData(matchHomeResult:firstResult as! String,matchGuestResult:secondResult as! String)
                }
            }
        })
        
    }
    
    func firstMatchPredictionData(matchHomeResult:String,matchGuestResult:String){
        ref = Database.database().reference().child("thirdWeek").child("firstMatchPredictions").child(userID!)
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
                self.matchesListPredictions.removeAll()
                    let matchObject = snapshot.value! as? [String : AnyObject]
                    let firstPredictionScore = matchObject?["team_1"]
                    let secondPredictionScore = matchObject?["team_2"]
                    let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                    self.matchesListPredictions.append(prediction)
            
            let predictHomeResult = firstPredictionScore as? String ?? ""
            let predictGuestResult = secondPredictionScore as? String ?? ""
                           
                    if matchHomeResult == "" && matchGuestResult == ""{
                               self.FirstMatchlabelPoints.text = ""
                               self.currentScore += 0
                               self.highScore()
                           }
                else if matchHomeResult == predictHomeResult && matchGuestResult == predictGuestResult{
                               self.FirstMatchlabelPoints.text = "3 pts"
                               self.currentScore += 3
                               self.highScore()
                           }
                else if ((matchHomeResult > matchGuestResult) && (predictHomeResult > predictGuestResult)) || ((matchHomeResult < matchGuestResult) && (predictHomeResult < predictGuestResult)) || ((matchHomeResult == matchGuestResult) && ((predictHomeResult == predictGuestResult) && predictHomeResult != "" && predictGuestResult != "")) {
                        if matchHomeResult != "" && matchGuestResult != "" {
                               self.FirstMatchlabelPoints.text = "1 pts"
                               self.currentScore += 1
                               self.highScore()
                           }
                    }
                           else{
                               self.FirstMatchlabelPoints.text = "0 pts"
                               self.currentScore += 0
                               self.highScore()
                           }
            })
    }
    
    func firstMatchPredictionLabel(){
        ref = Database.database().reference().child("thirdWeek").child("firstMatchPredictions").child(userID!)
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
                self.matchesListPredictions.removeAll()
                    let matchObject = snapshot.value! as? [String : AnyObject]
                    let firstPredictionScore = matchObject?["team_1"]
                    let secondPredictionScore = matchObject?["team_2"]
                    let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                    self.firstScorePrediction.text = firstPredictionScore as? String
                    self.secondScorePrediction.text = secondPredictionScore as? String
                    self.matchesListPredictions.append(prediction)
            })
    }
    
    
    func secondMatchData(){
        ref = Database.database().reference().child("thirdWeek").child("secondMatch").child("match")
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>0 {
                self.matchesList.removeAll()
                for matches in snapshot.children.allObjects as![DataSnapshot]{
                    let matchObject = matches.value as? [String: AnyObject]
                    let firstTeamName = matchObject?["team1"]
                    let secondTeamName = matchObject?["team2"]
                    let firstImageUrl = matchObject?["firstImage"]
                    let firstResult = matchObject?["firstTeamScore"]
                    let secondResult = matchObject?["secondTeamScore"]
                    let matchData = matchObject?["matchDate"]
                    let matchId = matchObject?["id"]
                    let match = teamModel(id: matchId as! String?, firstTeam:firstTeamName as! String?, secondTeam: secondTeamName as! String?, firstImage: firstImageUrl as! String?, firstTeamResult: firstResult as! String?, dataMatch: matchData as! String?, secondTeamResult: secondResult as! String?)
                    self.firstTeamSecond.text = firstTeamName as? String
                    self.secondTeamSecond.text = secondTeamName as? String
                    self.FirstMatchHomeLabelResultSecond.text = firstResult as? String
                    self.FirstMatchGuestLabelResultSecond.text = secondResult as? String
                    self.matchesList.append(match)
            
                    //time match local and update time (Timer.scheduledTimer)
                      let dateFormatter = DateFormatter()
                      dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //Input Format
                      dateFormatter.timeZone = TimeZone(identifier: "Europe/Kiev")
                      if let UTCDate = dateFormatter.date(from: matchData as! String){
                           dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" // Output Format
                           dateFormatter.timeZone = TimeZone.current
                           let UTCToCurrentFormat = dateFormatter.string(from: UTCDate)
                           self.firstMatchTimerSecond.text = UTCToCurrentFormat
                           Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){timer in
                                if dateFormatter.string(from: Date()) >= UTCToCurrentFormat {
                                    self.firstMatchButtonSecond.isEnabled = false
                                    self.firstScoreSecond.isEnabled = false
                                    self.secondScoreSecond.isEnabled = false
                                    self.firstScoreSecond.text! = ""
                                    self.secondScoreSecond.text! = ""
                                    
                        }
                }
        }
                      else{
                            self.firstMatchTimerSecond.text = matchData as? String
                            self.firstMatchButtonSecond.isEnabled = false
                            self.firstScoreSecond.isEnabled = false
                            self.secondScoreSecond.isEnabled = false
                            self.firstScoreSecond.text! = ""
                            self.secondScoreSecond.text! = ""
                    }
           
                    // result match with current score
                    self.secondMatchPredictionData(matchHomeResult: firstResult as! String, matchGuestResult: secondResult as! String)
                }
            }
            
        })
                       

}
    func secondMatchPredictionData(matchHomeResult:String,matchGuestResult:String){
        ref = Database.database().reference().child("thirdWeek").child("secondMatchPredictions").child(userID!)
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
                self.matchesListPredictions.removeAll()
                    let matchObject = snapshot.value! as? [String : AnyObject]
                    let firstPredictionScore = matchObject?["team_1"]
                    let secondPredictionScore = matchObject?["team_2"]
                    let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                    self.matchesListPredictions.append(prediction)
            
            let predictHomeResultSecond = firstPredictionScore as? String ?? ""
            let predictGuestResultSecond = secondPredictionScore as? String ?? ""
        
         if matchHomeResult == "" && matchGuestResult == ""{
                    self.FirstMatchlabelPointsSecond.text = ""
                    self.currentScore += 0
                    self.highScore()
            }
        else if matchHomeResult == predictHomeResultSecond && matchGuestResult == predictGuestResultSecond{
                    self.FirstMatchlabelPointsSecond.text = "3 pts"
                    self.currentScore += 3
                    self.highScore()
            }
        else if ((matchHomeResult > matchGuestResult) && (predictHomeResultSecond > predictGuestResultSecond)) || ((matchHomeResult < matchGuestResult) && (predictHomeResultSecond < predictGuestResultSecond)) || ((matchHomeResult == matchGuestResult) && (predictHomeResultSecond == predictGuestResultSecond)) {
            if matchHomeResult != "" && matchGuestResult != "" {
                    self.FirstMatchlabelPointsSecond.text = "1 pts"
                    self.currentScore += 1
                    self.highScore()
            }
        }
        else{
                    self.FirstMatchlabelPointsSecond.text = "0 pts"
                    self.currentScore += 0
                    self.highScore()
            }
        })
    }
    
    func secondMatchPredictionLabel(){
           ref = Database.database().reference().child("thirdWeek").child("secondMatchPredictions").child(userID!)
           ref.observeSingleEvent(of: .value, with: {(snapshot) in
                   self.matchesListPredictions.removeAll()
                       let matchObject = snapshot.value! as? [String : AnyObject]
                       let firstPredictionScore = matchObject?["team_1"]
                       let secondPredictionScore = matchObject?["team_2"]
                       let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                       self.firstScorePredictionSecond.text = firstPredictionScore as? String
                       self.secondScorePredictionSecond.text = secondPredictionScore as? String
                       self.matchesListPredictions.append(prediction)
               })
       }
    
     func thirdMatchData(){
            ref = Database.database().reference().child("thirdWeek").child("thirdMatch").child("match")
            ref.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount>0 {
                    self.matchesList.removeAll()
                    for matches in snapshot.children.allObjects as![DataSnapshot]{
                        let matchObject = matches.value as? [String: AnyObject]
                        let firstTeamName = matchObject?["team1"]
                        let secondTeamName = matchObject?["team2"]
                        let firstImageUrl = matchObject?["firstImage"]
                        let firstResult = matchObject?["firstTeamScore"]
                        let secondResult = matchObject?["secondTeamScore"]
                        let matchData = matchObject?["matchDate"]
                        let matchId = matchObject?["id"]
                        let match = teamModel(id: matchId as! String?, firstTeam:firstTeamName as! String?, secondTeam: secondTeamName as! String?, firstImage: firstImageUrl as! String?, firstTeamResult: firstResult as! String?, dataMatch: matchData as! String?, secondTeamResult: secondResult as! String?)
                        self.firstTeamThird.text = firstTeamName as? String
                        self.secondTeamThird.text = secondTeamName as? String
                        self.FirstMatchHomeLabelResultThird.text = firstResult as? String
                        self.FirstMatchGuestLabelResultThird.text = secondResult as? String
                        self.matchesList.append(match)
                
                        //time match local and update time (Timer.scheduledTimer)
                          let dateFormatter = DateFormatter()
                          dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //Input Format
                          dateFormatter.timeZone = TimeZone(identifier: "Europe/Kiev")
                          if let UTCDate = dateFormatter.date(from: matchData as! String){
                               dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" // Output Format
                               dateFormatter.timeZone = TimeZone.current
                               let UTCToCurrentFormat = dateFormatter.string(from: UTCDate)
                               self.firstMatchTimerThird.text = UTCToCurrentFormat
                               Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){timer in
                                    if dateFormatter.string(from: Date()) >= UTCToCurrentFormat {
                                        self.firstMatchButtonThird.isEnabled = false
                                        self.firstScoreThird.isEnabled = false
                                        self.secondScoreThird.isEnabled = false
                                        self.firstScoreThird.text! = ""
                                        self.secondScoreThird.text! = ""
                                        
                            }
                    }
            }
                          else{
                                self.firstMatchTimerThird.text = matchData as? String
                                self.firstMatchButtonThird.isEnabled = false
                                self.firstScoreThird.isEnabled = false
                                self.secondScoreThird.isEnabled = false
                                self.firstScoreThird.text! = ""
                                self.secondScoreThird.text! = ""
                        }
               
                        // result match with current score
                        self.thirdMatchPredictionData(matchHomeResult: firstResult as! String, matchGuestResult: secondResult as! String)
                    }
                }
                
            })
                           

    }
        func thirdMatchPredictionData(matchHomeResult:String,matchGuestResult:String){
            ref = Database.database().reference().child("thirdWeek").child("thirdMatchPredictions").child(userID!)
            ref.observeSingleEvent(of: .value, with: {(snapshot) in
                    self.matchesListPredictions.removeAll()
                        let matchObject = snapshot.value! as? [String : AnyObject]
                        let firstPredictionScore = matchObject?["team_1"]
                        let secondPredictionScore = matchObject?["team_2"]
                        let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                        self.matchesListPredictions.append(prediction)
                
                let predictHomeResultSecond = firstPredictionScore as? String ?? ""
                let predictGuestResultSecond = secondPredictionScore as? String ?? ""
            
             if matchHomeResult == "" && matchGuestResult == ""{
                        self.FirstMatchlabelPointsThird.text = ""
                        self.currentScore += 0
                        self.highScore()
                }
            else if matchHomeResult == predictHomeResultSecond && matchGuestResult == predictGuestResultSecond{
                        self.FirstMatchlabelPointsThird.text = "3 pts"
                        self.currentScore += 3
                        self.highScore()
                }
            else if ((matchHomeResult > matchGuestResult) && (predictHomeResultSecond > predictGuestResultSecond)) || ((matchHomeResult < matchGuestResult) && (predictHomeResultSecond < predictGuestResultSecond)) || ((matchHomeResult == matchGuestResult) && (predictHomeResultSecond == predictGuestResultSecond)) {
                if matchHomeResult != "" && matchGuestResult != "" {
                        self.FirstMatchlabelPointsThird.text = "1 pts"
                        self.currentScore += 1
                        self.highScore()
                }
            }
            else{
                        self.FirstMatchlabelPointsThird.text = "0 pts"
                        self.currentScore += 0
                        self.highScore()
                }
            })
        }
        
        func thirdMatchPredictionLabel(){
               ref = Database.database().reference().child("thirdWeek").child("thirdMatchPredictions").child(userID!)
               ref.observeSingleEvent(of: .value, with: {(snapshot) in
                       self.matchesListPredictions.removeAll()
                           let matchObject = snapshot.value! as? [String : AnyObject]
                           let firstPredictionScore = matchObject?["team_1"]
                           let secondPredictionScore = matchObject?["team_2"]
                           let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                           self.firstScorePredictionThird.text = firstPredictionScore as? String
                           self.secondScorePredictionThird.text = secondPredictionScore as? String
                           self.matchesListPredictions.append(prediction)
                   })
           }
    
    func fourthMatchData(){
            ref = Database.database().reference().child("thirdWeek").child("fourthMatch").child("match")
            ref.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount>0 {
                    self.matchesList.removeAll()
                    for matches in snapshot.children.allObjects as![DataSnapshot]{
                        let matchObject = matches.value as? [String: AnyObject]
                        let firstTeamName = matchObject?["team1"]
                        let secondTeamName = matchObject?["team2"]
                        let firstImageUrl = matchObject?["firstImage"]
                        let firstResult = matchObject?["firstTeamScore"]
                        let secondResult = matchObject?["secondTeamScore"]
                        let matchData = matchObject?["matchDate"]
                        let matchId = matchObject?["id"]
                        let match = teamModel(id: matchId as! String?, firstTeam:firstTeamName as! String?, secondTeam: secondTeamName as! String?, firstImage: firstImageUrl as! String?, firstTeamResult: firstResult as! String?, dataMatch: matchData as! String?, secondTeamResult: secondResult as! String?)
                        self.firstTeamFourth.text = firstTeamName as? String
                        self.secondTeamFourth.text = secondTeamName as? String
                        self.FirstMatchHomeLabelResultFourth.text = firstResult as? String
                        self.FirstMatchGuestLabelResultFourth.text = secondResult as? String
                        self.matchesList.append(match)
                
                        //time match local and update time (Timer.scheduledTimer)
                          let dateFormatter = DateFormatter()
                          dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //Input Format
                          dateFormatter.timeZone = TimeZone(identifier: "Europe/Kiev")
                          if let UTCDate = dateFormatter.date(from: matchData as! String){
                               dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" // Output Format
                               dateFormatter.timeZone = TimeZone.current
                               let UTCToCurrentFormat = dateFormatter.string(from: UTCDate)
                               self.firstMatchTimerFourth.text = UTCToCurrentFormat
                               Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){timer in
                                    if dateFormatter.string(from: Date()) >= UTCToCurrentFormat {
                                        self.firstMatchButtonFourth.isEnabled = false
                                        self.firstScoreFourth.isEnabled = false
                                        self.secondScoreFourth.isEnabled = false
                                        self.firstScoreFourth.text! = ""
                                        self.secondScoreFourth.text! = ""
                                        
                            }
                    }
            }
                          else{
                                self.firstMatchTimerFourth.text = matchData as? String
                                self.firstMatchButtonFourth.isEnabled = false
                                self.firstScoreFourth.isEnabled = false
                                self.secondScoreFourth.isEnabled = false
                                self.firstScoreFourth.text! = ""
                                self.secondScoreFourth.text! = ""
                        }
               
                        // result match with current score
                        self.fourthMatchPredictionData(matchHomeResult: firstResult as! String, matchGuestResult: secondResult as! String)
                    }
                }
                
            })
                           

    }
        func fourthMatchPredictionData(matchHomeResult:String,matchGuestResult:String){
            ref = Database.database().reference().child("thirdWeek").child("fourthMatchPredictions").child(userID!)
            ref.observeSingleEvent(of: .value, with: {(snapshot) in
                    self.matchesListPredictions.removeAll()
                        let matchObject = snapshot.value! as? [String : AnyObject]
                        let firstPredictionScore = matchObject?["team_1"]
                        let secondPredictionScore = matchObject?["team_2"]
                        let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                        self.matchesListPredictions.append(prediction)
                
                let predictHomeResultSecond = firstPredictionScore as? String ?? ""
                let predictGuestResultSecond = secondPredictionScore as? String ?? ""
            
             if matchHomeResult == "" && matchGuestResult == ""{
                        self.FirstMatchlabelPointsFourth.text = ""
                        self.currentScore += 0
                        self.highScore()
                }
            else if matchHomeResult == predictHomeResultSecond && matchGuestResult == predictGuestResultSecond{
                        self.FirstMatchlabelPointsFourth.text = "3 pts"
                        self.currentScore += 3
                        self.highScore()
                }
            else if ((matchHomeResult > matchGuestResult) && (predictHomeResultSecond > predictGuestResultSecond)) || ((matchHomeResult < matchGuestResult) && (predictHomeResultSecond < predictGuestResultSecond)) || ((matchHomeResult == matchGuestResult) && (predictHomeResultSecond == predictGuestResultSecond)) {
                if matchHomeResult != "" && matchGuestResult != "" {
                        self.FirstMatchlabelPointsFourth.text = "1 pts"
                        self.currentScore += 1
                        self.highScore()
                }
            }
            else{
                        self.FirstMatchlabelPointsFourth.text = "0 pts"
                        self.currentScore += 0
                        self.highScore()
                }
            })
        }
        
        func fourthMatchPredictionLabel(){
               ref = Database.database().reference().child("thirdWeek").child("fourthMatchPredictions").child(userID!)
               ref.observeSingleEvent(of: .value, with: {(snapshot) in
                       self.matchesListPredictions.removeAll()
                           let matchObject = snapshot.value! as? [String : AnyObject]
                           let firstPredictionScore = matchObject?["team_1"]
                           let secondPredictionScore = matchObject?["team_2"]
                           let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                           self.firstScorePredictionFourth.text = firstPredictionScore as? String
                           self.secondScorePredictionFourth.text = secondPredictionScore as? String
                           self.matchesListPredictions.append(prediction)
                   })
           }
    
    func fifthMatchData(){
            ref = Database.database().reference().child("thirdWeek").child("fifthMatch").child("match")
            ref.observe(DataEventType.value, with: {(snapshot) in
                if snapshot.childrenCount>0 {
                    self.matchesList.removeAll()
                    for matches in snapshot.children.allObjects as![DataSnapshot]{
                        let matchObject = matches.value as? [String: AnyObject]
                        let firstTeamName = matchObject?["team1"]
                        let secondTeamName = matchObject?["team2"]
                        let firstImageUrl = matchObject?["firstImage"]
                        let firstResult = matchObject?["firstTeamScore"]
                        let secondResult = matchObject?["secondTeamScore"]
                        let matchData = matchObject?["matchDate"]
                        let matchId = matchObject?["id"]
                        let match = teamModel(id: matchId as! String?, firstTeam:firstTeamName as! String?, secondTeam: secondTeamName as! String?, firstImage: firstImageUrl as! String?, firstTeamResult: firstResult as! String?, dataMatch: matchData as! String?, secondTeamResult: secondResult as! String?)
                        self.firstTeamFifth.text = firstTeamName as? String
                        self.secondTeamFifth.text = secondTeamName as? String
                        self.FirstMatchHomeLabelResultFifth.text = firstResult as? String
                        self.FirstMatchGuestLabelResultFifth.text = secondResult as? String
                        self.matchesList.append(match)
                
                        //time match local and update time (Timer.scheduledTimer)
                          let dateFormatter = DateFormatter()
                          dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //Input Format
                          dateFormatter.timeZone = TimeZone(identifier: "Europe/Kiev")
                          if let UTCDate = dateFormatter.date(from: matchData as! String){
                               dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" // Output Format
                               dateFormatter.timeZone = TimeZone.current
                               let UTCToCurrentFormat = dateFormatter.string(from: UTCDate)
                               self.firstMatchTimerFifth.text = UTCToCurrentFormat
                               Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){timer in
                                    if dateFormatter.string(from: Date()) >= UTCToCurrentFormat {
                                        self.firstMatchButtonFifth.isEnabled = false
                                        self.firstScoreFifth.isEnabled = false
                                        self.secondScoreFifth.isEnabled = false
                                        self.firstScoreFifth.text! = ""
                                        self.secondScoreFifth.text! = ""
                                        
                            }
                    }
            }
                          else{
                                self.firstMatchTimerFifth.text = matchData as? String
                                self.firstMatchButtonFifth.isEnabled = false
                                self.firstScoreFifth.isEnabled = false
                                self.secondScoreFifth.isEnabled = false
                                self.firstScoreFifth.text! = ""
                                self.secondScoreFifth.text! = ""
                        }
               
                        // result match with current score
                        self.fifthMatchPredictionData(matchHomeResult: firstResult as! String, matchGuestResult: secondResult as! String)
                    }
                }
                
            })
                           

    }
        func fifthMatchPredictionData(matchHomeResult:String,matchGuestResult:String){
            ref = Database.database().reference().child("thirdWeek").child("fifthMatchPredictions").child(userID!)
            ref.observeSingleEvent(of: .value, with: {(snapshot) in
                    self.matchesListPredictions.removeAll()
                        let matchObject = snapshot.value! as? [String : AnyObject]
                        let firstPredictionScore = matchObject?["team_1"]
                        let secondPredictionScore = matchObject?["team_2"]
                        let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                        self.matchesListPredictions.append(prediction)
                
                let predictHomeResultSecond = firstPredictionScore as? String ?? ""
                let predictGuestResultSecond = secondPredictionScore as? String ?? ""
            
             if matchHomeResult == "" && matchGuestResult == ""{
                        self.FirstMatchlabelPointsFifth.text = ""
                        self.currentScore += 0
                        self.highScore()
                }
            else if matchHomeResult == predictHomeResultSecond && matchGuestResult == predictGuestResultSecond{
                        self.FirstMatchlabelPointsFifth.text = "3 pts"
                        self.currentScore += 3
                        self.highScore()
                }
            else if ((matchHomeResult > matchGuestResult) && (predictHomeResultSecond > predictGuestResultSecond)) || ((matchHomeResult < matchGuestResult) && (predictHomeResultSecond < predictGuestResultSecond)) || ((matchHomeResult == matchGuestResult) && (predictHomeResultSecond == predictGuestResultSecond)) {
                if matchHomeResult != "" && matchGuestResult != "" {
                        self.FirstMatchlabelPointsFifth.text = "1 pts"
                        self.currentScore += 1
                        self.highScore()
                }
            }
            else{
                        self.FirstMatchlabelPointsFifth.text = "0 pts"
                        self.currentScore += 0
                        self.highScore()
                }
            })
        }
        
        func fifthMatchPredictionLabel(){
               ref = Database.database().reference().child("thirdWeek").child("fifthMatchPredictions").child(userID!)
               ref.observeSingleEvent(of: .value, with: {(snapshot) in
                       self.matchesListPredictions.removeAll()
                           let matchObject = snapshot.value! as? [String : AnyObject]
                           let firstPredictionScore = matchObject?["team_1"]
                           let secondPredictionScore = matchObject?["team_2"]
                           let prediction = predictionsModel(firstTeamScore: firstPredictionScore as! String?, secondTeamScore: secondPredictionScore as! String?)
                           self.firstScorePredictionFifth.text = firstPredictionScore as? String
                           self.secondScorePredictionFifth.text = secondPredictionScore as? String
                           self.matchesListPredictions.append(prediction)
                   })
           }
        
    
    func scoresDelegate(){
        firstScore.delegate = self
        secondScore.delegate = self
        firstScoreSecond.delegate = self
        secondScoreSecond.delegate = self
        firstScoreThird.delegate = self
        secondScoreThird.delegate = self
        firstScoreFourth.delegate = self
        secondScoreFourth.delegate = self
        firstScoreFifth.delegate = self
        secondScoreFifth.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "0123456789"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    func highScore(){
        let postFirstRef = Database.database().reference().child("UserScore").child(userID!).child("Highscore_3")
                let postFirstObject = [
                    "Score": currentScore
                    ] as [String : Int]
                        postFirstRef.setValue(postFirstObject,withCompletionBlock: {error, ref in
                            if error == nil{
                                self.dismiss(animated: true, completion: nil)
                         }
                            else{
        
                    }
            })
     }
    
}

