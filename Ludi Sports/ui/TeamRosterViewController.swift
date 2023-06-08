//
//  TeamRosterViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.
//

import Foundation
import UIKit

class TeamRosterViewController: UIViewController {
    // Create an instance of UICollectionView
   
    @IBOutlet weak var playerCView: UICollectionView!
    var team: Team?
    
    // Your data source for the collection view
    // rosterData needs to be PlayerRefIDs

        var playerList: [PlayerRef] = []
        var realmInstance = realm()
        var rosterId: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set up collection view
            playerCView.dataSource = self
            playerCView.delegate = self
            playerCView.register(UINib(nibName: "PlayerCCell", bundle: nil), forCellWithReuseIdentifier: "playerCCell")
            
            if let rosterID = team?.rosterId {
                // Get roster from Firebase and store it in Realm
                fireGetRosterAsync(rosterID: rosterID, realm: realmInstance)
                
                if let playerList = realmInstance.findPlayersInRosterById(rosterId: rosterID) {
                    self.playerList = Array(playerList) // Convert List<PlayerRef> to [PlayerRef]
                    playerCView.reloadData()
                }
            }
        }
    }

extension TeamRosterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCCell", for: indexPath) as! PlayerCCell
        
        // Configure the cell with player data
        let player = playerList[indexPath.item]
        cell.configure(with: player)
        
        return cell
    }
}

extension TeamRosterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the desired size of each cell
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle selection of an item in the collection view
        let selectedPlayer = playerList[indexPath.item]
        // ...
    }
}
