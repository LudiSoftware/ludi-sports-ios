//
//  FireTeam.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/12/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase

//fireGetTeamsAsync Doesn't work
//Have to get teams and put them into realm, teams based on CoachId

// Function to get teams from Firebase based on userId and store them in Realm
func fireGetTeamsAsync(teamId: String, realm: Realm) {
    
    firebaseDatabase(collection: DatabasePaths.teams.rawValue) { ref in
        ref.child(teamId).observeSingleEvent(of: .value) { snapshot, _ in
            var _ = snapshot.toLudiObject(Team.self, realm: realm)
           
           
        }
    }
    
}
