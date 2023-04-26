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
    
    var realmInstance = realm()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        verifyUserLogin()
    }
    
    private func verifyUserLogin() {
        if let user = realmInstance.realmUser() {
            navigateUser(user)
        } else {
            navigateUser(nil)
        }
    }
    
    private func navigateUser(_ user: User?) {
        if user == nil {
            return segue("toLudiLogin") // Replace with your method to launch MasterUserActivity
        }
        return self.segue("toMainDashboard") // Replace with your method to launch MasterUserActivity
    }
}

extension UIViewController {
    func segue(_ identifier: String) {
        self.performSegue(withIdentifier: identifier, sender: nil)
    }
}

