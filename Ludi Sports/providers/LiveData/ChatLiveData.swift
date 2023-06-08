//
//  ChatLiveData.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 6/1/23.
//

import Foundation
import Firebase
import RealmSwift

//protocol ValueEventListener {
//    func onDataChange(snapshot: DataSnapshot)
//    func onCancelled(error: Error)
//}

class ChatLiveData: NSObject {
    private let realmIds: [String]
    private let realmInstance: Realm
    private var fireReferences: [String: DatabaseReference] = [:]
    private var notificationTokens: [NotificationToken] = []
    private var reference: DatabaseReference
    private var enabled = false
    
    init(realmIds: [String], realmInstance: Realm, fun: @escaping (() -> Void)) {
        self.realmIds = realmIds
        self.realmInstance = realmInstance
        self.reference = Database.database().reference().child(DatabasePaths.chat.rawValue)
        super.init()
        createObservers()
        observeRealmIds(completion: fun)
    }
    
    // Create Observer Pairs
    func createObservers() {
        for realmId in realmIds {
            let referenceChild = reference.child(realmId)
            fireReferences[realmId] = referenceChild
            if enabled {
                referenceChild.observe(.value, with: { [weak self] snapshot in
                    self?.onDataChange(snapshot: snapshot)
                })
            }
        }
    }
    
    func observeRealmIds(completion: (() -> Void)? = nil) {
        let results = realmInstance.objects(Chat.self)
        for result in results {
            let token = result.observe { _ in
                let currentList = self.realmIds.compactMap { id in
                    self.realmInstance.object(ofType: Chat.self, forPrimaryKey: id)
                }
                if currentList.contains(result) {
                    completion?()
                }
            }
            notificationTokens.append(token)
        }
    }
    
    // Firebase Observer
    private func onDataChange(snapshot: DataSnapshot) {
        if let chatData = snapshot.value as? [String: Any] {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: chatData, options: [])
                let decoder = JSONDecoder()
                let chat = try decoder.decode(Chat.self, from: jsonData)
                // Handle the updated chat object here
                // ...
            } catch {
                // Error handling
                print("Error decoding chat data: \(error)")
            }
        }
    }
    
    // Enable/Disable Helpers
    func enable() {
        if enabled { return }
        enabled = true
        for (_, reference) in fireReferences {
            reference.observe(.value, with: { [weak self] snapshot in
                self?.onDataChange(snapshot: snapshot)
            })
        }
    }
    
    func disable() {
        if !enabled { return }
        enabled = false
        for (_, reference) in fireReferences {
            reference.removeAllObservers()
        }
    }
}
