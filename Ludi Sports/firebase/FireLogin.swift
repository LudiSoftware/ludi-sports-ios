//
//  FireLogin.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//

import Foundation
import FirebaseDatabase
import RealmSwift

func fireSyncUserWithDatabase(coreFireUser: User, completion: @escaping (User?) -> Void) {
    let tempRealm = try! Realm()
    let firebaseDatabase = Database.database().reference()
    
    firebaseDatabase.child(DatabasePaths.users.rawValue).child(coreFireUser.id).observeSingleEvent(of: .value) { snapshot, _ in
        if let userData = snapshot.value as? [String: Any] {
            let realmUser = User(value: userData)
            try? tempRealm.write {
                tempRealm.add(realmUser, update: .modified)
            }
            
            tempRealm.safeUser { user in
                print("User Found: \(user.id)")
                user.updateFieldsAndSave(newObject: coreFireUser, realm: tempRealm)
                
                // Check if is Coach.
//                if user.coach {
//                    tempRealm.fireGetCoachProfileCustom(userId: user.id)
//                }
                
                // TODO: parent, player
                completion(user)
                return
            }
        }
    }
}
