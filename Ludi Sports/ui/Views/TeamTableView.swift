//
//  TeamTableView.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/10/23.
//

//import firebase




import Foundation
import UIKit
import Realm
import FirebaseDatabase
import FirebaseCore
import RealmSwift


class TeamTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var coach = Coach()
    var newRealmInstance = realm()
    var teams: [String] = []
    var dashboardViewController: DashboardViewController? = nil
    var coachTeams: [Team] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //TODO get an id for Coach to test if it is pulling properly
        
        
        
        
        var team2 = "AFC Richmond"
        var coach = self.newRealmInstance.findCoachBySafeId()
        
        if let coachObj = coach {
            print("fucker")
            var tempTeamIds: [String] = []
            for id in coachObj.teams {
                teams.append(id)
            }
            
            
            
        } else {
            var teams = team2
            self.teams.append(team2)
        }
        
        
        
        
        dataSource = self
        delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamTableViewCell", for: indexPath) as! TeamTableViewCell
        let team: String = teams[indexPath.row]
        cell.configure(with: team)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
}
