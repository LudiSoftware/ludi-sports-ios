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
    
    
    var newRealmInstance = realm()
//    var sportsObj: Results<Sport>
    var sports: [Sport] = []
    var dashboardViewController: DashboardViewController? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       getSports()
        
        
        
//        var sports = self.newRealmInstance.object(ofType: Sport.self, forPrimaryKey: (Any).self)
//        }
        var tempSports = self.newRealmInstance.findAllSports()
       // var tempSportsUnwrapped = tempSports
       // self.sports.append(tempSportsUnwrapped!)
//        let sportsNames: [Sport]? = tempSports?.toArray(Sport.self)

        // Unwrap the optional [Sport]? using optional binding
//        if let unwrappedSportsNames = sportsNames {
//            // The optional [Sport] is not nil, proceed with appending its elements to `self.sports`
//
//            for sport in unwrappedSportsNames {
//                // Iterate through each sport in the unwrapped [Sport]
//                self.sports.append(sport)
//            }
//
            // At this point, `self.sports` will contain all the appended sports
            // You can use `self.sports` to populate your tableView
//        }
        
        
        
        
        
        
//        self.team.append(self.newRealmInstance.findTeamById(teamId: <#T##String?#>))
        
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
    
    func getSports() {
        var realm: Realm!
             var objectsArray: Results<Sport> {
                get {
                    return realm.objects(Sport.self)
                }
            }
    }
}
