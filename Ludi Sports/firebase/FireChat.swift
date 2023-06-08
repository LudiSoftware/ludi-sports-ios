//
//  FireChat.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/22/23.
//

import Foundation
import RealmSwift
import FirebaseDatabase

func fireGetChatAsync(teamId: String, completion: @escaping ([Chat]?) -> Void) {
    let chatRef = Database.database().reference().child("chat").child(teamId)
    chatRef.keepSynced(true)
    
    
    chatRef.observeSingleEvent(of: .value) { snapshot in
            guard let chatSnapshots = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(nil)
                return
            }
            
            let chats = chatSnapshots.compactMap { Chat.fromSnapshot($0) }
            completion(chats)
        }
    }

extension Chat {
    static func fromSnapshot(_ snapshot: DataSnapshot) -> Chat? {
        guard let chatData = snapshot.value as? [String: Any] else {
            return nil
        }
        
        let chat = Chat()
        chat.id = snapshot.key
        chat.senderId = chatData["senderId"] as? String
        chat.senderName = chatData["senderName"] as? String
        chat.chatId = chatData["chatId"] as? String
        chat.receiverId = chatData["receiverId"] as? String
        chat.messageText = chatData["messageText"] as? String
        chat.timestamp = chatData["timestamp"] as? Int ?? 0
        
        return chat
    }
}

extension Chat {
    func toDictionary() -> [String: Any] {
        var chatDict: [String: Any] = [:]
        chatDict["senderId"] = self.senderId
        chatDict["senderName"] = self.senderName
        chatDict["chatId"] = self.chatId
        chatDict["receiverId"] = self.receiverId
        chatDict["messageText"] = self.messageText
        chatDict["timestamp"] = self.timestamp
        return chatDict
    }
}


 
//        if let error = error {
//            print("Failed to get chat: \(error)")
//            block(nil)
//            return
//        }
//
//        guard let snapshotDict = snapshot.value as? [String: Any] else {
//            block(nil)
//            return
//        }
//
//        let chats = snapshotDict.compactMap { _, value -> Chat? in
//            guard let chatDict = value as? [String: Any] else {
//                return nil
//            }
//            return Dictionary(chatDict) as! Chat
//        }
        
//        block(chats)
//    }
//}
//
//



//func fireGetChatAsync(teamId: String, block: @escaping ([Chat]?) -> Void) {
//    firebaseDatabase(collection: DatabasePaths.chat.rawValue) { ref in
//        ref.child(teamId).observeSingleEvent(of: .value) { snapshot, _ in
//            guard let childSnapshots = snapshot.children.allObjects as? [DataSnapshot] else {
//                block(nil)
//                return
//            }
//
//            let chats = childSnapshots.compactMap { snapshot -> Chat? in
//                guard let chatDict = snapshot.value as? [String: Any] else {
//                    return nil
//                }
//                return Chat(value: chatDict)
//            }
//
//            block(chats)
//        }
//    }
//}

//func fireGetChatAsync(teamId: String, block: @escaping ([Chat]?) -> Void) {
//
//    firebaseDatabase(collection: DatabasePaths.chat.rawValue) { ref in
//        ref.child(teamId).observeSingleEvent(of: .value) { snapshot, _ in
//            var chats = snapshot as? [Chat]
//            block(chats)
//
//        }
//    }
//
//}

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

