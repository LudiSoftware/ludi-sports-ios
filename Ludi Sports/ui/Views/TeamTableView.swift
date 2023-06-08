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
        
        
        coach = realmInstance.findCoachBySafeId()
        
        if let coachObj = self.coach {
            let teamsOfCoach = coachObj.teams
            for team in teamsOfCoach {
                fireGetTeamsAsync(teamId: team, realm: self.realmInstance)
                self.teamIdList.append(team)
                
            }
            //live data
            let teamLiveData = TeamLiveData(realmIds: teamIdList, realmInstance: realmInstance, fun: completion)
            teamLiveData.enable()
            
        }
        
        
        
        dataSource = self
        delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
        
    }
    
    func completion()  {
        //making variable teamsList to be Results<Team>
        let teamsList = realmInstance.objects(Team.self)
        //Turning Results<Team> into a [Team]
        teams = Array(teamsList)
        
        
        DispatchQueue.main.async {
            self.reloadData()
        }
        
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
        // Get the selected team object
        let selectedTeam = teams[indexPath.row]
        print(selectedTeam)
        //potentially good time to stop observing
        
        let teamLiveData = TeamLiveData(realmIds: teamIdList, realmInstance: realmInstance, fun: completion)
        teamLiveData.disable()
        print("You have no observers here.")
        
        // Perform the segue with identifier
        if let dashboardViewController = findParentViewController() as? DashboardViewController {
                // Perform the segue with identifier
                dashboardViewController.performSegue(withIdentifier: "goToTeamOverAll", sender: selectedTeam)
            }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0 // Adjust the value according to the desired spacing
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "YourSegueIdentifier" {
            // Check if the destination view controller is of the appropriate type
            if let destinationVC = segue.destination as? TeamOverAllViewController {
                // Retrieve the selected team object from the sender
                if let selectedTeam = sender as? Team {
                    // Pass the selected team object to the destination view controller
                    destinationVC.team = selectedTeam
                }
            }
        }
    }
    func findParentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while let responder = parentResponder {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            parentResponder = responder.next
        }
        return nil
    }
    
}


