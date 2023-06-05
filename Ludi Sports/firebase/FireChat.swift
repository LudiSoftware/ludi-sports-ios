//
//  FireChat.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/22/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase

func fireGetChatAsync(teamId: String, block: @escaping ([Chat]?) -> Void) {
    
    firebaseDatabase(collection: DatabasePaths.chat.rawValue) { ref in
        ref.child(teamId).observeSingleEvent(of: .value) { snapshot, _ in
            var chats = snapshot as? [Chat]
            block(chats)
            
        }
    }
    
}

//func fireGetChatAsync(teamId: String, realm: Realm) {
//
//    firebaseDatabase(collection: DatabasePaths.chat.rawValue) { ref in
//        ref.observeSingleEvent(of: .value) { snapshot, _ in
//            var _ = snapshot.toLudiObjects(Chat.self)
//
//
//
//
//        }
//    }
//
//}

