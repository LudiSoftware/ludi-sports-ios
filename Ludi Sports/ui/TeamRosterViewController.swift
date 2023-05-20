//
//  TeamRosterViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.
//

import Foundation
import UIKit

class TeamRosterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // Create an instance of UICollectionView
    var rosterCollectionView: UICollectionView!
    
    // Your data source for the collection view
    // rosterData needs to be PlayerRefIDs
    var playerList: [PlayerRef] = []
    var realmInstance = realm()
    var rosterId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let rosterId = rosterId {
           // playerList = realmInstance.findRosterById(rosterId: rosterId)
        }
       
        // Configure collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        
        // Initialize collection view with layout
        rosterCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        // Set data source and delegate to the view controller
        rosterCollectionView.dataSource = self
        rosterCollectionView.delegate = self
        
        // Register cell class for reuse
        rosterCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: "PlayerCell")
        
        // Add collection view to the view hierarchy
        view.addSubview(rosterCollectionView)
        
        // Reload collection view data
        rosterCollectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCCell", for: indexPath) as! PlayerCCell
        
        // Configure the cell with player data
        let player = playerList[indexPath.item]
        cell.configure(with: player)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle selection of an item in the collection view
        let selectedPlayer = playerList[indexPath.item]
        // ...
    }
}

// Example player struct for demonstration purposes

// Example collection view cell class for player display
class PlayerCollectionViewCell: UICollectionViewCell {
    
}
