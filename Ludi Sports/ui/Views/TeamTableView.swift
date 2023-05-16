//
//  TeamTableView.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/10/23.
//



//TODO get an id for Coach to test if it is pulling properly
//TODO display Teams objects in a tableview List that allows to show name/picture/coachname
// questions regarding pulling the object and timing between firebase and realm
//questions regarding pulling the data check functions? no fails but its not working right
//created functions getfireteams,getcoachteamsbyID etc


import Foundation
import UIKit
import FirebaseDatabase
import RealmSwift


class TeamTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    let realmInstance = realm()
    var teamIdList: [String] = []
    var coach: Coach? = nil
    var teams: [Team] = []
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //var team2 = "AFC Richmond"
        //teamsList.append(team2)
        
        coach = realmInstance.findCoachBySafeId()
        
        if let coachObj = coach {
            let teamsOfCoach = coachObj.teams
            for team in teamsOfCoach {
                fireGetTeamsAsync(teamId: team, realm: realmInstance)
                teamIdList.append(team)
               
            }
            for id in teamIdList {
                if let team = realmInstance.findTeamById(teamId: id) {
                    teams.append(team)
                    print(team)
                }
            }
        }
        
        
        
        dataSource = self
        delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamTableViewCell", for: indexPath) as! TeamTableViewCell
        let teams: Team = teams[indexPath.row]
        cell.configure(with: teams)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
}
