//
//  tabBarControllerMain.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.
//

import Foundation
import UIKit

class TabBarControllerMain : UITabBarController{

    override func viewDidLoad() {
        print("Things have escalated quickly.")

        self.delegate

                // Configure your tab bar controller
                setupTabBar()
    }

    func setupTabBar() {
           // Create your view controllers for the tabs
           let TeamRosterViewController = UIViewController()
           let ChatViewController = UIViewController()
          

           // Set the view controllers for the tab bar controller
           viewControllers = [TeamRosterViewController, ChatViewController]

           // Optionally, customize the appearance of the tab bar
           tabBar.tintColor = .purple
           tabBar.barTintColor = .white
       }

       // UITabBarControllerDelegate method
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           // Perform custom actions or updates when a tab is selected
           if let selectedViewController = viewController as? TeamRosterViewController {
               //selectedViewController.performse
           }
       }

   }

