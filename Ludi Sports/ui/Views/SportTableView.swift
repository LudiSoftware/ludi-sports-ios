//
//  SportTableView.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/10/23.
//

import Foundation
import UIKit


class SportTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var sports: [Sport] = []
    var dashboardViewController: DashboardViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var sport: Sport = Sport()
        sport.name = "Soccer"
        var sport2: Sport = Sport()
        sport2.name = "Football"
        
        self.sports.append(sport)
        self.sports.append(sport2)

        
        dataSource = self
        delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportTableViewCell", for: indexPath) as! SportTableViewCell
        let sport = sports[indexPath.row]
        cell.configure(with: sport)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
}
