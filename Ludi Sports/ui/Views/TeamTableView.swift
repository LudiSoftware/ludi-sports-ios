//
//  TeamTableView.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/10/23.
//

//import firebase




import Foundation
import UIKit


class TeamTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var teams: [Team] = []
    var dashboardViewController: DashboardViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var team: Team = Team()
        team.name = "StupidFootballers"
        var team2: Team = Team()
        team2.name = "AFC Richmond"
        
        self.teams.append(team)
        self.teams.append(team2)

        
        dataSource = self
        delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamTableViewCell", for: indexPath) as! TeamTableViewCell
        let team = teams[indexPath.row]
        cell.configure(with: team)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
}
