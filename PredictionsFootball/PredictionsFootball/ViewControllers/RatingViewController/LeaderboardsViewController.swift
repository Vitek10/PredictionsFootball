import UIKit
import Firebase
import FirebaseDatabase

class LeaderboardsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblLeaderboard: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var score: UILabel!
    
    
    var leaderboardList = [leaderboardModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(leaderboardList.count,5)
        
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! ViewControllerTableViewCell
        let leaderboard: leaderboardModel
        leaderboard = leaderboardList[indexPath.row]
        cell.labelUsername.text = leaderboard.username
        cell.labelScore.text = String(leaderboard.points)
        cell.labelPosition.text = String(indexPath.row + 1)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFirebase()
        readData()
        yourRating()
    }
    
    func configureFirebase(){
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    func readData(){
        let ref = Database.database().reference().child("UsersHighscore")
        ref.observe(.value, with: { (snapshot) in
                self.leaderboardList.removeAll()
                for leaderboards in snapshot.children.allObjects as![DataSnapshot]{
                    let leaderObject = leaderboards.value as! Dictionary<String, Any>
                    let username = leaderObject["username"] as? String ?? ""
                    let score = leaderObject["Score"] as? String
                    let leaderboard = leaderboardModel(username: username, points: Int(score!)!)
                    self.leaderboardList.sort(by: {$0.points > $1.points})
                    self.leaderboardList.append(leaderboard)
                    self.tblLeaderboard.reloadData()
              }
               
        })
    }
    func yourRating(){
          let userID = Auth.auth().currentUser?.uid
          let ref = Database.database().reference().child("UsersHighscore").child(userID!)
          ref.observeSingleEvent(of: .value) { (snapshot) in
                        let data = snapshot.value as? [String: Any]
                        let score = data?["Score"] as? Int ?? 0
                        let username = data?["username"] as? String ?? ""
                        self.score.text! = String(score)
                        self.userName.text! = username
            }
    }
    
    

}
