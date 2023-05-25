//
//  FireChat.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/22/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase

func fireGetChatAsync(realm: Realm) {
    
    firebaseDatabase(collection: DatabasePaths.chat.rawValue) { ref in
        ref.observeSingleEvent(of: .value) { snapshot, _ in
            var _ = snapshot.toLudiObject(Chat.self)
            
            
           
        }
    }
    
}

