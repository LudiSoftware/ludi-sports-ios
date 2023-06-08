//
//  FireGetNotesAsync.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/21/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase

func fireGetNotesAsync(realm: Realm) {
    
    firebaseDatabase(collection: DatabasePaths.notes.rawValue) { ref in
        ref.observeSingleEvent(of: .value) { snapshot, _ in
            var _ = snapshot.toLudiObjects(Note.self)
            
           
        }
    }
    
}

