//
//  LudiLoginViewController.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//

import Foundation
import UIKit
import FirebaseAuth
//import FirebaseDatabaseUI

class LudiLoginActivity: UIViewController {

    @IBOutlet weak var loginProgressBar: UIActivityIndicatorView!
    @IBOutlet weak var editUsername: UITextField!
    @IBOutlet weak var editPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLoginSignUp: UIButton!
    
    var emailInput: String = ""
    var passwordInput: String = ""
    
    var auth: Auth? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        auth = Auth.auth()
        
        hideProgressBar()
        
        btnLoginSignUp.addTarget(self, action: #selector(launchSignUpActivity), for: .touchUpInside)
        btnLogin.addTarget(self, action: #selector(doLogin), for: .touchUpInside)
        
        editPassword.addTarget(self, action: #selector(doLogin), for: .editingDidEndOnExit)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func showProgressBar() {
        loginProgressBar.startAnimating()
    }
    
    private func hideProgressBar() {
        loginProgressBar.stopAnimating()
    }
    
    @objc private func doLogin() {
        showProgressBar()
        if isUsernamePasswordValid() {
            checkIfEmailExists()
        } else {
            hideProgressBar()
        }
    }
    
    private func isUsernamePasswordValid() -> Bool {
        emailInput = editUsername.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        passwordInput = editPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if emailInput.isEmpty {
            editUsername.makeRed()
            print("Email or Password cannot be empty")
            return false
        }
        if passwordInput.isEmpty {
            editPassword.makeRed()
            print("Email or Password cannot be empty")
            return false
        }
        return true
    }
    
    private func checkIfEmailExists() {
        if emailInput.isEmpty { return }
        auth?.fetchSignInMethods(forEmail: emailInput, completion: { result, error in
            if let signInMethods = result {
                if !signInMethods.isEmpty {
                    self.onSignInResult()
                } else {
                    self.hideProgressBar()
//                    self.launchViewController(type: ProviderLoginActivity.self)
                }
            } else {
                print("Error checking email existence")
            }
        })
    }
    
    private func onSignInResult() {
        auth?.signIn(withEmail: emailInput, password: passwordInput, completion: { result, error in
            self.hideProgressBar()
            if let user = result?.user {
                print("signInWithEmail:success")
                self.handleFireUserLogin(firebaseUser: user)
            } else {
                print("signInWithEmail:failure")
                self.editUsername.text = ""
                self.editPassword.text = ""
            }
        })
    }
    
    private func handleFireUserLogin(firebaseUser: FirebaseAuth.User) {
        let user = firebaseUser.fromFirebaseToRealmUser()
        saveProfileToFirebaseUI(user: user)
    }
    
    private func saveProfileToFirebaseUI(user: User?) {
        if user == nil {
            segue("")
        } else {
            print("todo")
//            fireSyncUserWithDatabase(user: user!) {
//                self.launchViewController(type: AuthControllerViewController.self)
//            }
        }
    }
    
    @objc private func launchSignUpActivity() {
        print("launchViewController")
//        launchViewController(type: LudiSignUpActivity.self)
    }
}


extension UITextField {
    func makeRed() {
        let defaultColor = UIColor(named: "ysrFadedRed") ?? UIColor.red
        self.layer.borderColor = defaultColor.cgColor
        self.layer.borderWidth = 1.0
    }
}
