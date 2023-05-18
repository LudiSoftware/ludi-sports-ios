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
//
//        if let coachObj = coach {
//            let teamsOfCoach = coachObj.teams
//            for team in teamsOfCoach {
//                fireGetTeamsAsync(teamId: team, realm: realmInstance)
//                teamIdList.append(team)
//
//            }
//            for id in teamIdList {
//                if let team = realmInstance.findTeamById(teamId: id) {
//                    teams.append(team)
//                    print(team)
//                }
                
        if let coachObj = self.coach {
            let teamsOfCoach = coachObj.teams
            for team in teamsOfCoach {
                fireGetTeamsAsync(teamId: team, realm: self.realmInstance)
                self.teamIdList.append(team)
                
            }
            for id in self.teamIdList {
                if let team = self.realmInstance.findTeamById(teamId: id) {
                    self.teams.append(team)
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
        let reuseIdentifier = "teamCell"
        
        // Register the custom nib file
        tableView.register(UINib(nibName: "TeamCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
        // Dequeue the cell using the registered identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TeamCell
        
        // Configure the cell with the corresponding team object
        let team = teams[indexPath.row]
        cell.configure(with: team)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0 // Adjust the value according to the desired spacing
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = .clear
            return headerView
        }
    }

