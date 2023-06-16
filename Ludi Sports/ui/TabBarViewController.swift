//
//  MainPageViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.

import UIKit
//
class TabBarViewController: UITabBarController {
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Instantiate the view controllers from the storyboard
        guard let teamRosterViewController = storyboard?.instantiateViewController(withIdentifier: "TeamRosterViewController") as? TeamRosterViewController,
              let teamNotesViewController = storyboard?.instantiateViewController(withIdentifier: "TeamNotesViewController") as? TeamNotesViewController,
              let chatForCoachesViewController = storyboard?.instantiateViewController(withIdentifier: "ChatForCoachesViewController") as? ChatForCoachesViewController else {
            fatalError("Failed to instantiate view controllers from storyboard.")
        }
        
        teamRosterViewController.team = team
            teamNotesViewController.team = team
            chatForCoachesViewController.team = team

        // Customize the view controllers and tab bar items as needed
        teamRosterViewController.title = "Roster"
        // teamRosterViewController.tabBarItem.image = UIImage(named: "roster_icon")
        
        teamNotesViewController.title = "Notes"
        // teamNotesViewController.tabBarItem.image = UIImage(named: "notes_icon")
        
        chatForCoachesViewController.title = "Chat"
        // chatForCoachesViewController.tabBarItem.image = UIImage(named: "chat_icon")
        
        // Set the view controllers for the tab bar controller
        self.viewControllers = [teamRosterViewController, teamNotesViewController, chatForCoachesViewController]
        
        // Set the initial view controller for each embedded container view
        self.selectedIndex = 0
        
        //test Print to make sure team carries over
       // print(team)
    }
}
