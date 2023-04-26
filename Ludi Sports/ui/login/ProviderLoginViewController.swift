//
//  ProviderLoginViewController.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/26/23.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseEmailAuthUI
import FirebaseGoogleAuthUI

class ProviderLoginViewController: UIViewController, FUIAuthDelegate {
    
    let authUI = FUIAuth.defaultAuthUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth(),
            FUIGoogleAuth()
        ]
        
        authUI?.providers = providers
        authUI?.delegate = self
        authUI?.shouldHideCancelButton = true
        
        let authViewController = authUI?.authViewController()
        present(authViewController!, animated: true, completion: nil)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: FirebaseAuth.User?, error: Error?) {
        if let user = user {
            // Successfully signed in
            handleFireUserLogin(firebaseUser: user)
        } else {
            print("Login Failed!")
            // Navigate to AuthControllerActivity
        }
    }
    
    private func handleFireUserLogin(firebaseUser: FirebaseAuth.User?) {
        let user = firebaseUser?.fromFirebaseToRealmUser()
        saveProfileToFirebaseUI(user: user)
    }
    
    private func saveProfileToFirebaseUI(user: User?) {
        if user == nil {
            // Navigate to AuthControllerActivity
        }
//        fireSyncUserWithDatabase(user) {
//            // Navigate to AuthControllerActivity
//        }
    }
}
