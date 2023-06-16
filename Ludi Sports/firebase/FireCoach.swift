//
//  FireCoach.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/15/23.
//

import Foundation
import RealmSwift

func fireGetCoachAsync(userId: String, realm: Realm) {
    
    firebaseDatabase(collection: DatabasePaths.coaches.rawValue) { ref in
        ref.child(userId).observeSingleEvent(of: .value) { snapshot, _ in
            var coach = snapshot.toLudiObject(Coach.self, realm: realm)
            print(coach)
           
        }
    }
    
}
