//
//  FireLogin.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import RealmSwift

//func fireSyncUserWithDatabase(coreFireUser: User, completion: @escaping (User?) -> Void) {
//    let tempRealm = try! Realm()
//    let firebaseDatabase = Database.database().reference()
//
//    firebaseDatabase.child(DatabasePaths.users.rawValue).child(coreFireUser.id).observeSingleEvent(of: .value) { snapshot, _ in
//        var user = snapshot.toLudiObject(User.self, realm: tempRealm)
//
//        var userIsCoach = user?.coach
//
//        if let userIsCoach{
//            fireGetCoachAsync(userId: user.id, realm: tempRealm)
//        }
//
//        // TODO: parent, player
//        completion(user)
//        return
//
//
//
//        }
//    }

func fireSyncUserWithDatabase(coreFireUser: User, completion: @escaping (User?) -> Void) {
    let tempRealm = try! Realm()
    let firebaseDatabase = Database.database().reference()

    firebaseDatabase.child(DatabasePaths.users.rawValue).child(coreFireUser.id).observeSingleEvent(of: .value) { (snapshot) in
        guard let snapshotValue = snapshot.value as? [String: Any] else {
            // Failed to retrieve user data from Firebase
            completion(nil)
            return
        }

        // Convert the snapshot value to a dictionary and create a new User object in Realm
        let user = User()
        user.id = coreFireUser.id
        user.name = snapshotValue["name"] as? String ?? ""
        // Set other properties of the User object as needed

        let isCoach = snapshotValue["coach"] as? Bool ?? false
        if isCoach {
            fireGetCoachAsync(userId: user.id, realm: tempRealm)
        }

        // TODO: Handle parent and player data if needed

        // Save the User object to Realm
        do {
            try tempRealm.write {
                tempRealm.add(user, update: .modified)
            }
            print("User added to Realm successfully")
        } catch {
            print("Failed to add user to Realm: \(error)")
        }

        completion(user)
    }
}


