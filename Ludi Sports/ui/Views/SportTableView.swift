//
//  SportTableView.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/10/23.
//

import Foundation
import UIKit
import RealmSwift
import FirebaseDatabase
import Realm



class SportTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    
    let realmInstance = realm()
    var sportsList: [Sport] = []
    var dashboardViewController: DashboardViewController? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let sports = realmInstance.findAllSports()
        let sport = sports?.toList()
        
        sportsList += sport!
    
        dataSource = self
        delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportTableViewCell", for: indexPath) as! SportTableViewCell
        let sport = sportsList[indexPath.row]
        cell.configure(with: sport)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
}
