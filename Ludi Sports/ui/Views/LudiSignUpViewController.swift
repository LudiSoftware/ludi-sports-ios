//
//  LudiSignUpViewController.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/26/23.
//

import Foundation
import UIKit
import FirebaseAuth

class LudiSignUpViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userName: UITextField!  // Username = email address
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var btnUploadImage: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var checkCoach: UISwitch!
    @IBOutlet weak var checkParent: UISwitch!
    @IBOutlet weak var checkBasic: UISwitch!
    
    var userTypeSelection: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the back button color to white
        navigationController?.navigationBar.tintColor = UIColor.white
        
        btnUploadImage.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        
//        btnSignIn.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
//        setupCheckboxes()
    }
    
    @objc func uploadImage() {
           let imagePicker = UIImagePickerController()
           imagePicker.delegate = self
           imagePicker.sourceType = .photoLibrary
           imagePicker.allowsEditing = false
           present(imagePicker, animated: true, completion: nil)
       }
       
      @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           dismiss(animated: true, completion: nil)
           
           guard let selectedImage = info[.originalImage] as? UIImage else {
               return
           }
           
           profileImage.image = selectedImage
       }
       
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           dismiss(animated: true, completion: nil)
       }
    @objc private func signInButtonTapped() {
        if isUsernamePasswordValid() {
            checkIfEmailExists()
        }
    }
    
//    private func setupCheckboxes() {
//        checkCoach.onValueChanged = { is in
//            if isChecked {
//                self.checkParent.isChecked = false
//                self.checkBasic.isChecked = false
//                self.userTypeSelection = "Coach"
//            } else if !self.checkParent.isChecked && !self.checkBasic.isChecked {
//                self.userTypeSelection = ""
//            }
//        }
//
//        checkParent.onValueChanged = { isChecked in
//            if isChecked {
//                self.checkCoach.isChecked = false
//                self.checkBasic.isChecked = false
//                self.userTypeSelection = "Parent"
//            } else if !self.checkCoach.isChecked && !self.checkBasic.isChecked {
//                self.userTypeSelection = ""
//            }
//        }
//
//        checkBasic.onValueChanged = { isChecked in
//            if isChecked {
//                self.checkCoach.isChecked = false
//                self.checkParent.isChecked = false
//                self.userTypeSelection = "Basic"
//            } else if !self.checkCoach.isChecked && !self.checkParent.isChecked {
//                self.userTypeSelection = ""
//            }
//        }
//    }
    
    private func isUsernamePasswordValid() -> Bool {
        let email = userName.text ?? ""
        let passw = password.text ?? ""
        
        if email.isEmpty || passw.isEmpty {
            print("Email or Password cannot be empty")
            return false
        }
        return true
    }
    
    private func checkIfEmailExists() {
        let email = userName.text ?? ""
        Auth.auth().fetchSignInMethods(forEmail: email) { signInMethods, error in
            if let signInMethods = signInMethods, !signInMethods.isEmpty {
                self.onSignUpAndSignInResult()
            } else {
                // Navigate to ProviderLoginActivity
            }
        }
    }
    
    private func onSignUpAndSignInResult() {
        let email = userName.text ?? ""
        let passw = password.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: passw) { authResult, error in
            if let _ = authResult {
                print("createUserWithEmail:success")
                Auth.auth().signIn(withEmail: email, password: passw) { authResult, error in
                    if let authResult = authResult {
                        print("signInWithEmail:success")
                        self.handleFireUserLogin(authResult.user)
                    } else {
                        print("signInWithEmail:failure")
                        self.userName.text = ""
                        self.password.text = ""
                    }
                }
            } else {
                print("createUserWithEmail:failure")
                self.userName.text = ""
                self.password.text = ""
            }
        }
    }
    
    private func handleFireUserLogin(_ firebaseUser: FirebaseAuth.User?) {
        let user = firebaseUser?.fromFirebaseToRealmUser()
        saveProfileToFirebaseUI(user: user)
    }
    
    private func saveProfileToFirebaseUI(user: User?) {
        if user == nil {
            // Navigate to AuthControllerActivity
            print("")
        }
        print("")
    }
}
