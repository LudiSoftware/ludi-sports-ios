//
//  FireRoster.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase

func fireGetRosterAsync(rosterID: String, realm: Realm) {
    
    firebaseDatabase(collection: DatabasePaths.rosters.rawValue) { ref in
        ref.child(rosterID).observeSingleEvent(of: .value) { snapshot, _ in
            var _ = snapshot.toLudiObject(Roster.self, realm: realm)
           
           
        }
    }
    
}
