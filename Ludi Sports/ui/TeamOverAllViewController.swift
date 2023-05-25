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

    @IBAction func formationButton(_ sender: Any) {
        performSegue(withIdentifier: "formationSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        guard let tabBarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else {
            fatalError("Failed to instantiate TabBarViewController from storyboard.")
        }

        tabBarViewController.team = team
        
        addChild(tabBarViewController)
        tabBarViewController.view.frame = containerView.bounds
        containerView.addSubview(tabBarViewController.view)
        tabBarViewController.didMove(toParent: self)

        coachNameLabel.text = team?.headCoachName
        ageGroupLabel.text = team?.ageGroup

        // Rest of your code...
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "formationSegue" {
            if let destinationVC = segue.destination as? FormationViewController {
                // Pass any necessary data to the FormationViewController
            }
        }
    }

    }

    

    

