//
//  AuthController.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import UIKit
import Firebase
import RealmSwift

class AuthControllerViewController: UIViewController {
    
    static var hasInitialized = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        verifyUserLogin()
    }
    
//    private func verifyUserLogin() {
//        guard let safeUser = realm().safeUser() else {
//            navigateUser(nil)
//            return
//        }
//        navigateUser(safeUser)
//    }
    

//    private func navigateUser(_ user: User?) {
//        if user == nil {
//            launchActivity(MasterUserActivity.self) // Replace with your method to launch MasterUserActivity
//        }
//        launchActivity(MasterUserActivity.self) // Replace with your method to launch MasterUserActivity
//    }
}
