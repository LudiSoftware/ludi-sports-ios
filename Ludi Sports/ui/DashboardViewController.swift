//
//  DashboardViewController.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//
//create tableview needs to hold a list of 2 sport objects

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var sportTableView: SportTableView!
    @IBOutlet weak var teamTableView: TeamTableView!
    
    var realmInstance = realm()
     var teams: [Team] = []
    var coach: Coach? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        print("yay!!")
//        teamTableView.register(teamCell.self, forCellReuseIdentifier: "teamCell")
         coach = realmInstance.findCoachBySafeId()

        
        
        teamTableView.reloadData()
        sportTableView.reloadData()
        // Do any additional setup after loading the view.
        
       
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
