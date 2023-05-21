//
//  TeamOverAllViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/18/23.
//

import UIKit

class TeamOverAllViewController: UIViewController {
    
    
    @IBOutlet weak var coachNameLabel: UILabel!
    @IBOutlet weak var ageGroupLabel: UILabel!
    @IBOutlet weak var playerCView: UICollectionView!

    @IBOutlet weak var containerView: UIView!
    var team: Team? = nil
    var realmInstance = realm()
    var roster: [PlayerRef] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        guard let tabBarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else {
            fatalError("Failed to instantiate TabBarViewController from storyboard.")
        }

        addChild(tabBarViewController)
        tabBarViewController.view.frame = containerView.bounds
        containerView.addSubview(tabBarViewController.view)
        tabBarViewController.didMove(toParent: self)

        coachNameLabel.text = team?.headCoachName
        ageGroupLabel.text = team?.ageGroup

        // Rest of your code...
    }

   
        // Set up collection view
//        playerCView.dataSource = self
//        playerCView.delegate = self
//        playerCView.register(UINib(nibName: "PlayerCCell", bundle: nil), forCellWithReuseIdentifier: "playerCCell")
//
//        let rosterID = team?.rosterId
//
//        if let rosterID = rosterID {
//            // Get roster from Firebase and store it in Realm
//            fireGetRosterAsync(rosterID: rosterID, realm: realmInstance)
//            let playerList = realmInstance.findPlayersInRosterById(rosterId: rosterID)
//            roster = Array(playerList!) // Convert List<PlayerRef> to [PlayerRef]
//            playerCView.reloadData()
//        }
    }

    // MARK: - UICollectionViewDataSource

    

