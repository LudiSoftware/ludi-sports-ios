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
        realmInstance.safeUser { user in
            navigateUser(user)
            return
        }
        navigateUser(nil)
    }
    

    private func navigateUser(_ user: User?) {
        if user == nil {
            launchViewController(type: AuthControllerViewController.self) // Replace with your method to launch MasterUserActivity
        }
        launchViewController(type: AuthControllerViewController.self) // Replace with your method to launch MasterUserActivity
    }
}


extension UIViewController {
    func launchViewController<T: UIViewController>(type: T.Type) {
        let viewController = T()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
