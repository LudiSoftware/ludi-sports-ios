//
//  TeamOverAllViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/18/23.
//

import UIKit

class TeamOverAllViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var coachNameLabel: UILabel!
    @IBOutlet weak var ageGroupLabel: UILabel!
    @IBOutlet weak var playerCView: UICollectionView!

    var team: Team? = nil
    var realmInstance = realm()
    var roster: [PlayerRef] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        coachNameLabel.text = team?.headCoachName
        ageGroupLabel.text = team?.ageGroup

        // Set up collection view
        playerCView.dataSource = self
        playerCView.delegate = self
        playerCView.register(UINib(nibName: "PlayerCCell", bundle: nil), forCellWithReuseIdentifier: "playerCCell")
        
        let rosterID = team?.rosterId

        if let rosterID = rosterID {
            // Get roster from Firebase and store it in Realm
            fireGetRosterAsync(rosterID: rosterID, realm: realmInstance)
            let playerList = realmInstance.findPlayersInRosterById(rosterId: rosterID)
            roster = Array(playerList!) // Convert List<PlayerRef> to [PlayerRef]
            playerCView.reloadData()
        }
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roster.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCCell", for: indexPath) as! PlayerCCell
        let player = roster[indexPath.item]
        cell.configure(with: player)
        return cell
    }

    // MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle selection of a player cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the desired size for each cell
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
