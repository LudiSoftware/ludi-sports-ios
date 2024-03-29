//
//  DashboardViewController.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//
//create tableview needs to hold a list of 2 sport objects

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var welcomeUser: UILabel!
    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var sportTableView: SportTableView!
    @IBOutlet weak var teamTableView: TeamTableView!
    @IBOutlet weak var btnToLogin: UIBarButtonItem!
    
    var realmInstance = realm()
    var teams: [Team] = []
    var coach: Coach? = nil
   

    override func viewDidLoad() {
        super.viewDidLoad()
        print("yay!!")
        
        //welcomeImage.image = "Here lies an image."
        navigationItem.hidesBackButton = true
        
//        var testObjs = realmInstance.findAllSports()
//        var test2 = testObjs?.toList()
        
        if let name = realmInstance.realmUser()?.name{
            welcomeUser.text = "Welcome, \(name)"
        } else {
            welcomeUser.text = "Welcome, Loser."
        }
        
        
        teamTableView.rowHeight = UITableView.automaticDimension
        teamTableView.estimatedRowHeight = 600

        coach = realmInstance.findCoachBySafeId()
        
        teamTableView.reloadData()
        sportTableView.reloadData()
        // Do any additional setup after loading the view.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToTeamOverAll" {
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
    
}
