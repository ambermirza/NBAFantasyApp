//
//  ViewController.swift
//  NBAFantasyApp
//
//  Created by Amber Mirza on 9/29/17.
//  Copyright © 2017 Amber Mirza. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var fetchedPlayers = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseJSON()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func parseJSON() {
        fetchedPlayers = []
        let url = "https://stats.nba.com/stats/commonallplayers/?LeagueID=00&Season=2017-18&IsOnlyCurrentSeason=1"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, respnse, error) in
            if (error != nil) {
                print("Error")
                
            } else {
                do {
                    //let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print(fetchedData)
                    //let players = fetchedData["resultSets"] as? [[String:Any]] ?? []

                    /*for eachFetchedPlayer in self.fetchedPlayers {
                        let eachPlayer = eachFetchedPlayer as! [String: Any]
                        let name = eachPlayer["DISPLAY_LAST_COMMA_FIRST"] as! String
                        let team = eachPlayer["TEAM_NAME"] as! String
                        let id = eachPlayer["PERSON_ID"] as! String

                        self.fetchedPlayers.append(Player(name: name, team: team, id: id))
                    }
                    
                    print(self.fetchedPlayers)*/
                    
                } catch {
                    print("Another error")
                }
            }
        }
        task.resume()
    }
    
}

class Player {
    var name: String
    var team: String
    var id: String
    
    init(name: String, team: String, id: String) {
        self.name = name
        self.team = team
        self.id = id
    }
}
