//
//  FireSports.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/26/23.
//

import Foundation
import FirebaseDatabase
import RealmSwift

func fireGetSportsAsync(realm: Realm) {
    
    firebaseDatabase(collection: DatabasePaths.sports.rawValue) { ref in
        ref.observeSingleEvent(of: .value) { snapshot, _ in
            var _ = snapshot.toLudiObjects(Sport.self)
           
        }
    }
    
}
